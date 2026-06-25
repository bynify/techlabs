# Events Code Rules

Applies to: `src/events/**`

## Requirements
- Event versioning (for backward compatibility)
- Schema registry usage
- Ordering guarantees where needed
- Outbox pattern for consistency
- Event sourcing patterns

## Patterns
- Use semantic event names
- Include event metadata (timestamp, source, version)
- Use outbox pattern for transactional events
- Document event schemas

## Anti-patterns
- Do not change event schemas without versioning
- Do not assume event ordering without partitioning
- Do not skip event validation
