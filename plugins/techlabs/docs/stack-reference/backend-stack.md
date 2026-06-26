# Backend Stack Reference

Backend technology options, frameworks, ORMs, and deployment targets.

## Go

### HTTP Frameworks

| Framework | Type | Performance | Middleware | Learning Curve |
|-----------|------|-------------|------------|----------------|
| Gin | HTTP | High | ✅ | Low |
| Echo | HTTP | High | ✅ | Low |
| Chi | HTTP | High | ✅ | Low |
| Fiber | HTTP | Very High | ✅ | Low |
| Hono | HTTP | Very High | ✅ | Low |
| Gorilla Mux | HTTP | High | ✅ | Low |

### ORMs & Database

| ORM | Database | Features | Learning Curve |
|-----|----------|----------|----------------|
| GORM | PostgreSQL, MySQL, SQLite | Full ORM, migrations, hooks | Medium |
| XORM | PostgreSQL, MySQL, SQLite | ORM, sync, cache | Medium |
| Ent | PostgreSQL, MySQL, SQLite | Code generation, type-safe | High |
| SQLx | PostgreSQL, MySQL, SQLite | Extension of database/sql | Low |
| Bun | PostgreSQL, MySQL, SQLite | Query builder, ORM | Medium |
| pgx | PostgreSQL | Low-level, high performance | Low |
| sqlc | PostgreSQL, MySQL | Type-safe SQL → Go code | Medium |

```bash
# GORM
go get gorm.io/gorm
go get gorm.io/driver/postgres

# XORM
go get xorm.io/xorm

# Ent (code generation)
go get entgo.io/ent/cmd/ent
ent init User

# SQLx
go get github.com/jmoiron/sqlx

# Bun
go get github.com/uptrace/bun

# pgx (low-level)
go get github.com/jackc/pgx/v5

# sqlc (type-safe)
brew install sqlc
sqlc generate
```

### GORM Example
```go
package main

import (
  "gorm.io/gorm"
  "gorm.io/driver/postgres"
)

type User struct {
  gorm.Model
  Name  string
  Email string `gorm:"uniqueIndex"`
  Age   uint
}

func main() {
  db, err := gorm.Open(postgres.Open("dsn"), &gorm.Config{})
  if err != nil {
    panic("failed to connect database")
  }

  // Auto migrate
  db.AutoMigrate(&User{})

  // Create
  db.Create(&User{Name: "John", Email: "john@example.com", Age: 30})

  // Read
  var user User
  db.First(&user, 1) // Find by ID
  db.Where("name = ?", "John").First(&user)

  // Update
  db.Model(&user).Update("Age", 31)

  // Delete
  db.Delete(&user)
}
```

### XORM Example
```go
package main

import (
  "xorm.io/xorm"
  _ "github.com/lib/pq"
)

type User struct {
  Id    int64
  Name  string
  Email string `xorm:"unique"`
  Age   int
}

func main() {
  engine, err := xorm.NewEngine("postgres", "dbname=myapp sslmode=disable")
  if err != nil {
    panic(err)
  }

  // Sync schema
  engine.Sync(&User{})

  // Create
  user := &User{Name: "John", Email: "john@example.com", Age: 30}
  engine.Insert(user)

  // Read
  user = &User{}
  engine.Where("name = ?", "John").Get(user)

  // Update
  user.Age = 31
  engine.ID(user.Id).Update(user)

  // Delete
  engine.ID(user.Id).Delete(&User{})
}
```

### Ent Example
```go
// Generate code first
// ent init User

// schema/user.go
package schema

import (
  "entgo.io/ent"
  "entgo.io/ent/schema/field"
)

type User struct {
  ent.Schema
}

func (User) Fields() []ent.Field {
  return []ent.Field{
    field.String("name"),
    field.String("email").Unique(),
    field.Int("age").Positive(),
  }
}

// Usage
client, _ := ent.Open("postgres", "dsn")

// Create
user, _ := client.User.
  Create().
  SetName("John").
  SetEmail("john@example.com").
  SetAge(30).
  Save(ctx)

// Query
user, _ = client.User.
  Query().
  Where(user.Email("john@example.com")).
  Only(ctx)
```

### SQLc Example
```sql
-- queries.sql
-- name: GetUser :one
SELECT * FROM users WHERE id = $1;

-- name: ListUsers :many
SELECT * FROM users ORDER BY name;

-- name: CreateUser :one
INSERT INTO users (name, email, age) VALUES ($1, $2, $3) RETURNING *;
```

```go
// After running: sqlc generate
queries := db.New(db)

// Create
user, _ := queries.CreateUser(ctx, db.CreateUserParams{
  Name:  "John",
  Email: "john@example.com",
  Age:   30,
})

// Get
user, _ = queries.GetUser(ctx, 1)

// List
users, _ = queries.ListUsers(ctx)
```

