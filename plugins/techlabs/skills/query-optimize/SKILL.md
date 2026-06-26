# query-optimize

Database query optimization for better performance.

## When to Use
- Slow queries detected
- Performance issues
- Database optimization
- Before scaling

## Execution

### Step 1: Identify Slow Queries
```sql
-- PostgreSQL: Find slow queries
SELECT
  query,
  calls,
  total_time,
  mean_time,
  rows
FROM pg_stat_statements
ORDER BY total_time DESC
LIMIT 10;

-- Enable pg_stat_statements
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
```

### Step 2: Analyze Query Plans
```sql
-- Analyze query
EXPLAIN ANALYZE
SELECT * FROM users
WHERE email = 'user@example.com';

-- Check indexes
SELECT * FROM pg_indexes
WHERE tablename = 'users';
```

### Step 3: Add Indexes
```sql
-- Create index
CREATE INDEX idx_users_email ON users(email);

-- Composite index
CREATE INDEX idx_orders_user_status ON orders(user_id, status);

-- Partial index
CREATE INDEX idx_orders_pending ON orders(created_at)
WHERE status = 'pending';
```

### Step 4: Optimize Queries
```sql
-- Before: Slow query
SELECT * FROM orders
WHERE user_id = 123
AND created_at > '2024-01-01';

-- After: Optimized
SELECT id, status, total FROM orders
WHERE user_id = 123
AND created_at > '2024-01-01'
ORDER BY created_at DESC
LIMIT 50;
```

### Step 5: Query Monitoring
```yaml
# Slow query alerts
slow_queries:
  threshold: 1000ms
  alert: slack
```

## Output
- Slow queries identified
- Query plans analyzed
- Indexes added
- Queries optimized
- Monitoring configured
