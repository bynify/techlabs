# API Code Rules

Applies to: `src/api/**`

## Requirements
- Versioning (v1, v2, etc.)
- Consistent error format
- Pagination (cursor-based preferred)
- OpenAPI specification
- Rate limiting

## Patterns
- Use REST conventions (GET, POST, PUT, PATCH, DELETE)
- Use proper HTTP status codes
- Use consistent error response format
- Document all endpoints

## Anti-patterns
- Do not use GET for mutations
- Do not expose internal errors to clients
- Do not skip rate limiting
