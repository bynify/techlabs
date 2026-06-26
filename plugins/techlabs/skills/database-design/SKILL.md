# database-design

Design database schema with proper normalization, indexes, and constraints.

## When to Use
- New feature schema
- Schema optimization
- Data modeling


## Agents to Dispatch
- postgres-specialist: Schema design
- data-engineer: Data modeling

## Execution

### Step 1: Identify Entities
```
ASK USER:
1. What entities exist?
2. Relationships between them?
3. Access patterns?
4. Data volume estimates?
```

### Step 2: Design Schema
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE RESTRICT,
  status VARCHAR(50) NOT NULL DEFAULT 'pending',
  total DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status) WHERE status = 'pending';
```

### Step 3: Add Constraints
```sql
ALTER TABLE orders ADD CONSTRAINT positive_total CHECK (total >= 0);
ALTER TABLE orders ADD CONSTRAINT valid_status 
  CHECK (status IN ('pending', 'processing', 'completed', 'cancelled'));
```

### Step 4: Document
```markdown
# Schema Documentation

## Users
- Primary store for user accounts
- Email must be unique

## Orders
- Tracks user purchases
- Status lifecycle: pending → processing → completed
- Soft deletes not implemented (use status='cancelled')
```

## Output
- DDL scripts
- ER diagram
- Index strategy
- Documentation
