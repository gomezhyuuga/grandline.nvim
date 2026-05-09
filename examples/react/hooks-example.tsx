/**
 * Grand Line Theme - React Hooks Example
 * Advanced hooks patterns and custom hook implementations
 */

import {
  useState,
  useEffect,
  useReducer,
  useCallback,
  useMemo,
  useRef,
  useImperativeHandle,
  useLayoutEffect,
  forwardRef,
  type Reducer,
  type RefObject,
  type ForwardedRef,
} from "react";

// ============================================
// useReducer Example
// ============================================
interface PirateState {
  crew: string[];
  captain: string | null;
  isOnAdventure: boolean;
  treasure: number;
}

type PirateAction =
  | { type: "SET_CAPTAIN"; payload: string }
  | { type: "ADD_MEMBER"; payload: string }
  | { type: "REMOVE_MEMBER"; payload: string }
  | { type: "START_ADVENTURE" }
  | { type: "END_ADVENTURE"; payload: number }
  | { type: "RESET" };

const initialState: PirateState = {
  crew: [],
  captain: null,
  isOnAdventure: false,
  treasure: 0,
};

const pirateReducer: Reducer<PirateState, PirateAction> = (state, action) => {
  switch (action.type) {
    case "SET_CAPTAIN":
      return { ...state, captain: action.payload };

    case "ADD_MEMBER":
      return {
        ...state,
        crew: [...state.crew, action.payload],
      };

    case "REMOVE_MEMBER":
      return {
        ...state,
        crew: state.crew.filter((member) => member !== action.payload),
      };

    case "START_ADVENTURE":
      return { ...state, isOnAdventure: true };

    case "END_ADVENTURE":
      return {
        ...state,
        isOnAdventure: false,
        treasure: state.treasure + action.payload,
      };

    case "RESET":
      return initialState;

    default:
      return state;
  }
};

function usePirateCrew() {
  const [state, dispatch] = useReducer(pirateReducer, initialState);

  const setCaptain = useCallback((name: string) => {
    dispatch({ type: "SET_CAPTAIN", payload: name });
  }, []);

  const addMember = useCallback((name: string) => {
    dispatch({ type: "ADD_MEMBER", payload: name });
  }, []);

  const removeMember = useCallback((name: string) => {
    dispatch({ type: "REMOVE_MEMBER", payload: name });
  }, []);

  const startAdventure = useCallback(() => {
    dispatch({ type: "START_ADVENTURE" });
  }, []);

  const endAdventure = useCallback((treasureFound: number) => {
    dispatch({ type: "END_ADVENTURE", payload: treasureFound });
  }, []);

  const reset = useCallback(() => {
    dispatch({ type: "RESET" });
  }, []);

  return {
    ...state,
    setCaptain,
    addMember,
    removeMember,
    startAdventure,
    endAdventure,
    reset,
  };
}

// ============================================
// useRef & useImperativeHandle Example
// ============================================
interface LogPoseHandle {
  pointToIsland: (island: string) => void;
  getCurrentTarget: () => string | null;
  reset: () => void;
}

interface LogPoseProps {
  onNavigate?: (island: string) => void;
}

const LogPose = forwardRef<LogPoseHandle, LogPoseProps>(
  ({ onNavigate }, ref: ForwardedRef<LogPoseHandle>) => {
    const [targetIsland, setTargetIsland] = useState<string | null>(null);
    const compassRef = useRef<HTMLDivElement>(null);
    const animationRef = useRef<number | null>(null);

    useImperativeHandle(
      ref,
      () => ({
        pointToIsland: (island: string) => {
          setTargetIsland(island);
          onNavigate?.(island);
        },
        getCurrentTarget: () => targetIsland,
        reset: () => setTargetIsland(null),
      }),
      [targetIsland, onNavigate]
    );

    useLayoutEffect(() => {
      if (compassRef.current && targetIsland) {
        // Synchronous DOM measurement
        const rect = compassRef.current.getBoundingClientRect();
        console.log("Compass dimensions:", rect.width, rect.height);
      }
    }, [targetIsland]);

    useEffect(() => {
      // Animate compass needle
      const animate = () => {
        if (compassRef.current) {
          const rotation = Math.sin(Date.now() / 1000) * 10;
          compassRef.current.style.transform = `rotate(${rotation}deg)`;
        }
        animationRef.current = requestAnimationFrame(animate);
      };

      animationRef.current = requestAnimationFrame(animate);

      return () => {
        if (animationRef.current) {
          cancelAnimationFrame(animationRef.current);
        }
      };
    }, []);

    return (
      <div className="log-pose">
        <div ref={compassRef} className="compass-needle" />
        {targetIsland && <span>Navigating to: {targetIsland}</span>}
      </div>
    );
  }
);

LogPose.displayName = "LogPose";

// ============================================
// Custom Hook with Cleanup
// ============================================
function useEventListener<K extends keyof WindowEventMap>(
  eventName: K,
  handler: (event: WindowEventMap[K]) => void,
  element: Window | HTMLElement | null = window
): void {
  const savedHandler = useRef(handler);

  useLayoutEffect(() => {
    savedHandler.current = handler;
  }, [handler]);

  useEffect(() => {
    if (!element) return;

    const eventListener = (event: WindowEventMap[K]) => {
      savedHandler.current(event);
    };

    element.addEventListener(eventName, eventListener as EventListener);

    return () => {
      element.removeEventListener(eventName, eventListener as EventListener);
    };
  }, [eventName, element]);
}

