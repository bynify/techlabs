# story-readiness

Check if a user story meets readiness criteria before development.

## When to Use
- Sprint planning
- Before starting development
- Backlog grooming

## Execution

### Step 1: Readiness Checklist
```markdown
## Story Readiness Checklist

### Required (Must Pass)
- [ ] Clear user story (As a... I want... So that...)
- [ ] Acceptance criteria defined (minimum 3)
- [ ] Dependencies identified and resolved
- [ ] Estimated by team
- [ ] Design approved (if UI work)
- [ ] No blocking questions

### Nice to Have
- [ ] Test scenarios outlined
- [ ] Edge cases considered
- [ ] Performance requirements defined
- [ ] Documentation requirements noted
```

### Step 2: Evaluate Story
```markdown
## Story: User Login

### Readiness Status: ❌ Not Ready

### Missing Items
1. ❌ Acceptance criteria incomplete
   - Has: "User can log in"
   - Missing: Error handling, session management, rate limiting

2. ❌ Dependencies unresolved
   - Waiting on auth library selection
   - Database schema not finalized

3. ⚠️ No estimate
   - Team hasn't reviewed complexity

### Recommendations
1. Add acceptance criteria for:
   - Invalid credentials handling
   - Account lockout after 5 failures
   - Session timeout behavior

2. Resolve dependencies:
   - Choose auth library in next meeting
   - Finalize DB schema by Thursday

3. Schedule estimation session
```

### Step 3: Block/Proceed Decision
```
IF not_ready:
  → Return to backlog
  → List specific improvements needed
  → Set follow-up date

IF ready:
  → Add to sprint
  → Assign to developer
  → Start development
```

## Output
- Readiness assessment
- Missing items list
- Improvement recommendations
- Block/proceed decision
