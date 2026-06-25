# restructure-plan

Generate phased restructure blueprint for existing project.

## When to Use
- After `/adopt-existing` and `/remap-paths`
- Want to gradually restructure code to match conventions
- Need effort estimates before committing
- Team needs approval before restructuring

## Execution

### Step 1: Load Context
```
READ:
- CLAUDE.md (current config)
- docs/ADOPTION-PLAN.md (existing plan)
- rules/*.md (conventions to target)
- Project structure (find . -type f, exclude node_modules, .git, dist)
```

### Step 2: Analyze Current vs Target
```
COMPARE:

Current State:
- Directory layout
- File naming conventions
- Code patterns (error handling, auth, testing)
- Import paths
- Config locations

Target State (from rules):
- api-code.md: versioning, pagination, error format
- auth-code.md: no hardcoded secrets, env vars
- backend-code.md: error wrapping, context, defer
- frontend-code.md: React patterns, a11y
- messaging-code.md: idempotency, dead letters
- test-standards.md: coverage, patterns

OUTPUT:
- Files that need moving
- Files that need renaming
- Code patterns that need fixing
- Config that needs updating
```

### Step 3: Generate Phases
```
CREATE PHASES:

### Phase 1: Non-Breaking Setup (0 code changes)
- Add/update CLAUDE.md with path mappings
- Enable hooks
- Add rule files if missing
- Create docs structure
Effort: 1-2 hours

### Phase 2: Convention Compliance (safe changes)
- Fix auth violations (secrets → env vars)
- Add API versioning
- Standardize error formats
- Add missing types/interfaces
Effort: 4-8 hours

### Phase 3: File Restructuring (import changes)
- Move files to new directories
- Update import paths
- Update config references
Effort: 4-16 hours (depends on project size)

### Phase 4: Code Pattern Updates (behavioral changes)
- Refactor error handling patterns
- Add context.Context usage (Go)
- Update middleware patterns
- Add idempotency keys (messaging)
Effort: 8-24 hours

### Phase 5: Test & CI Updates
- Update test file locations
- Update CI/CD paths
- Update linting rules
- Update build scripts
Effort: 4-12 hours

### Phase 6: Documentation
- Update README
- Generate API docs
- Update architecture docs
- Document decisions in ADRs
Effort: 2-4 hours
```

### Step 4: Create Effort Matrix
```
GENERATE TABLE:

| Phase | Files Changed | Effort | Risk | Prerequisite |
|-------|--------------|--------|------|--------------|
| 1. Setup | 3-5 | 1-2h | None | None |
| 2. Compliance | 5-20 | 4-8h | Low | Phase 1 |
| 3. Restructure | 20-100 | 4-16h | Medium | Phase 2 |
| 4. Patterns | 10-50 | 8-24h | Medium | Phase 3 |
| 5. Test/CI | 5-15 | 4-12h | Low | Phase 4 |
| 6. Docs | 5-10 | 2-4h | None | Phase 5 |

Total: 48-66 hours across 2-4 weeks
```

### Step 5: Risk Assessment
```
IDENTIFY RISKS:

High Risk:
- Renaming directories used by imports (breaks builds)
- Changing error formats (breaks error handling)
- Moving auth code (security implications)

Medium Risk:
- Updating middleware order
- Changing test locations
- Refactoring patterns

Low Risk:
- Adding CLAUDE.md
- Adding hook configs
- Updating docs
- Adding types/interfaces

MITIGATION:
- For each risk, provide mitigation strategy
- Recommend backup/rollback approach
```

### Step 6: Generate Checklist
```
CREATE docs/RESTRUCTURE-CHECKLIST.md:

# Restructure Checklist

## Phase 1: Setup
- [ ] CLAUDE.md updated with path mappings
- [ ] Hook configs reviewed
- [ ] docs/ directory created
- [ ] Rule files present

## Phase 2: Compliance
- [ ] Auth: secrets moved to env vars
- [ ] API: versioning added to routes
- [ ] Errors: consistent format implemented
- [ ] Types: interfaces defined

## Phase 3: Restructure
- [ ] API files moved to target directory
- [ ] Backend files moved
- [ ] Frontend files moved
- [ ] Auth files consolidated
- [ ] Imports updated
- [ ] Build config updated

## Phase 4: Patterns
- [ ] Error handling refactored
- [ ] Context usage added (Go)
- [ ] Middleware patterns updated
- [ ] Idempotency keys added (messaging)

## Phase 5: Test & CI
- [ ] Test files moved
- [ ] Test paths updated in config
- [ ] CI/CD paths updated
- [ ] Linting rules updated

## Phase 6: Documentation
- [ ] README updated
- [ ] Architecture docs updated
- [ ] ADRs created for decisions
- [ ] API docs generated
```

### Step 7: Present to User
```
SHOW:
1. Effort matrix
2. Risk assessment
3. Phase breakdown
4. Recommended start point

ASK:
- Approve plan?
- Want to start executing phases?
- Need to adjust scope?
- Which phase to start with?
```

## Output
- Phase breakdown with effort estimates
- Risk assessment with mitigations
- docs/RESTRUCTURE-CHECKLIST.md
- Recommended execution order
