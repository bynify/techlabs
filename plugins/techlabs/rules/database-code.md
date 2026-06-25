# Database Code Rules

Applies to: `src/database/**`

## Requirements
- Migration safety (rollback support)
- Proper indexing
- Soft deletes (recommended)
- Row-level security (RLS) when needed
- Connection pooling

## Patterns
- Use migrations for all schema changes
- Add indexes for common queries
- Use transactions for multi-table operations
- Document schema changes

## Anti-patterns
- Do not run migrations in production without testing
- Do not drop columns without migration
- Do not skip backups