// ============================================
// useLocalStorage Hook
// ============================================
function useLocalStorage<T>(
  key: string,
  initialValue: T
): [T, (value: T | ((prev: T) => T)) => void] {
  const [storedValue, setStoredValue] = useState<T>(() => {
    if (typeof window === "undefined") {
      return initialValue;
    }

    try {
      const item = window.localStorage.getItem(key);
      return item ? (JSON.parse(item) as T) : initialValue;
    } catch (error) {
      console.warn(`Error reading localStorage key "${key}":`, error);
      return initialValue;
    }
  });

  const setValue = useCallback(
    (value: T | ((prev: T) => T)) => {
      try {
        const valueToStore =
          value instanceof Function ? value(storedValue) : value;
        setStoredValue(valueToStore);

        if (typeof window !== "undefined") {
          window.localStorage.setItem(key, JSON.stringify(valueToStore));
        }
      } catch (error) {
        console.warn(`Error setting localStorage key "${key}":`, error);
      }
    },
    [key, storedValue]
  );

  return [storedValue, setValue];
}

// ============================================
// usePrevious Hook
// ============================================
function usePrevious<T>(value: T): T | undefined {
  const ref = useRef<T>();

  useEffect(() => {
    ref.current = value;
  }, [value]);

  return ref.current;
}

// ============================================
// useInterval Hook
// ============================================
function useInterval(callback: () => void, delay: number | null): void {
  const savedCallback = useRef(callback);

  useLayoutEffect(() => {
    savedCallback.current = callback;
  }, [callback]);

  useEffect(() => {
    if (delay === null) return;

    const tick = () => savedCallback.current();
    const id = setInterval(tick, delay);

    return () => clearInterval(id);
  }, [delay]);
}

// ============================================
// useToggle Hook
// ============================================
function useToggle(
  initialValue: boolean = false
): [boolean, () => void, (value: boolean) => void] {
  const [value, setValue] = useState(initialValue);

  const toggle = useCallback(() => {
    setValue((prev) => !prev);
  }, []);

  const setValueDirectly = useCallback((newValue: boolean) => {
    setValue(newValue);
  }, []);

  return [value, toggle, setValueDirectly];
}

// ============================================
// useAsync Hook
// ============================================
interface AsyncState<T> {
  data: T | null;
  loading: boolean;
  error: Error | null;
}

function useAsync<T>(
  asyncFunction: () => Promise<T>,
  immediate: boolean = true
): AsyncState<T> & { execute: () => Promise<void> } {
  const [state, setState] = useState<AsyncState<T>>({
    data: null,
    loading: immediate,
    error: null,
  });

  const execute = useCallback(async () => {
    setState({ data: null, loading: true, error: null });

    try {
      const response = await asyncFunction();
      setState({ data: response, loading: false, error: null });
    } catch (error) {
      setState({
        data: null,
        loading: false,
        error: error instanceof Error ? error : new Error(String(error)),
      });
    }
  }, [asyncFunction]);

  useEffect(() => {
    if (immediate) {
      execute();
    }
  }, [execute, immediate]);

  return { ...state, execute };
}

// ============================================
// Demo Component
// ============================================
function HooksDemo() {
  // useReducer
  const pirateCrew = usePirateCrew();

  // useRef
  const logPoseRef = useRef<LogPoseHandle>(null);

  // useLocalStorage
  const [savedIsland, setSavedIsland] = useLocalStorage<string>(
    "lastIsland",
    "Foosha Village"
  );

  // useToggle
  const [isMenuOpen, toggleMenu] = useToggle(false);

  // usePrevious
  const previousIsland = usePrevious(savedIsland);

  // useInterval
  const [seconds, setSeconds] = useState(0);
  useInterval(() => {
    setSeconds((s) => s + 1);
  }, 1000);

  // useEventListener
  useEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      toggleMenu();
    }
  });

  // useMemo for expensive calculation
  const totalCrewPower = useMemo(() => {
    return pirateCrew.crew.reduce((power, member) => {
      // Simulate expensive calculation
      return power + member.length * 100;
    }, 0);
  }, [pirateCrew.crew]);

  const handleNavigate = useCallback((island: string) => {
    console.log(`Setting sail for ${island}!`);
    setSavedIsland(island);
  }, [setSavedIsland]);

  return (
    <div className="hooks-demo">
      <h1>Hooks Demo</h1>

      <section>
        <h2>Pirate Crew (useReducer)</h2>
        <p>Captain: {pirateCrew.captain ?? "None"}</p>
        <p>Crew: {pirateCrew.crew.join(", ") || "Empty"}</p>
        <p>Treasure: {pirateCrew.treasure} berries</p>
        <p>Power Level: {totalCrewPower}</p>
      </section>

      <section>
        <h2>Navigation (useRef + useImperativeHandle)</h2>
        <LogPose ref={logPoseRef} onNavigate={handleNavigate} />
        <button onClick={() => logPoseRef.current?.pointToIsland("Laugh Tale")}>
          Navigate to Laugh Tale
        </button>
      </section>

      <section>
        <h2>Storage (useLocalStorage)</h2>
        <p>Current Island: {savedIsland}</p>
        <p>Previous Island: {previousIsland ?? "None"}</p>
      </section>

      <section>
        <h2>Timer (useInterval)</h2>
        <p>Time sailing: {seconds} seconds</p>
      </section>

      <section>
        <h2>Menu (useToggle)</h2>
        <button onClick={toggleMenu}>
          {isMenuOpen ? "Close Menu" : "Open Menu"}
        </button>
        {isMenuOpen && <nav>Menu content here...</nav>}
      </section>
    </div>
  );
}

export {
  usePirateCrew,
  useEventListener,
  useLocalStorage,
  usePrevious,
  useInterval,
  useToggle,
  useAsync,
  LogPose,
  HooksDemo,
};

export type { LogPoseHandle, PirateState, PirateAction };
