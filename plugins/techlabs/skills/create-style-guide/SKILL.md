# create-style-guide

Create coding style guide for consistent codebase.

## When to Use
- Team onboarding
- Code quality standards
- Refactoring standards

## Execution

### Step 1: Define Standards
```markdown
# Style Guide

## Naming
- Variables: camelCase
- Components: PascalCase
- Files: kebab-case
- Constants: UPPER_SNAKE_CASE

## Files
- One component per file
- Tests next to source
- Types in separate files

## Comments
- JSDoc for public APIs
- No comments for obvious code
- TODO format: TODO(username): description
```

### Step 2: ESLint Config
```json
{
  "rules": {
    "no-console": "warn",
    "no-unused-vars": "error",
    "prefer-const": "error",
    "react-hooks/rules-of-hooks": "error"
  }
}
```

### Step 3: Prettier Config
```json
{
  "semi": true,
  "singleQuote": true,
  "trailingComma": "es5",
  "printWidth": 100
}
```

## Output
- Style guide document
- Linting config
- Formatting config
- Example snippets
