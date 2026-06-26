# gate-check

Pre-deployment quality gate checks.

## When to Use

## Agents to Dispatch
- quality-lead: Quality gates
- lead-engineer: Code standards
- Quality gates
- Pre-deploy checks
- Code quality
- Release readiness

## Execution

### Step 1: Run Checks
```
CHECKLIST:
- [ ] All tests passing
- [ ] No lint errors
- [ ] No type errors
- [ ] Coverage > 80%
- [ ] No critical vulnerabilities
- [ ] Build succeeds
- [ ] Documentation updated
```

### Step 2: Run Commands
```bash
npm test
npm run lint
npm run typecheck
npm run build
```

### Step 3: Report
```
GATE STATUS: ✅ PASS / ❌ FAIL

Tests:     ✅ 145/145 passing
Lint:      ✅ 0 errors
Types:     ✅ 0 errors
Coverage:  ✅ 87%
Security:  ✅ 0 critical
Build:     ✅ Success
```

## Output
- Gate check results
- Pass/fail status
- Issues list
