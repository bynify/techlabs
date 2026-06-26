# code-review

Systematic code review with checklist and feedback patterns.

## When to Use
- PR reviews
- Architecture reviews
- Security reviews

## Execution

### Step 1: Review Checklist
```
FUNCTIONALITY:
- [ ] Does it solve the problem?
- [ ] Edge cases handled?
- [ ] Error handling complete?

CODE QUALITY:
- [ ] Readable and clear?
- [ ] DRY (no duplication)?
- [ ] Functions < 50 lines?
- [ ] Proper naming?

SECURITY:
- [ ] Input validated?
- [ ] Auth checked?
- [ ] No secrets in code?

PERFORMANCE:
- [ ] No N+1 queries?
- [ ] Caching where needed?
- [ ] Memory leaks possible?

TESTS:
- [ ] Tests included?
- [ ] Edge cases tested?
- [ ] Coverage adequate?
```

### Step 2: Provide Feedback
```
FORMAT:
- 🔴 **Must fix**: Blocking issues
- 🟡 **Should fix**: Important but not blocking
- 🟢 **Nice to have**: Suggestions
- 💡 **Nit**: Style/preferences
```

## Output
- Review checklist
- Structured feedback
- Action items
