# Shared Code Rules

Applies to: `src/shared/**`

## Requirements
- Zero dependencies (or minimal)
- Type-only exports preferred
- Validation schemas (Zod)
- No runtime side effects
- Tree-shakeable

## Patterns
- Use TypeScript interfaces/types
- Use Zod for runtime validation
- Export utility functions
- Keep it framework-agnostic

## Anti-patterns
- Do not import from frontend/backend
- Do not use platform-specific APIs
- Do not have side effects on import
