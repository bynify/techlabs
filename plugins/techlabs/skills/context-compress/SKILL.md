# context-compress

Compress conversation context to save tokens and maintain relevance.

## When to Use
- Long conversations
- Token limits approaching
- Context optimization

## Execution

### Step 1: Identify Key Points
```
EXTRACT:
- User's original goal
- Key decisions made
- Files modified
- Current blockers
- Pending actions
```

### Step 2: Create Summary
```markdown
## Context Summary

**Goal:** [What we're building]
**Progress:** [What's done]
**Current:** [What we're working on]
**Next:** [What's pending]
**Files:** [Key files modified]
```

### Step 3: Update Active State
```markdown
# production/session-state/active.md

## Current Task
[Description]

## Decisions
- [Decision 1]
- [Decision 2]

## Files Modified
- src/api/users.ts
- src/components/UserCard.tsx

## Next Steps
- [ ] Step 1
- [ ] Step 2
```

## Output
- Compressed context
- Updated session state
- Token savings
