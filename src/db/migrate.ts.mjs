import Database from "better-sqlite3";
import { drizzle } from "drizzle-orm/better-sqlite3";
import { migrate } from "drizzle-orm/better-sqlite3/migrator";
import path from "path";

const sqlite = new Database(process.env.DATABASE_URL);
const db = drizzle(sqlite);

const dir = path.dirname("drizzle");
console.log(dir);

// this will automatically run needed migrations on the database
await migrate(db, { migrationsFolder: "./drizzle" });
