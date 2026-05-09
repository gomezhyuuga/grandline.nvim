/**
 * Grand Line Theme - React/TSX Example
 * This file demonstrates syntax highlighting for React components
 */

import React, {
  useState,
  useEffect,
  useCallback,
  useMemo,
  useRef,
  createContext,
  useContext,
  type ReactNode,
  type FC,
  type MouseEvent,
  type ChangeEvent,
} from "react";

// ============================================
// Types & Interfaces
// ============================================
interface CrewMember {
  id: string;
  name: string;
  role: string;
  bounty: number;
  image?: string;
}

interface CrewContextType {
  members: CrewMember[];
  addMember: (member: CrewMember) => void;
  removeMember: (id: string) => void;
  totalBounty: number;
}

type ButtonVariant = "primary" | "secondary" | "danger";
type Size = "sm" | "md" | "lg";

// ============================================
// Context
// ============================================
const CrewContext = createContext<CrewContextType | null>(null);

const useCrewContext = (): CrewContextType => {
  const context = useContext(CrewContext);
  if (!context) {
    throw new Error("useCrewContext must be used within CrewProvider");
  }
  return context;
};

// ============================================
// Custom Hooks
// ============================================
function useDebounce<T>(value: T, delay: number): T {
  const [debouncedValue, setDebouncedValue] = useState<T>(value);

  useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedValue(value);
    }, delay);

    return () => {
      clearTimeout(timer);
    };
  }, [value, delay]);

  return debouncedValue;
}

function useFetch<T>(url: string): {
  data: T | null;
  loading: boolean;
  error: Error | null;
} {
  const [data, setData] = useState<T | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    const controller = new AbortController();

    async function fetchData() {
      try {
        const response = await fetch(url, { signal: controller.signal });
        if (!response.ok) throw new Error("Fetch failed");
        const json = await response.json();
        setData(json);
      } catch (err) {
        if (err instanceof Error && err.name !== "AbortError") {
          setError(err);
        }
      } finally {
        setLoading(false);
      }
    }

    fetchData();

    return () => controller.abort();
  }, [url]);

  return { data, loading, error };
}

// ============================================
// Styled Components (using className)
// ============================================
const styles = {
  card: "rounded-lg shadow-md p-4 bg-calm-belt",
  button: "px-4 py-2 rounded font-bold transition-colors",
  primary: "bg-straw text-new-world-night hover:bg-gol-d",
  secondary: "bg-thousand-sunny-deck text-ponegliff-white",
  danger: "bg-gear-red text-snow-white hover:bg-fire-fist",
} as const;

// ============================================
// Basic Components
// ============================================
interface ButtonProps {
  children: ReactNode;
  variant?: ButtonVariant;
  size?: Size;
  disabled?: boolean;
  onClick?: (event: MouseEvent<HTMLButtonElement>) => void;
}

const Button: FC<ButtonProps> = ({
  children,
  variant = "primary",
  size = "md",
  disabled = false,
  onClick,
}) => {
  const sizeClasses = {
    sm: "text-sm px-2 py-1",
    md: "text-base px-4 py-2",
    lg: "text-lg px-6 py-3",
  };

  return (
    <button
      className={`${styles.button} ${styles[variant]} ${sizeClasses[size]}`}
      disabled={disabled}
      onClick={onClick}
      type="button"
      aria-disabled={disabled}
    >
      {children}
    </button>
  );
};

// ============================================
// Card Component with Props Destructuring
// ============================================
interface CardProps {
  title: string;
  subtitle?: string;
  children: ReactNode;
  footer?: ReactNode;
  onClose?: () => void;
}

function Card({ title, subtitle, children, footer, onClose }: CardProps) {
  return (
    <div className={styles.card}>
      <header className="flex justify-between items-center mb-4">
        <div>
          <h2 className="text-xl font-bold text-straw">{title}</h2>
          {subtitle && <p className="text-log-pose text-sm">{subtitle}</p>}
        </div>
        {onClose && (
          <button onClick={onClose} aria-label="Close">
            &times;
          </button>
        )}
      </header>
      <main className="text-ponegliff-white">{children}</main>
      {footer && <footer className="mt-4 pt-4 border-t">{footer}</footer>}
    </div>
  );
}

// ============================================
// Crew Member Component
// ============================================
const CrewMemberCard: FC<{
  member: CrewMember;
  onSelect?: (id: string) => void;
}> = ({ member, onSelect }) => {
  const handleClick = useCallback(() => {
    onSelect?.(member.id);
  }, [member.id, onSelect]);

  const formattedBounty = useMemo(() => {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
      minimumFractionDigits: 0,
    }).format(member.bounty);
  }, [member.bounty]);

  return (
    <div
      className="p-4 rounded-lg bg-thousand-sunny-deck cursor-pointer hover:bg-haki-black"
      onClick={handleClick}
      onKeyDown={(e) => e.key === "Enter" && handleClick()}
      role="button"
      tabIndex={0}
    >
      {member.image && (
        <img
          src={member.image}
          alt={`${member.name} portrait`}
          className="w-20 h-20 rounded-full"
          loading="lazy"
        />
      )}
      <h3 className="font-bold text-lg">{member.name}</h3>
      <p className="text-ichimonji">{member.role}</p>
      <p className="text-gol-d font-mono">{formattedBounty}</p>
    </div>
  );
};

// ============================================
// Form Component with Controlled Inputs
// ============================================
interface FormData {
  name: string;
  role: string;
  bounty: number;
}

