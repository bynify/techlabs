# story-done

Verify story meets Definition of Done (DoD) with comprehensive checklist.

## When to Use
- Sprint review
- Story completion
- Quality gate
- Release readiness


## Agents to Dispatch
- lead-engineer: Code quality
- quality-lead: Final verification

## Execution

### Step 1: Code Completeness
```
CHECK:
- [ ] All acceptance criteria implemented
- [ ] No TODO/FIXME left in code
- [ ] No console.log/debug statements
- [ ] Error handling complete
- [ ] Edge cases handled
- [ ] No hardcoded values
```

### Step 2: Testing
```
CHECK:
- [ ] Unit tests written (≥80% coverage)
- [ ] Integration tests passing
- [ ] E2E tests for critical paths
- [ ] Manual testing completed
- [ ] Performance acceptable
- [ ] Security review done
```

### Step 3: Code Quality
```
CHECK:
- [ ] Code reviewed by peer
- [ ] Linting passes (0 warnings)
- [ ] Type checking passes (0 errors)
- [ ] No code duplication
- [ ] Naming conventions followed
- [ ] Comments on complex logic
```

### Step 4: Documentation
```
CHECK:
- [ ] README updated (if needed)
- [ ] API docs updated (if needed)
- [ ] Changelog entry added
- [ ] Runbook updated (if needed)
- [ ] ADR created (if architectural decision)
```

### Step 5: Deployment
```
CHECK:
- [ ] Builds successfully
- [ ] Deploys to staging
- [ ] Smoke tests pass
- [ ] Feature flags configured
- [ ] Database migrations ready
- [ ] Rollback plan documented
```

### Step 6: Generate Report
```markdown
# Story DoD Report

## Story: [PROJ-123] User Authentication
## Date: 2024-01-15
## Reviewer: [Name]

## Status: ✅ DONE / ❌ NOT DONE

## Checklist

### Code Completeness: ✅ PASS
- [x] All acceptance criteria implemented
- [x] No TODO/FIXME
- [x] Error handling complete

### Testing: ✅ PASS
- [x] Unit tests: 85% coverage
- [x] Integration tests passing
- [x] Manual testing completed

### Code Quality: ⚠️ NEEDS FIX
- [x] Code reviewed
- [ ] Linting: 2 warnings remaining
- [x] Type checking passes

### Documentation: ✅ PASS
- [x] README updated
- [x] API docs updated

### Deployment: ✅ PASS
- [x] Builds successfully
- [x] Deploys to staging

## Missing Items
1. Fix 2 linting warnings

## Action Items
- [ ] Fix linting warnings (assigned: dev1)
- [ ] Final review after fix (assigned: dev2)
```

### Step 7: Check Revision Limit
```
⚠️ ANOMALY PREVENTION: MAX_REVISION = 3

LOAD story.revisionCount from sprint state

IF revisionCount >= 3:
  → ESCALATE to lead-engineer
  → Log: "Story exceeded max revisions"
  → Options:
    1. SPLIT story into smaller pieces
    2. REJECT story (move to backlog)
    3. REASSIGN to different specialist
    4. ESCALATE to technical-director
  → SHOW escalation report to user
  → WAIT for decision before proceeding

IF revisionCount < 3:
  → Increment revisionCount
  → Continue with normal flow
```

### Step 8: Update Status
```
IF all checks pass:
  - Move story to "Done" column
  - Update sprint board
  - Notify stakeholders

IF checks fail AND revisionCount < 3:
  - Create subtasks for missing items
  - Assign to team members
  - Keep story in progress
  - Increment revisionCount

IF checks fail AND revisionCount >= 3:
  - ESCALATE (see Step 7)
```

## Output
- DoD checklist completed
- Pass/fail status
- Missing items identified
- Action items created
- Revision count tracked
