# qa-report

QA must create documentation for testing results.

## When to Use
- After QA testing
- Test results documentation
- Bug reports
- Quality assessment

## Agents to Dispatch
- quality-lead: QA review
- lead-engineer: Technical review

## Enforcement

```
⚠️ MANDATORY: QA report required before story completion

FLOW:
  review-doc (review report)
       ↓
  qa-plan (testing)
       ↓
  qa-report (THIS SKILL) ← MANDATORY
       ↓
  story-done (final verification)

IF no QA report → BLOCK story completion
```

## Execution

### Step 1: Load QA Context
```
READ:
- production/stories/{story-id}.md
- production/reviews/{story-id}.md
- Test results
- Bug reports
```

### Step 2: Create QA Report Template
```markdown
# QA Report: {story-id}

## Test Details
- **Story:** {story title}
- **Tester:** {QA name}
- **Date:** {date}
- **Environment:** staging/production

## Test Summary
**Overall Status:** ✅ PASSED / ⚠️ PASSED WITH ISSUES / ❌ FAILED

## Test Coverage

### Functional Tests
| Test Case | Status | Notes |
|-----------|--------|-------|
| {test case 1} | ✅ PASS | {notes} |
| {test case 2} | ✅ PASS | {notes} |
| {test case 3} | ❌ FAIL | {bug report} |

### Edge Cases
| Scenario | Status | Notes |
|----------|--------|-------|
| {scenario 1} | ✅ PASS | {notes} |
| {scenario 2} | ⚠️ PARTIAL | {notes} |

### Error Handling
| Error Case | Status | Notes |
|------------|--------|-------|
| Invalid input | ✅ PASS | Error message shown |
| Network error | ✅ PASS | Retry works |
| Timeout | ⚠️ PARTIAL | Needs improvement |

### Performance
| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| Response time | <500ms | 350ms | ✅ PASS |
| Memory usage | <100MB | 80MB | ✅ PASS |
| CPU usage | <50% | 30% | ✅ PASS |

### Security
| Check | Status | Notes |
|-------|--------|-------|
| Input validation | ✅ PASS | All inputs validated |
| Authentication | ✅ PASS | JWT working |
| Authorization | ✅ PASS | RBAC enforced |
| SQL injection | ✅ PASS | Parameterized queries |

## Bugs Found

### Critical (Must Fix)
| Bug ID | Description | Steps to Reproduce | Status |
|--------|-------------|-------------------|--------|
| BUG-001 | {description} | {steps} | Open |

### Important (Should Fix)
| Bug ID | Description | Steps to Reproduce | Status |
|--------|-------------|-------------------|--------|
| BUG-002 | {description} | {steps} | Open |

### Minor (Nice to Fix)
| Bug ID | Description | Steps to Reproduce | Status |
|--------|-------------|-------------------|--------|
| BUG-003 | {description} | {steps} | Open |

## Acceptance Criteria Verification
| Criteria | Status | Evidence |
|----------|--------|----------|
| {criteria 1} | ✅ PASS | {screenshots/logs} |
| {criteria 2} | ✅ PASS | {screenshots/logs} |
| {criteria 3} | ❌ FAIL | {screenshots/logs} |

## Documentation Verification
| Document | Status | Notes |
|----------|--------|-------|
| README updated | ✅ | New commands documented |
| API docs updated | ✅ | Endpoints documented |
| Changelog updated | ✅ | Entry added |

## Quality Metrics
- Test cases executed: {X}
- Test cases passed: {X}
- Test cases failed: {X}
- Code coverage: {X}%
- Critical bugs: {X}
- Important bugs: {X}

## Recommendations
1. {recommendation 1}
2. {recommendation 2}

## Sign-off
- [ ] All test cases executed
- [ ] All critical bugs fixed
- [ ] All acceptance criteria met
- [ ] Documentation verified
- [ ] Ready for production

## Next Steps
- If passed: Proceed to story-done
- If issues: Return to dev-story with QA report
- If bugs: Create bug stories
```

### Step 3: Present QA Report
```
SHOW QA report to user

ASK:
"QA report ready. Options:
1. Approve (proceed to story-done)
2. Report bugs (create bug stories)
3. Return to dev-story"
```

### Step 4: Save QA Report
```
SAVE TO:
- production/qa-reports/{story-id}.md

UPDATE:
- story.qaStatus = "completed"
- story.qaReport = "created"
```

### Step 5: QA Gate
```
IF passed:
  → Proceed to story-done
  → Pass QA report for final verification

IF bugs found:
  → Create bug stories
  → Link to original story
  → Block story until bugs fixed

IF issues:
  → Return to dev-story with QA report
  → Developer reads QA feedback
  → Fix issues
  → Re-test
```

## Output
- QA report created
- Test results documented
- Bugs reported
- Acceptance criteria verified
- Developer can read QA feedback
