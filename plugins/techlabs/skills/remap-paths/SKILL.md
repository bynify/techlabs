# remap-paths

Override TechLabs path conventions to match existing project structure.

## When to Use
- Project uses different directory layout than plugin conventions
- After `/adopt-existing` identified path mismatches
- Want to keep current structure, not restructure

## Execution

### Step 1: Load Current State
```
READ:
- CLAUDE.md (current config)
- docs/ADOPTION-PLAN.md (if exists)
- Project root structure
```

### Step 2: Scan Available Rules
```
READ rules/*.md:
- Extract "Applies to:" header from each rule
- List all path patterns

FOUND:
- api-code.md → src/api/**
- backend-code.md → src/backend/**
- frontend-code.md → src/frontend/**
- auth-code.md → src/auth/**
- messaging-code.md → src/messaging/**
- database-code.md → src/database/**
- billing-code.md → src/billing/**
- infra-code.md → src/infra/**
- serverless-code.md → src/serverless/**
- events-code.md → src/events/**
- desktop-code.md → src/desktop/**
- mobile-code.md → src/mobile/**
- ai-code.md → src/ai/**
- shared-code.md → src/shared/**
- test-standards.md → **/*_test.go, **/*.test.ts, **/*.test.py
- docs-standards.md → docs/**
```

### Step 3: Discover Project Paths
```
ASK USER OR DETECT:
1. Where is your API code?
   Detected: [list found paths]
   
2. Where is your backend/service code?
   Detected: [list found paths]
   
3. Where is your frontend code?
   Detected: [list found paths]
   
4. Where is your auth logic?
   Detected: [list found paths]
   
5. Where are your tests?
   Detected: [list found paths]
   
6. Where are your docs?
   Detected: [list found paths]
```

### Step 4: Generate Path Map
```
CREATE path mapping:

## TechLabs Path Configuration

### Code Paths
```yaml
# Override default conventions
paths:
  api:
    - app/api/**          # Next.js API routes
    - routes/**           # Express routes
    - cmd/server/handlers/**  # Go handlers
  
  backend:
    - lib/**              # Utility libraries
    - internal/**         # Go internal packages
    - services/**         # Service layer
    - pkg/**              # Go public packages
  
  frontend:
    - components/**       # React components
    - pages/**            # Page components
    - app/**              # Next.js app dir
    - views/**            # View layer
    - templates/**        # Template files
  
  auth:
    - lib/auth/**         # Auth utilities
    - middleware/auth.*    # Auth middleware
    - internal/auth/**    # Go auth package
  
  messaging:
    - queues/**           # Queue handlers
    - events/**           # Event handlers
    - pubsub/**           # Pub/sub handlers
  
  database:
    - db/**               # Database layer
    - migrations/**       # Migrations
    - models/**           # Data models
    - repository/**       # Repository pattern
  
  billing:
    - billing/**          # Billing logic
    - payments/**         # Payment processing
  
  infra:
    - terraform/**        # IaC
    - k8s/**              # Kubernetes
    - deploy/**           # Deploy scripts
  
  ai:
    - ml/**               # ML models
    - agents/**           # AI agents
    - prompts/**          # Prompt templates
  
  shared:
    - utils/**            # Shared utilities
    - common/**           # Common code
    - types/**            # Shared types
    - constants/**        # Constants
  
  tests:
    - **/*.test.*         # Test files
    - **/*.spec.*         # Spec files
    - **/*_test.go        # Go tests
    - tests/**            # Test directory
    - __tests__/**        # Jest directory
  
  docs:
    - docs/**             # Documentation
    - README.md           # Root readme
```

### Step 5: Update Rule Files
```
FOR EACH rule that needs path change:
1. Read original rule
2. Show proposed change
3. Get user approval
4. Update "Applies to:" header

EXAMPLE:
Before: `Applies to: src/api/**`
After:  `Applies to: app/api/**, routes/**`
```

### Step 6: Update CLAUDE.md
```
APPEND TO CLAUDE.md:

## Path Configuration

This project uses custom path mappings. Default TechLabs conventions
have been remapped to match existing structure.

### Custom Paths
- API: app/api/**, routes/**
- Backend: internal/**, lib/**
- Frontend: components/**, app/**
- Auth: lib/auth/**
- Tests: **/*.test.*, tests/**
- Docs: docs/**

### Rule Application
Rules in `rules/*.md` use these paths. When writing code:
- API routes → `app/api/` not `src/api/`
- Components → `components/` not `src/frontend/`
- Utilities → `lib/` not `src/shared/`

See `docs/ADOPTION-PLAN.md` for full mapping.
```

### Step 7: Validate
```
CHECK:
- All code paths map to at least one rule
- No paths left unmapped
- No rule points to non-existent directory
- User confirms mapping is correct
```

## Output
- Path mapping configuration
- Updated rule files (if approved)
- Updated CLAUDE.md with path config
- Validation report
