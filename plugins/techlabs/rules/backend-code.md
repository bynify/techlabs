# Backend Code Rules

Applies to: `src/backend/**`

## Requirements
- Go patterns: error wrapping, context propagation
- DB transactions with proper rollback
- Graceful shutdown handling
- Request context cancellation
- Structured logging

## Patterns
- Use `fmt.Errorf("context: %w", err)` for error wrapping
- Use `context.Context` for cancellation and tracing
- Use `defer` for cleanup
- Use `sql.Tx` for transactions

## Anti-patterns
- Do not ignore errors
- Do not use global variables for state
- Do not block without context cancellation
