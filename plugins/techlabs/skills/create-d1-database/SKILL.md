# create-d1-database

Cloudflare D1 database with schema, migrations, and type-safe queries.

## When to Use
- Persistent storage for Workers
- Structured data in edge apps
- Simple relational data needs

## Execution

### Step 1: Create Schema
```sql
-- migrations/0001_create_users.sql
CREATE TABLE users (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX idx_users_email ON users(email);
```

### Step 2: Add to wrangler.toml
```toml
[[d1_databases]]
binding = "DB"
database_name = "app-db"
database_id = "xxx"
```

### Step 3: Type-Safe Queries
```typescript
// src/db/queries.ts
import { drizzle } from 'drizzle-orm/d1';
import { users } from './schema';

export function createDB(env: { DB: D1Database }) {
  return drizzle(env.DB);
}

export async function getUser(db: ReturnType<typeof createDB>, id: string) {
  return db.select().from(users).where(eq(users.id, id)).get();
}
```

### Step 4: Run Migrations
```bash
npx wrangler d1 migrations apply app-db
```

## Output
- Migration files
- Schema definition
- Query helpers
- Type definitions