function CrewMemberForm({ onSubmit }: { onSubmit: (data: FormData) => void }) {
  const [formData, setFormData] = useState<FormData>({
    name: "",
    role: "",
    bounty: 0,
  });
  const [errors, setErrors] = useState<Partial<FormData>>({});
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    inputRef.current?.focus();
  }, []);

  const handleChange = (
    e: ChangeEvent<HTMLInputElement | HTMLSelectElement>,
  ) => {
    const { name, value, type } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: type === "number" ? Number(value) : value,
    }));
  };

  const validate = (): boolean => {
    const newErrors: Partial<FormData> = {};

    if (!formData.name.trim()) {
      newErrors.name = "Name is required" as any;
    }
    if (formData.bounty < 0) {
      newErrors.bounty = "Bounty must be positive" as any;
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (validate()) {
      onSubmit(formData);
      setFormData({ name: "", role: "", bounty: 0 });
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <label htmlFor="name" className="block text-sm font-medium">
          Name
        </label>
        <input
          ref={inputRef}
          type="text"
          id="name"
          name="name"
          value={formData.name}
          onChange={handleChange}
          className="mt-1 block w-full rounded border-sea-stone"
          placeholder="Enter pirate name"
        />
        {errors.name && (
          <span className="text-fire-fist text-sm">{errors.name}</span>
        )}
      </div>

      <div>
        <label htmlFor="role" className="block text-sm font-medium">
          Role
        </label>
        <select
          id="role"
          name="role"
          value={formData.role}
          onChange={handleChange}
          className="mt-1 block w-full rounded"
        >
          <option value="">Select a role</option>
          <option value="Captain">Captain</option>
          <option value="Swordsman">Swordsman</option>
          <option value="Navigator">Navigator</option>
          <option value="Cook">Cook</option>
          <option value="Doctor">Doctor</option>
        </select>
      </div>

      <div>
        <label htmlFor="bounty" className="block text-sm font-medium">
          Bounty (Berries)
        </label>
        <input
          type="number"
          id="bounty"
          name="bounty"
          value={formData.bounty}
          onChange={handleChange}
          min={0}
          step={1000000}
          className="mt-1 block w-full rounded"
        />
      </div>

      <Button variant="primary" onClick={() => {}}>
        Add Crew Member
      </Button>
    </form>
  );
}

// ============================================
// List with Conditional Rendering
// ============================================
interface CrewListProps {
  members: CrewMember[];
  isLoading?: boolean;
  emptyMessage?: string;
}

const CrewList: FC<CrewListProps> = ({
  members,
  isLoading = false,
  emptyMessage = "No crew members found",
}) => {
  if (isLoading) {
    return (
      <div className="flex items-center justify-center p-8">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-straw" />
        <span className="ml-2">Loading crew...</span>
      </div>
    );
  }

  if (members.length === 0) {
    return (
      <div className="text-center text-log-pose p-8">
        <p>{emptyMessage}</p>
      </div>
    );
  }

  return (
    <ul className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      {members.map((member) => (
        <li key={member.id}>
          <CrewMemberCard member={member} />
        </li>
      ))}
    </ul>
  );
};

// ============================================
// Provider Component
// ============================================
function CrewProvider({ children }: { children: ReactNode }) {
  const [members, setMembers] = useState<CrewMember[]>([]);

  const addMember = useCallback((member: CrewMember) => {
    setMembers((prev) => [...prev, member]);
  }, []);

  const removeMember = useCallback((id: string) => {
    setMembers((prev) => prev.filter((m) => m.id !== id));
  }, []);

  const totalBounty = useMemo(
    () => members.reduce((sum, m) => sum + m.bounty, 0),
    [members],
  );

  const value = useMemo(
    () => ({ members, addMember, removeMember, totalBounty }),
    [members, addMember, removeMember, totalBounty],
  );

  return <CrewContext.Provider value={value}>{children}</CrewContext.Provider>;
}

// ============================================
// Main App Component
// ============================================
export default function App() {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const { data, loading, error } = useFetch<CrewMember[]>("/api/crew");

  const handleAddMember = (formData: FormData) => {
    console.log("Adding member:", formData);
    setIsModalOpen(false);
  };

  return (
    <CrewProvider>
      <div className="min-h-screen bg-new-world-night text-ponegliff-white">
        {/* Header */}
        <header className="bg-calm-belt p-4 shadow-lg">
          <h1 className="text-2xl font-bold text-straw">
            Straw Hat Pirates Crew Manager
          </h1>
        </header>

        {/* Main Content */}
        <main className="container mx-auto p-4">
          <section className="mb-8">
            <div className="flex justify-between items-center mb-4">
              <h2 className="text-xl font-semibold">Crew Members</h2>
              <Button onClick={() => setIsModalOpen(true)}>+ Add Member</Button>
            </div>

            {error ? (
              <Card title="Error" onClose={() => window.location.reload()}>
                <p className="text-fire-fist">{error.message}</p>
              </Card>
            ) : (
              <CrewList members={data ?? []} isLoading={loading} />
            )}
          </section>

          {/* Modal */}
          {isModalOpen && (
            <div className="fixed inset-0 bg-blackbeard/80 flex items-center justify-center">
              <Card
                title="Add New Crew Member"
                subtitle="Fill in the details below"
                onClose={() => setIsModalOpen(false)}
              >
                <CrewMemberForm onSubmit={handleAddMember} />
              </Card>
            </div>
          )}
        </main>

        {/* Footer */}
        <footer className="bg-haki-black p-4 text-center text-sea-stone">
          <p>&copy; {new Date().getFullYear()} Grand Line Theme Demo</p>
        </footer>
      </div>
    </CrewProvider>
  );
}

// ============================================
// Exports
// ============================================
export { Button, Card, CrewList, CrewProvider, useCrewContext };
export type { CrewMember, ButtonVariant, Size };
