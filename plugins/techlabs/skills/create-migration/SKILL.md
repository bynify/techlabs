# create-migration

Database migration with rollback support.

## When to Use
- Schema changes
- Data migrations
- Index additions

## Execution

### Step 1: Create Migration
```sql
-- migrations/001_add_user_roles.up.sql
CREATE TABLE user_roles (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  role VARCHAR(50) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, role)
);

CREATE INDEX idx_user_roles_user ON user_roles(user_id);

-- migrations/001_add_user_roles.down.sql
DROP TABLE user_roles;
```

### Step 2: Data Migration
```sql
-- migrations/002_backfill_user_roles.up.sql
INSERT INTO user_roles (user_id, role)
SELECT id, 'user' FROM users
WHERE id NOT IN (SELECT user_id FROM user_roles);
```

### Step 3: Go Migration Runner
```go
func (m *Migrator) Up(ctx context.Context) error {
    migrations, err := m.getPendingMigrations()
    if err != nil {
        return fmt.Errorf("get pending: %w", err)
    }
    for _, migration := range migrations {
        if err := m.runMigration(ctx, migration); err != nil {
            return fmt.Errorf("run %s: %w", migration.Name, err)
        }
    }
    return nil
}
```

## Output
- Migration files (up/down)
- Rollback tested
- Data migration if needed
