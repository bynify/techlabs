# Serverless Code Rules

Applies to: `src/serverless/**`

## Requirements
- Edge-compatible only (no Node.js APIs)
- Cloudflare Workers runtime
- Bundle size < 1MB
- Use Web APIs (fetch, Request, Response)
- No filesystem access
- No long-running processes

## Patterns
- Use `export default` for worker entry point
- Use `env` bindings for secrets
- Use `ctx.waitUntil()` for async operations
- Handle errors gracefully with proper status codes

## Anti-patterns
- Do not use `require()` (use ES modules)
- Do not use `process.env` (use `env` bindings)
- Do not use `fs`, `path`, `child_process`
- Do not block the event loop
