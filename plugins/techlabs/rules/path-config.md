# Path Configuration

Override TechLabs default path conventions.

## Usage
Edit this file to map your project's directory structure to TechLabs conventions.

## Format
```yaml
paths:
  # Maps convention → actual paths
  # Multiple paths supported per convention
  # Glob patterns supported
```

## Example: Next.js App Router
```yaml
paths:
  api: app/api/**
  backend: lib/**, services/**
  frontend: components/**, app/**/**
  auth: lib/auth/**
  shared: utils/**, types/**
  tests: **/*.test.ts, **/*.test.tsx, __tests__/**
  docs: docs/**
```

## Example: Go Monolith
```yaml
paths:
  api: cmd/server/handlers/**
  backend: internal/**, pkg/**
  auth: internal/auth/**
  shared: pkg/**
  tests: **/*_test.go
  docs: docs/**
```

## Example: Express + React
```yaml
paths:
  api: server/routes/**
  backend: server/**
  frontend: client/src/**
  auth: server/middleware/auth.*
  shared: shared/**
  tests: server/**/*.test.js, client/**/*.test.jsx
  docs: docs/**
```

## Default (No Override)
If this file is empty, uses default TechLabs conventions:
- api: src/api/**
- backend: src/backend/**
- frontend: src/frontend/**
- auth: src/auth/**
- shared: src/shared/**
- tests: src/**/*_test.*, src/**/*.test.*
- docs: docs/**
