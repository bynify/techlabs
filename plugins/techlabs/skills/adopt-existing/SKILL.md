# adopt-existing

Scan existing project and generate adoption plan for TechLabs plugin.

## When to Use
- First time using TechLabs on an existing codebase
- Project already has code, tests, docs
- Need to integrate plugin conventions without breaking things

## Execution

### Step 1: Scan Project Structure
```
READ AND ANALYZE:
- Root directory layout (ls -la)
- package.json / go.mod / Cargo.toml / requirements.txt
- src/ or app/ or lib/ or internal/ — wherever code lives
- tests/ or __tests__/ or *_test.go
- docs/ if exists
- .gitignore
- CLAUDE.md if exists
- Existing linter configs (.eslintrc, .golangci.yml, etc.)
- Existing CI/CD (.github/workflows, .gitlab-ci.yml)
- Docker files if any
```

### Step 2: Detect Tech Stack
```
IDENTIFY:
- Language(s) used
- Framework(s) (Next.js, Express, FastAPI, Go gin, etc.)
- Package manager (npm, yarn, pnpm, go mod, cargo, pip)
- Test framework (jest, vitest, go test, pytest)
- Linter/formatter (eslint, prettier, gofmt, black)
- Deployment target (Vercel, Docker, K8s, Cloudflare)
```

### Step 3: Map Existing Paths to Convention
```
COMPARE:
Current Structure          →  TechLabs Convention
─────────────────────────────────────────────────
app/api/                   →  src/api/
app/lib/                   →  src/backend/
components/                →  src/frontend/
lib/auth/                  →  src/auth/
services/                  →  src/backend/
internal/                  →  src/backend/
pkg/                       →  src/shared/

OUTPUT:
- Direct matches (already aligned)
- Remap needed (path mapping)
- Custom paths (no convention match)
- Conflict paths (multiple source → one target)
```

### Step 4: Assess Convention Compliance
```
CHECK AGAINST rules/*.md:
- api-code.md    → API routes follow REST, versioning, error format?
- backend-code.md → Go/Python patterns followed?
- frontend-code.md → React patterns, a11y?
- auth-code.md   → Secrets handled properly?
- messaging-code.md → Idempotency, dead letters?
- database-code.md → Migration patterns?
- test-standards.md → Test coverage, patterns?
- shared-code.md → Shared code isolation?

OUTPUT per rule:
- PASS: Already compliant
- PARTIAL: Needs minor fixes
- FAIL: Needs restructuring
- N/A: Rule doesn't apply to this project
```

### Step 5: Generate Adoption Plan
```
CREATE docs/ADOPTION-PLAN.md:

# Adoption Plan

## Project Summary
- Type: [SaaS/API/CLI/Desktop/Mobile/AI/ML/Data]
- Stack: [detected stack]
- Current State: [greenfield/early/established/mature]

## Path Mapping
| Current Path | TechLabs Path | Action | Risk |
|-------------|---------------|--------|------|
| app/api/ | src/api/ | remap | low |
| lib/ | src/backend/ | remap | medium |

## Convention Compliance
| Rule | Status | Changes Needed |
|------|--------|----------------|
| api-code | PARTIAL | Add versioning to 3 routes |
| auth-code | FAIL | Move secrets to env vars |

## Adoption Phases
### Phase 1: Non-Breaking (Day 1)
- Add CLAUDE.md with path mappings
- Enable hooks (validate-*, detect-gaps)
- No code changes

### Phase 2: Compliance Fixes (Week 1)
- Fix auth violations
- Add API versioning
- Update error formats

### Phase 3: Restructure (Week 2-3, optional)
- Remap directories if needed
- Consolidate shared code
- Update imports

### Phase 4: Full Integration (Ongoing)
- Agent delegation
- Sprint workflows
- Team coordination

## Risk Assessment
- Low risk: [items]
- Medium risk: [items]
- High risk: [items]

## Estimated Effort
- Phase 1: [hours]
- Phase 2: [hours]
- Phase 3: [hours, optional]
- Phase 4: ongoing
```

### Step 6: Apply Phase 1 (Non-Breaking)
```
CREATE/UPDATE:
- CLAUDE.md (with path mappings, no code changes)
- Enable hooks in session

ASK USER:
- Approve adoption plan?
- Start with Phase 1 now?
- Skip to specific phase?
```

## Output
- Project scan report
- Path mapping table
- Convention compliance report
- Adoption plan (docs/ADOPTION-PLAN.md)
- CLAUDE.md updated with path mappings
