# review-doc

Reviewer must create documentation for review feedback.

## When to Use
- After code review
- Feedback documentation
- Quality assessment
- Technical debt tracking

## Agents to Dispatch
- lead-engineer: Code review
- quality-lead: Quality review

## Enforcement

```
⚠️ MANDATORY: Review documentation required

FLOW:
  dev-story (implementation)
       ↓
  review-gate (code review)
       ↓
  review-doc (THIS SKILL) ← MANDATORY
       ↓
  qa-plan (if needed)
       ↓
  story-done

IF no review doc → BLOCK story completion
```

## Execution

### Step 1: Load Review Context
```
READ:
- production/stories/{story-id}.md
- production/tech-plans/{story-id}.md
- Implementation files
```

### Step 2: Create Review Report Template
```markdown
# Review Report: {story-id}

## Review Details
- **Story:** {story title}
- **Reviewer:** {reviewer name}
- **Date:** {date}
- **Review Type:** Code Review / Architecture Review

## Review Summary
**Overall Status:** ✅ APPROVED / ⚠️ APPROVED WITH COMMENTS / ❌ CHANGES REQUESTED

## Code Quality Assessment

### Structure
- [ ] Code is well organized
- [ ] Functions are single responsibility
- [ ] Files are properly named
- [ ] Imports are clean

### Naming
- [ ] Variables are descriptive
- [ ] Functions are verb-based
- [ ] Constants are UPPER_SNAKE
- [ ] Files are kebab-case

### Error Handling
- [ ] Try/catch where needed
- [ ] Errors are logged
- [ ] User-friendly messages
- [ ] No swallowed errors

### Testing
- [ ] Unit tests written
- [ ] Integration tests pass
- [ ] Edge cases covered
- [ ] Error cases tested

### Documentation
- [ ] README updated
- [ ] API docs updated
- [ ] Changelog updated
- [ ] Comments on complex logic

## Issues Found

### Critical (Must Fix)
| Issue | File | Line | Description |
|-------|------|------|-------------|
| {issue} | {file} | {line} | {description} |

### Important (Should Fix)
| Issue | File | Line | Description |
|-------|------|------|-------------|
| {issue} | {file} | {line} | {description} |

### Minor (Nice to Fix)
| Issue | File | Line | Description |
|-------|------|------|-------------|
| {issue} | {file} | {line} | {description} |

## Positive Feedback
- {what was done well}
- {good patterns used}

## Recommendations
1. {recommendation 1}
2. {recommendation 2}

## Technical Debt
| Item | Priority | Story |
|------|----------|-------|
| {debt item} | {high/med/low} | {future story} |

## Approval
- [ ] Code quality acceptable
- [ ] All critical issues resolved
- [ ] Documentation complete
- [ ] Tests passing

## Next Steps
- If approved: Proceed to QA
- If changes requested: Return to dev-story
- If technical debt: Create follow-up story
```

### Step 3: Present Review Report
```
SHOW review report to user

ASK:
"Review report ready. Options:
1. Approve (proceed to QA)
2. Request changes (return to dev-story)
3. Track technical debt"
```

### Step 4: Save Review Report
```
SAVE TO:
- production/reviews/{story-id}.md

UPDATE:
- story.reviewStatus = "completed"
- story.reviewDoc = "created"
```

### Step 5: Review Gate
```
IF approved:
  → Proceed to qa-plan
  → Pass review report to QA

IF changes requested:
  → Return to dev-story with review report
  → Developer reads feedback
  → Fix issues
  → Re-review

IF technical debt:
  → Create follow-up story
  → Track debt in backlog
```

## Output
- Review report created
- Issues documented
- Feedback provided
- Technical debt tracked
- Developer can read feedback
