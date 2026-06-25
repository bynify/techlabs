# create-migration

Create database migration with rollback support.

## Execution

### Step 1: Gather Requirements
```
ASK USER:
1. What changes are needed?
2. Which tables are affected?
3. Are there data migrations needed?
4. What's the rollback strategy?
```

### Step 2: Generate Migration
```
CREATE migrations/{timestamp}_{name}.up.sql:
-- Migration Up
-- Description: [What this migration does]

-- Example: Add column
ALTER TABLE users ADD COLUMN phone VARCHAR(20);

-- Example: Create index
CREATE INDEX idx_users_email ON users(email);

-- Example: Data migration
UPDATE users SET status = 'active' WHERE status IS NULL;
```

```
CREATE migrations/{timestamp}_{name}.down.sql:
-- Migration Down
-- Rollback for: [What this migration does]

-- Example: Remove column
ALTER TABLE users DROP COLUMN phone;

-- Example: Drop index
DROP INDEX idx_users_email;
```

### Step 3: Validate
```
CHECK:
- Migration has both up and down
- Down migration actually rolls back
- No data loss in down migration
- Indexes are necessary
- No breaking changes
```

### Step 4: Test
```
RUN:
- Apply migration to test database
- Verify schema changes
- Run down migration
- Verify rollback works
- Re-apply migration
```

### Step 5: Document
```
UPDATE docs/database/migrations.md:
- Add migration to list
- Document any special considerations
```

## Output
- Created migration files
- Updated documentation
- Test results
