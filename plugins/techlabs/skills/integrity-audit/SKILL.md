# integrity-audit

Audit existing code against TechLabs conventions and generate compliance report.

## When to Use
- Before starting restructure work
- After partial adoption to check progress
- During CI/CD to enforce conventions
- Periodically to track compliance

## Execution

### Step 1: Load Convention Rules
```
READ rules/*.md:
- Extract patterns and requirements
- Build checklist per rule

RULES:
api-code.md:
  - Versioning required (v1, v2)
  - REST conventions (GET/POST/PUT/PATCH/DELETE)
  - Consistent error format
  - Pagination (cursor-based preferred)
  - Rate limiting
  - No GET for mutations

auth-code.md:
  - No hardcoded secrets
  - Environment variables for config
  - JWT/token validation
  - Session management

backend-code.md:
  - Error wrapping (Go: fmt.Errorf("context: %w", err))
  - Context usage for cancellation
  - Defer for cleanup
  - Max function length: 50 lines
  - Max file length: 500 lines

frontend-code.md:
  - React patterns (hooks, not class)
  - Accessibility (aria labels, keyboard nav)
  - No inline styles (use CSS modules/styled)
  - Component splitting

messaging-code.md:
  - Idempotency keys
  - Dead letter queues
  - Retry with backoff
  - Event versioning

test-standards.md:
  - Test files co-located or in tests/
  - No test code in production
  - Descriptive test names
  - Arrange-Act-Assert pattern
```

### Step 2: Scan Codebase
```
FOR EACH rule:
1. Find files matching rule's path pattern
2. Check each file against rule requirements
3. Classify: PASS / FAIL / WARNING

SCAN COMMANDS:
- Find API routes: grep -r "router\.\|app\.\|handler\|Handler" --include="*.ts" --include="*.go" --include="*.py"
- Find secrets: grep -rn "password\|secret\|token\|key" --include="*.ts" --include="*.go" --include="*.py" --include="*.env*"
- Find error handling: grep -rn "catch\|error\|Error\|err\b" --include="*.ts" --include="*.go"
- Find tests: find . -name "*test*" -o -name "*spec*" -o -name "*_test.go"
```

### Step 3: Generate Report
```
CREATE docs/INTEGRITY-AUDIT-YYYY-MM-DD.md:

# Integrity Audit Report

**Date:** [current date]
**Project:** [project name]
**Total Files Scanned:** [count]
**Overall Compliance:** [X]%

## Summary
| Category | Passed | Failed | Warning | N/A |
|----------|--------|--------|---------|-----|
| API Code | 12 | 3 | 2 | 0 |
| Auth | 5 | 1 | 0 | 0 |
| Backend | 20 | 8 | 4 | 0 |
| Frontend | 15 | 5 | 3 | 0 |
| Messaging | 8 | 2 | 1 | 0 |
| Tests | 25 | 10 | 5 | 0 |
| **Total** | **85** | **29** | **15** | **0** |

## Critical Issues (Must Fix)
[List of blocking issues]

1. **[FAIL] src/api/users.ts:15** — No API versioning
   - Route: GET /users
   - Fix: Prefix with /v1/users

2. **[FAIL] src/auth/config.ts:3** — Hardcoded secret
   - Line: const SECRET = "abc123..."
   - Fix: Use process.env.API_SECRET

3. **[FAIL] src/backend/handler.go:45** — Function too long
   - Length: 78 lines (max: 50)
   - Fix: Extract helper functions

## Warnings (Should Fix)
[List of non-blocking issues]

1. **[WARN] src/frontend/Button.tsx:12** — Missing aria-label
   - Component: <button onClick={...}>
   - Fix: Add aria-label="..."

2. **[WARN] src/api/orders.ts:8** — No pagination
   - Endpoint: GET /orders
   - Fix: Add cursor-based pagination

## Passed Checks
[List of compliant items]

## By Rule

### api-code.md
**Compliance:** 75%
- ✅ REST conventions followed
- ✅ Error format consistent
- ❌ Versioning missing on 3 routes
- ⚠️ No rate limiting on 2 endpoints
- ❌ Pagination missing on 1 endpoint

### auth-code.md
**Compliance:** 83%
- ✅ No hardcoded secrets
- ✅ JWT validation present
- ❌ Session expiry not configured

### backend-code.md
**Compliance:** 68%
- ✅ Context usage good
- ❌ Error wrapping inconsistent
- ⚠️ 3 functions exceed 50 lines
- ❌ 1 file exceeds 500 lines

### frontend-code.md
**Compliance:** 72%
- ✅ Using React hooks
- ✅ Component structure good
- ⚠️ 5 components missing a11y labels
- ❌ 2 components use inline styles

### messaging-code.md
**Compliance:** 80%
- ✅ Idempotency keys present
- ✅ Dead letter queue configured
- ❌ No retry backoff on 1 consumer

### test-standards.md
**Compliance:** 65%
- ✅ Tests exist for main flows
- ✅ Arrange-Act-Assert pattern used
- ❌ 8 source files have no tests
- ⚠️ 5 test files use unclear names

## Remediation Plan

### Priority 1: Critical (Fix Now)
1. Add API versioning to 3 routes
2. Remove hardcoded secret
3. Split oversized functions

### Priority 2: Important (This Week)
1. Add pagination to 1 endpoint
2. Add rate limiting
3. Add error wrapping
4. Fix a11y labels

### Priority 3: Nice to Have (This Month)
1. Add missing tests
2. Remove inline styles
3. Add retry backoff
4. Improve test names

## Trend (If Previous Audit Exists)
| Metric | Previous | Current | Delta |
|--------|----------|---------|-------|
| Overall | 62% | 72% | +10% |
| Critical | 8 | 5 | -3 |
| Warnings | 20 | 15 | -5 |

## Next Audit
Recommended: After completing Priority 1 items
Command: `/integrity-audit`
```

### Step 4: Present Summary
```
SHOW:
- Overall compliance percentage
- Top 3 critical issues
- Quick wins (low effort, high impact)

ASK:
- Run detailed report?
- Auto-fix critical issues?
- Schedule next audit?
```

### Step 5: Optional Auto-Fix
```
IF user approves auto-fix:
1. Show each fix before applying
2. Get confirmation per fix
3. Apply fix
4. Re-scan to verify

AUTO-FIXABLE:
- Add version prefix to API routes
- Replace hardcoded secrets with env vars
- Add missing aria labels
- Add pagination stubs

NOT AUTO-FIXABLE:
- Refactoring long functions
- Adding test coverage
- Restructuring directories
```

## Output
- docs/INTEGRITY-AUDIT-{date}.md (full report)
- Summary with compliance percentage
- Remediation plan with priorities
- Optional: auto-fixed files
