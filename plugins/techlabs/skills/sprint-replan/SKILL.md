# sprint-replan

Replan sprint when scope changes, blockers occur, or priorities shift.

## When to Use
- Mid-sprint replanning
- Blocker causes delays
- Priority shift from stakeholders
- Team capacity change

## Agents to Dispatch
- product-manager: Priority decisions
- lead-engineer: Technical assessment
- quality-lead: Scope reduction options

## Replan Triggers

```
WHEN TO REPLAN:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

TRIGGER 1: BLOCKER
  - Story blocked for >1 day
  - External dependency issue
  - Technical debt blocking progress

TRIGGER 2: SCOPE CHANGE
  - New P0/P1 feature added
  - Story removed from sprint
  - Acceptance criteria changed

TRIGGER 3: CAPACITY CHANGE
  - Team member unavailable
  - Sprint shortened
  - Unexpected work

TRIGGER 4: PROGRESS CHANGE
  - Story taking longer than estimated
  - Velocity lower than expected
  - More stories completed than planned
```

## Execution

### Step 1: Load Current State
```
READ:
- production/sprint/state.json
- production/sprint/dispatch-log.json
- production/stories/ (in-progress stories)

ANALYZE:
- Current progress (stories completed)
- In-progress stories
- Blocked stories
- Remaining capacity
```

### Step 2: Assess Situation
```markdown
# Sprint Replan Assessment

## Current Status
| Metric | Planned | Actual | Variance |
|--------|---------|--------|----------|
| Stories Completed | 5 | 3 | -2 |
| Points Completed | 20 | 12 | -8 |
| Days Elapsed | 5 | 5 | 0 |
| Days Remaining | 5 | 5 | 0 |

## Issues
1. AUTH-003 blocked by external API (2 days)
2. UI-002 taking longer than estimated (+1 day)
3. New P0 feature requested

## Capacity
- Original: 20 points
- Used: 12 points
- Remaining: 8 points
- Available: 8 points
```

### Step 3: Replan Options
```markdown
# Replan Options

## Option 1: Reduce Scope
**Action:** Remove lowest priority stories

| Story | Points | Status | Action |
|-------|--------|--------|--------|
| AUTH-003 | 5 | Blocked | Remove |
| UI-004 | 3 | Pending | Remove |
| NEW-FEATURE | 3 | Requested | Add |

**Result:** Stay on track with adjusted scope

## Option 2: Extend Sprint
**Action:** Add 2-3 days to sprint

| Story | Points | Status | Action |
|-------|--------|--------|--------|
| AUTH-003 | 5 | Blocked | Wait for unblock |
| UI-002 | 5 | In Progress | Continue |
| NEW-FEATURE | 3 | Requested | Add |

**Result:** Complete all stories, but delayed

## Option 3: Carry Over
**Action:** Move incomplete stories to next sprint

| Story | Points | Status | Action |
|-------|--------|--------|--------|
| UI-004 | 3 | Pending | Move to next |
| NEW-FEATURE | 3 | Requested | Add |

**Result:** Finish current sprint, start next with backlog
```

### Step 4: Execute Replan
```javascript
async function executeReplan(replanOption, newState) {
  switch (replanOption) {
    case 'reduce-scope':
      // Remove lowest priority stories
      const storiesToRemove = getLowestPriorityStories(2);
      for (const story of storiesToRemove) {
        await removeStoryFromSprint(story.id);
        await moveToBacklog(story);
      }
      break;
      
    case 'extend-sprint':
      // Update sprint dates
      await updateSprintDates({
        endDate: new Date(Date.now() + 3 * 24 * 60 * 60 * 1000),
      });
      break;
      
    case 'carry-over':
      // Move incomplete stories to next sprint
      const incompleteStories = getIncompleteStories();
      for (const story of incompleteStories) {
        await removeStoryFromSprint(story.id);
        await addToNextSprint(story);
      }
      break;
  }
  
  // Update sprint state
  await updateSprintState('REPLAN_COMPLETE', {
    reason: newState.reason,
    option: replanOption,
    changes: newState.changes,
  });
}
```

### Step 5: Update Sprint Plan
```markdown
# Updated Sprint Plan: 2024-S1

## Replan Reason
Blocker on AUTH-003, new P0 feature requested

## Updated Stories
| Story | Points | Status | Agent |
|-------|--------|--------|-------|
| AUTH-001 | 8 | Done | go-specialist |
| AUTH-002 | 5 | Done | nextjs-specialist |
| AUTH-003 | 5 | Removed | - |
| UI-001 | 5 | Done | ui-engineer |
| UI-002 | 5 | In Progress | ui-engineer |
| UI-004 | 3 | Removed | - |
| NEW-FEATURE | 3 | Added | ui-engineer |

## Summary
- Original: 34 points
- Removed: 8 points
- Added: 3 points
- New Total: 29 points

## Next Steps
1. Continue UI-002
2. Start NEW-FEATURE
3. Resume AUTH-003 next sprint
```

### Step 6: Notify Team
```markdown
# Sprint Replan Notification

## To: All Team Members

## Changes Made
1. AUTH-003 removed (blocked)
2. UI-004 removed (scope reduction)
3. NEW-FEATURE added (P0)

## Updated Priorities
1. UI-002 (in progress)
2. NEW-FEATURE (new)
3. API-001 (pending)

## Impact
- Sprint scope reduced by 5 points
- New feature added (3 points)
- Timeline unchanged

## Action Required
- UI-002: Continue, focus on completion
- NEW-FEATURE: Start after UI-002
- AUTH-003: Will be addressed next sprint
```

### Step 7: Update State
```json
{
  "sprintId": "2024-S1",
  "replanHistory": [
    {
      "date": "2024-01-17",
      "reason": "Blocker on AUTH-003, P0 feature request",
      "option": "reduce-scope",
      "changes": {
        "removed": ["AUTH-003", "UI-004"],
        "added": ["NEW-FEATURE"]
      }
    }
  ],
  "currentPlan": {
    "totalPoints": 29,
    "completedPoints": 13,
    "remainingPoints": 16
  }
}
```

## Output
- Situation assessed
- Replan options generated
- Replan executed
- Sprint plan updated
- Team notified
- State updated
