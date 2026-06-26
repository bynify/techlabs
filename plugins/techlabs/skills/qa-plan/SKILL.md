# qa-plan

Create comprehensive QA plan with test strategy and quality gates.

## When to Use

## Agents to Dispatch
- quality-lead: QA strategy
- lead-engineer: Test plan
- New project setup
- Sprint planning
- Before major releases

## Execution

### Step 1: Test Strategy
```markdown
## Test Strategy

### Test Pyramid
- Unit Tests: 70% (fast, isolated, many)
- Integration Tests: 20% (API, DB, realistic)
- E2E Tests: 10% (critical paths, slow, few)

### Coverage Targets
- Overall: >80%
- New code: >90%
- Critical paths: 100%

### Test Types
| Type | Speed | Scope | Frequency |
|------|-------|-------|-----------|
| Unit | Fast | Function | Every commit |
| Integration | Medium | API/DB | Every PR |
| E2E | Slow | Full app | Pre-release |
| Performance | Slow | System | Weekly |
```

### Step 2: Quality Gates
```yaml
# Quality Gates

pre_merge:
  - name: All unit tests pass
    command: npm test
  - name: No lint errors
    command: npm run lint
  - name: TypeScript compiles
    command: npm run typecheck
  - name: Coverage > 80%
    command: npm run test:coverage

pre_release:
  - name: Integration tests pass
    command: npm run test:integration
  - name: E2E tests pass
    command: npm run test:e2e
  - name: Performance benchmarks
    command: npm run test:perf
  - name: Security scan clean
    command: npm audit
```

### Step 3: Test Scenarios
```markdown
## Feature: User Authentication

### Happy Path
1. User enters valid credentials → Login success
2. User sees dashboard after login

### Edge Cases
3. User enters invalid password → Error message
4. User account is locked → Lockout message
5. Session expires → Redirect to login

### Security
6. SQL injection attempt → Blocked
7. Brute force attempt → Rate limited
8. Token manipulation → Invalidated
```

### Step 4: Bug Triage Process
```
SEVERITY:
- P0 (Critical): System down, data loss → Fix immediately
- P1 (High): Major feature broken → Fix within 24h
- P2 (Medium): Minor feature issue → Fix within sprint
- P3 (Low): Cosmetic issue → Backlog
```

## Output
- Test strategy document
- Quality gates configuration
- Test scenarios
- Bug triage process
