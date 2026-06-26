# review-gate

Automated code review checkpoint before story can proceed to QA.

## When to Use
- Post-implementation review
- Code quality gate
- Pre-QA checkpoint
- Sprint story lifecycle

## Review Types

```
REVIEW GATES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

GATE 1: Code Review (human/AI)
  - Code quality
  - Architecture alignment
  - Best practices
  - Naming conventions

GATE 2: Automated Checks (tools)
  - Tests passing
  - Lint clean
  - Types valid
  - Coverage threshold

GATE 3: Security Review (if needed)
  - No secrets in code
  - Input validation
  - Auth checks
  - OWASP compliance

GATE 4: Performance Review (if needed)
  - No N+1 queries
  - Caching strategy
  - Memory leaks
  - Bundle size
```

## Execution

### Step 1: Determine Review Type
```javascript
function getReviewType(story) {
  const types = ['code-review'];
  
  // Always run automated checks
  types.push('automated');
  
  // Security review for auth/security stories
  if (/auth|security|login|jwt|oauth/.test(story.description)) {
    types.push('security');
  }
  
  // Performance review for high-traffic features
  if (/api|endpoint|dashboard|public/.test(story.description)) {
    types.push('performance');
  }
  
  return types;
}
```

### Step 2: Run Automated Checks
```bash
# Run all automated checks
echo "=== AUTOMATED REVIEW ==="

# Tests
echo "Running tests..."
npm test 2>&1
TEST_RESULT=$?

# Lint
echo "Running lint..."
npm run lint 2>&1
LINT_RESULT=$?

# Type check
echo "Running type check..."
npm run typecheck 2>&1
TYPE_RESULT=$?

# Coverage
echo "Checking coverage..."
npm test -- --coverage 2>&1 | grep "Lines"
COVERAGE=$(npm test -- --coverage 2>&1 | grep "Lines" | awk '{print $NF}' | sed 's/%//')

# Security audit
echo "Running security audit..."
npm audit 2>&1
AUDIT_RESULT=$?

# Summary
echo ""
echo "=== RESULTS ==="
[ $TEST_RESULT -eq 0 ] && echo "✅ Tests: PASS" || echo "❌ Tests: FAIL"
[ $LINT_RESULT -eq 0 ] && echo "✅ Lint: PASS" || echo "❌ Lint: FAIL"
[ $TYPE_RESULT -eq 0 ] && echo "✅ Types: PASS" || echo "❌ Types: FAIL"
[ ${COVERAGE:-0} -ge 80 ] && echo "✅ Coverage: ${COVERAGE}%" || echo "❌ Coverage: ${COVERAGE}% (< 80%)"
[ $AUDIT_RESULT -eq 0 ] && echo "✅ Security: PASS" || echo "❌ Security: FAIL"
```

### Step 3: Run Code Review
```markdown
# Code Review Checklist

## Structure
- [ ] Files organized correctly
- [ ] Imports clean (no unused)
- [ ] Functions single responsibility
- [ ] Classes cohesive

## Naming
- [ ] Variables descriptive
- [ ] Functions verb-based
- [ ] Constants UPPER_SNAKE
- [ ] Files kebab-case

## Error Handling
- [ ] Try/catch where needed
- [ ] Errors logged
- [ ] User-friendly messages
- [ ] No swallowed errors

## Testing
- [ ] Unit tests for logic
- [ ] Integration tests for flows
- [ ] Edge cases covered
- [ ] Error cases tested

## Documentation
- [ ] Complex logic commented
- [ ] API docs updated
- [ ] README updated (if needed)
- [ ] Changelog entry
```

### Step 4: Run Security Review (if needed)
```markdown
# Security Review Checklist

## Input Validation
- [ ] All inputs validated
- [ ] SQL injection prevented
- [ ] XSS prevented
- [ ] Path traversal prevented

## Authentication
- [ ] Auth required on protected routes
- [ ] Tokens validated
- [ ] Sessions secure
- [ ] Passwords hashed

## Authorization
- [ ] RBAC enforced
- [ ] Owner checks done
- [ ] Admin routes protected
- [ ] API keys rotated

## Secrets
- [ ] No hardcoded secrets
- [ ] Environment variables used
- [ ] Secrets not logged
- [ ] .env in .gitignore
```

### Step 5: Generate Review Report
```markdown
# Review Report: AUTH-001

## Date: 2024-01-15
## Reviewer: AI Code Review
## Story: Implement JWT Authentication

## Gates Summary

| Gate | Status | Details |
|------|--------|---------|
| Code Review | ✅ PASS | Clean architecture |
| Automated | ✅ PASS | All checks green |
| Security | ⚠️ WARN | 1 minor issue |
| Performance | ✅ PASS | No issues |

## Automated Results
- Tests: 145/145 passing ✅
- Lint: 0 errors, 0 warnings ✅
- Types: 0 errors ✅
- Coverage: 87% ✅
- Security: 0 critical, 1 moderate ⚠️

## Code Review Notes
1. Good separation of concerns
2. Error handling comprehensive
3. Tests well-structured

## Issues Found
1. [MINOR] `npm audit` shows moderate vulnerability in dependency
   - Fix: `npm audit fix`

## Recommendation
- ✅ APPROVE with minor fix
- Fix dependency vulnerability before merge
- Story can proceed to QA after fix
```

### Step 6: Update Story State
```javascript
async function updateStoryAfterReview(storyId, reviewResult) {
  if (reviewResult.status === 'PASS') {
    await updateStoryState(storyId, 'REVIEW_PASSED', {
      reviewReport: reviewResult.report,
      reviewedAt: new Date().toISOString(),
    });
  } else {
    await updateStoryState(storyId, 'REVISION_NEEDED', {
      reviewReport: reviewResult.report,
      issues: reviewResult.issues,
      feedback: reviewResult.feedback,
    });
  }
}
```

### Step 7: Handle Review Failure
```javascript
async function handleReviewFailure(storyId, reviewResult) {
  // Log failure
  await logReviewFailure(storyId, reviewResult);
  
  // Update story state
  await updateStoryState(storyId, 'REVISION_NEEDED');
  
  // Generate feedback for developer
  const feedback = {
    issues: reviewResult.issues,
    suggestions: reviewResult.suggestions,
    examples: reviewResult.codeExamples,
  };
  
  // Return feedback for dev-story to use
  return feedback;
}
```

## Output
- Review report generated
- All gates checked
- Pass/fail status determined
- Issues documented
- Story state updated
- Feedback provided (if failed)