### gRPC

```bash
# Install protobuf
brew install protobuf

# Install Go plugins
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```

```protobuf
// user.proto
syntax = "proto3";
package user;

service UserService {
  rpc GetUser(GetUserRequest) returns (User);
  rpc ListUsers(ListUsersRequest) returns (ListUsersResponse);
}

message User {
  int64 id = 1;
  string name = 2;
  string email = 3;
}
```

## Python

### HTTP Frameworks

| Framework | Type | Performance | Async | Learning Curve |
|-----------|------|-------------|-------|----------------|
| FastAPI | HTTP | High | ✅ | Low |
| Django | Full-stack | Medium | ✅ | Medium |
| Flask | HTTP | Medium | ❌ | Low |
| Starlette | HTTP | High | ✅ | Low |
| Sanic | HTTP | Very High | ✅ | Medium |

### ORMs & Database

| ORM | Database | Features | Learning Curve |
|-----|----------|----------|----------------|
| SQLAlchemy | PostgreSQL, MySQL, SQLite | Full ORM, migrations | Medium |
| Django ORM | PostgreSQL, MySQL, SQLite | Integrated, migrations | Low |
| Tortoise | PostgreSQL, MySQL, SQLite | Async ORM | Medium |
| Peewee | PostgreSQL, MySQL, SQLite | Lightweight | Low |
| SQLModel | PostgreSQL, MySQL, SQLite | FastAPI + SQLAlchemy | Low |
| Prisma | PostgreSQL, MySQL, SQLite | Type-safe, migrations | Medium |

```bash
# SQLAlchemy
pip install sqlalchemy alembic

# Django ORM
pip install django

# Tortoise (async)
pip install tortoise-orm

# Peewee
pip install peewee

# SQLModel (FastAPI)
pip install sqlmodel

# Prisma
pip install prisma
prisma generate
```

### SQLAlchemy Example
```python
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import declarative_base, sessionmaker

Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    
    id = Column(Integer, primary_key=True)
    name = Column(String)
    email = Column(String, unique=True)
    age = Column(Integer)

engine = create_engine("postgresql://user:pass@localhost/myapp")
Session = sessionmaker(bind=engine)
session = Session()

# Create
user = User(name="John", email="john@example.com", age=30)
session.add(user)
session.commit()

# Read
user = session.query(User).filter_by(name="John").first()

# Update
user.age = 31
session.commit()

# Delete
session.delete(user)
session.commit()
```

### Tortoise (Async) Example
```python
from tortoise import Tortoise, fields
from tortoise.models import Model

class User(Model):
    id = fields.IntField(pk=True)
    name = fields.CharField(max_length=100)
    email = fields.CharField(max_length=100, unique=True)
    age = fields.IntField()

async def main():
    await Tortoise.init(
        db_url="postgres://user:pass@localhost/myapp",
        modules={"models": ["models"]}
    )
    await Tortoise.generate_schemas()
    
    # Create
    user = await User.create(name="John", email="john@example.com", age=30)
    
    # Read
    user = await User.get(name="John")
    
    # Update
    user.age = 31
    await user.save()
    
    # Delete
    await user.delete()
```

### SQLModel (FastAPI) Example
```python
from sqlmodel import SQLModel, Field, Session, create_engine, select

class User(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str
    email: str = Field(unique=True)
    age: int

engine = create_engine("postgresql://user:pass@localhost/myapp")

# Create
with Session(engine) as session:
    user = User(name="John", email="john@example.com", age=30)
    session.add(user)
    session.commit()
    session.refresh(user)

# Read
with Session(engine) as session:
    user = session.exec(select(User).where(User.name == "John")).first()
```

## Rust

### HTTP Frameworks

| Framework | Type | Performance | Async | Learning Curve |
|-----------|------|-------------|-------|----------------|
| Actix | HTTP | Very High | ✅ | High |
| Axum | HTTP | Very High | ✅ | High |
| Rocket | HTTP | High | ✅ | Medium |
| Warp | HTTP | Very High | ✅ | Medium |

### ORMs & Database

| ORM | Database | Features | Learning Curve |
|-----|----------|----------|----------------|
| Diesel | PostgreSQL, MySQL, SQLite | Type-safe, migrations | High |
| SeaORM | PostgreSQL, MySQL, SQLite | Async, dynamic | Medium |
| SQLx | PostgreSQL, MySQL, SQLite | Async, compile-time | Medium |
| Tokio Postgres | PostgreSQL | Low-level, async | Low |

```bash
# Diesel
cargo install diesel_cli
diesel setup

# SeaORM
cargo add sea-orm

# SQLx
cargo add sqlx
```

## Node.js / TypeScript

### HTTP Frameworks

