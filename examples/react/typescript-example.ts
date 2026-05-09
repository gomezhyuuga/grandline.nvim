/**
 * Grand Line Theme - TypeScript Example
 * This file demonstrates syntax highlighting for TypeScript
 */

// ============================================
// Constants & Variables
// ============================================
const CREW_NAME = "Straw Hat Pirates";
const BOUNTY_MULTIPLIER = 1.5;
let currentIsland: string = "Wano";
var legacyVar = true;

// ============================================
// Interfaces & Types
// ============================================
interface CrewMember {
  name: string;
  role: string;
  bounty: number;
  devilFruit?: DevilFruit;
  isAlive: boolean;
}

type DevilFruit = {
  name: string;
  type: "Paramecia" | "Zoan" | "Logia";
  awakened: boolean;
};

type CrewRole = "Captain" | "Swordsman" | "Navigator" | "Cook" | "Doctor";

// ============================================
// Enums
// ============================================
enum Sea {
  East = "East Blue",
  West = "West Blue",
  North = "North Blue",
  South = "South Blue",
  Grand = "Grand Line",
  New = "New World",
}

// ============================================
// Classes
// ============================================
abstract class Pirate {
  protected readonly id: number;
  public name: string;
  private _bounty: number;

  constructor(name: string, bounty: number) {
    this.id = Math.random();
    this.name = name;
    this._bounty = bounty;
  }

  get bounty(): number {
    return this._bounty;
  }

  set bounty(value: number) {
    if (value >= 0) {
      this._bounty = value;
    }
  }

  abstract attack(): void;

  public introduce(): string {
    return `I am ${this.name}, bounty: ${this._bounty} berries!`;
  }
}

class StrawHat extends Pirate {
  public devilFruit: DevilFruit | null;

  constructor(name: string, bounty: number, fruit: DevilFruit | null = null) {
    super(name, bounty);
    this.devilFruit = fruit;
  }

  attack(): void {
    console.log(`${this.name} attacks!`);
  }

  useAbility(): string {
    if (this.devilFruit?.awakened) {
      return `${this.name} uses awakened ${this.devilFruit.name}!`;
    }
    return `${this.name} uses ${this.devilFruit?.name ?? "Haki"}!`;
  }
}

// ============================================
// Functions
// ============================================
function calculateTotalBounty(crew: CrewMember[]): number {
  return crew.reduce((total, member) => total + member.bounty, 0);
}

const getCrewByRole = (crew: CrewMember[], role: string): CrewMember[] => {
  return crew.filter((member) => member.role === role);
};

async function fetchBountyData(id: string): Promise<CrewMember | null> {
  try {
    const response = await fetch(`/api/pirates/${id}`);
    if (!response.ok) {
      throw new Error("Pirate not found");
    }
    return response.json();
  } catch (error) {
    console.error("Failed to fetch:", error);
    return null;
  }
}

// ============================================
// Generics
// ============================================
function findMember<T extends { name: string }>(
  members: T[],
  name: string
): T | undefined {
  return members.find((m) => m.name === name);
}

class TreasureChest<T> {
  private contents: T[] = [];

  add(item: T): void {
    this.contents.push(item);
  }

  retrieve(): T | undefined {
    return this.contents.pop();
  }
}

// ============================================
// Decorators (experimental)
// ============================================
function logExecution(
  target: any,
  propertyKey: string,
  descriptor: PropertyDescriptor
) {
  const original = descriptor.value;
  descriptor.value = function (...args: any[]) {
    console.log(`Calling ${propertyKey} with`, args);
    return original.apply(this, args);
  };
  return descriptor;
}

// ============================================
// Template Literals & Regex
// ============================================
const greeting = `Welcome to the ${CREW_NAME}!`;
const multiLine = `
  This is a multi-line
  template literal string
  with ${currentIsland} interpolation
`;

const bountyPattern = /(\d{1,3}(,\d{3})*|\d+)(\.\d+)?/g;
const nameValidator = new RegExp("^[A-Z][a-z]+$", "i");

// ============================================
// Control Flow
// ============================================
function assessThreat(bounty: number): string {
  if (bounty > 1_000_000_000) {
    return "Emperor Level";
  } else if (bounty > 500_000_000) {
    return "Yonko Commander";
  } else if (bounty > 100_000_000) {
    return "Supernova";
  } else {
    return "Rookie";
  }
}

function processCommand(cmd: string): void {
  switch (cmd) {
    case "sail":
      console.log("Setting sail!");
      break;
    case "anchor":
      console.log("Dropping anchor!");
      break;
    case "fight":
      console.log("Prepare for battle!");
      break;
    default:
      console.warn("Unknown command");
  }
}

// ============================================
// Error Handling
// ============================================
class PirateError extends Error {
  constructor(message: string, public code: number) {
    super(message);
    this.name = "PirateError";
  }
}

function riskyOperation(): never {
  throw new PirateError("Mission failed!", 500);
}

// ============================================
// Type Guards & Assertions
// ============================================
function isDevilFruitUser(member: CrewMember): member is CrewMember & { devilFruit: DevilFruit } {
  return member.devilFruit !== undefined;
}

function assertIsCaptain(member: CrewMember): asserts member is CrewMember & { role: "Captain" } {
  if (member.role !== "Captain") {
    throw new Error("Not the captain!");
  }
}

// ============================================
// Usage Examples
// ============================================
const luffy: CrewMember = {
  name: "Monkey D. Luffy",
  role: "Captain",
  bounty: 3_000_000_000,
  devilFruit: {
    name: "Gomu Gomu no Mi",
    type: "Paramecia",
    awakened: true,
  },
  isAlive: true,
};

const zoro: CrewMember = {
  name: "Roronoa Zoro",
  role: "Swordsman",
  bounty: 1_111_000_000,
  isAlive: true,
};

// Numbers showcase
const integer = 42;
const float = 3.14159;
const hex = 0xff6b7a;
const binary = 0b1010;
const octal = 0o755;
const bigInt = 9007199254740991n;
const scientific = 1.5e10;

// Boolean showcase
const isKing = true;
const isDefeated = false;

// Null and undefined
const unknownFruit: DevilFruit | null = null;
const missingData: string | undefined = undefined;

export { StrawHat, calculateTotalBounty, fetchBountyData, Sea };
export type { CrewMember, DevilFruit, CrewRole };