| Framework | Type | Performance | TypeScript | Learning Curve |
|-----------|------|-------------|------------|----------------|
| Express | HTTP | Medium | ✅ | Low |
| Fastify | HTTP | High | ✅ | Low |
| Hono | HTTP | Very High | ✅ | Low |
| Koa | HTTP | Medium | ✅ | Low |
| NestJS | Full-stack | Medium | ✅ | Medium |
| tRPC | RPC | High | ✅ | Medium |

### ORMs & Database

| ORM | Database | Features | Learning Curve |
|-----|----------|----------|----------------|
| Prisma | PostgreSQL, MySQL, SQLite | Type-safe, migrations | Low |
| TypeORM | PostgreSQL, MySQL, SQLite | Decorators, migrations | Medium |
| Drizzle | PostgreSQL, MySQL, SQLite | Type-safe, SQL-like | Low |
| Knex | PostgreSQL, MySQL, SQLite | Query builder | Low |
| Sequelize | PostgreSQL, MySQL, SQLite | Full ORM | Medium |
| MikroORM | PostgreSQL, MySQL, SQLite | Unit of Work | Medium |
| Kysely | PostgreSQL, MySQL, SQLite | Type-safe query builder | Low |

```bash
# Prisma
npm install prisma
npx prisma init

# TypeORM
npm install typeorm

# Drizzle
npm install drizzle-orm

# Knex
npm install knex

# Sequelize
npm install sequelize

# MikroORM
npm install @mikro-orm/core

# Kysely
npm install kysely
```

### Prisma Example
```typescript
// schema.prisma
model User {
  id    Int     @id @default(autoincrement())
  name  String
  email String  @unique
  age   Int
}

// Usage
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

// Create
const user = await prisma.user.create({
  data: { name: 'John', email: 'john@example.com', age: 30 },
})

// Read
const user = await prisma.user.findUnique({
  where: { email: 'john@example.com' },
})

// Update
const user = await prisma.user.update({
  where: { id: 1 },
  data: { age: 31 },
})

// Delete
const user = await prisma.user.delete({
  where: { id: 1 },
})
```

### Drizzle Example
```typescript
import { drizzle } from 'drizzle-orm/node-postgres'
import { pgTable, serial, text, integer } from 'drizzle-orm/pg-core'

const users = pgTable('users', {
  id: serial('id').primaryKey(),
  name: text('name').notNull(),
  email: text('email').notNull().unique(),
  age: integer('age').notNull(),
})

const db = drizzle(process.env.DATABASE_URL!)

// Create
const user = await db.insert(users).values({
  name: 'John',
  email: 'john@example.com',
  age: 30,
}).returning()

// Read
const user = await db.select().from(users).where(eq(users.email, 'john@example.com'))

// Update
const user = await db.update(users).set({ age: 31 }).where(eq(users.id, 1))

// Delete
const user = await db.delete(users).where(eq(users.id, 1))
```

## Database Options

### PostgreSQL

| Option | Hosting | Cost | Features |
|--------|---------|------|----------|
| Self-hosted | Docker/VM | Free | Full control |
| AWS RDS | Managed | $15+/mo | Backups, scaling |
| GCP Cloud SQL | Managed | $15+/mo | Backups, scaling |
| Neon | Serverless | Free tier | Branching |
| Supabase | Managed | Free tier | Auth, realtime |
| PlanetScale | Serverless | Free tier | MySQL, branching |
| Cloudflare D1 | Serverless | Free tier | SQLite, edge |

### Redis

| Option | Hosting | Cost | Features |
|--------|---------|------|----------|
| Self-hosted | Docker | Free | Full control |
| Upstash | Serverless | Free tier | Edge, REST |
| Redis Cloud | Managed | $5+/mo | Full Redis |
| AWS ElastiCache | Managed | $15+/mo | Scaling |
| Cloudflare KV | Serverless | Free tier | Global, edge |

## Stack Recommendations

### SaaS Web App
```
Frontend: Next.js + Tailwind + shadcn/ui
Backend: Cloudflare Workers + Hono
ORM: Drizzle (edge-compatible)
Database: Cloudflare D1 (SQLite)
Cache: Cloudflare KV
Auth: Better Auth / Lucia
Hosting: Cloudflare Pages + Workers
```

### API Service (High Performance)
```
Backend: Go + Chi/Fiber
ORM: GORM or Ent
Database: PostgreSQL
Cache: Redis
Messaging: NATS
Hosting: Docker + K8s
```

### Real-time App
```
Frontend: Next.js/React
Backend: Go + Hono or Python + FastAPI
ORM: GORM or SQLModel
Database: PostgreSQL
Real-time: NATS/WebSockets
Cache: Redis
Hosting: Cloudflare Workers
```

### Data Platform
```
Backend: Python + FastAPI
ORM: SQLAlchemy or SQLModel
Database: PostgreSQL + dbt
ETL: Apache Airflow
Storage: S3/R2
Hosting: Docker + K8s
```
