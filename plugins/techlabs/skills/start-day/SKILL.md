# start-day

Resume work from previous session. Load context, check status, and continue sprint.

## When to Use
- Start of work day
- Resume interrupted work
- Continue sprint from yesterday
- Check current sprint status

## Session Continuity

```
SESSION CONTINUITY FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

YESTERDAY (Session 1)
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  WORK DONE                                              │
│  ─────────────────────────────────────────────────────  │
│  - Story AUTH-001: 60% complete                         │
│  - Story UI-001: 100% complete                          │
│  - Sprint state saved                                   │
│  - Session state saved                                  │
└─────────────────────────────────────────────────────────┘
    │
    ▼
[SESSION END - auto-save via hook]
    │
    ▼
TODAY (Session 2)
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  /start-day                                             │
│  ─────────────────────────────────────────────────────  │
│  1. Load session state                                  │
│  2. Load sprint state                                   │
│  3. Check what was in progress                          │
│  4. Show status                                         │
│  5. Ask: "Continue where you left off?"                 │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  CONTINUE WORK                                          │
│  ─────────────────────────────────────────────────────  │
│  Story AUTH-001: In Progress (60%)                      │
│  Agent: go-specialist                                   │
│  Next: Complete API endpoints                           │
│  Resume? Yes → Continue implementation                  │
└─────────────────────────────────────────────────────────┘
```

## Execution

### Step 1: Load Session State
```
READ:
- production/session-state/active.md (last session)
- production/sprint/state.json (sprint status)
- production/sprint/current.json (sprint config)
- production/stories/ (all stories)
```

### Step 2: Check Last Session
```markdown
# Last Session Summary

## Date: 2024-01-15
## Duration: 4 hours

## Work Done
- Story AUTH-001: In Progress (60%)
  - ✅ Database schema
  - ✅ Auth endpoints
  - ⬜ JWT middleware
  - ⬜ Login page
  - ⬜ Tests

- Story UI-001: Complete ✅
  - ✅ All tasks done
  - ✅ Review passed
  - ✅ QA verified

## Current State
- **Sprint:** 2024-S1 (Day 3/10)
- **Progress:** 2/5 stories (40%)
- **Points:** 13/34 (38%)
- **In Progress:** AUTH-001

## Blockers
- None currently

## Next Steps
1. Continue AUTH-001 (JWT middleware)
2. Start API-001 after AUTH-001
```

### Step 3: Show Sprint Status
```markdown
# Sprint Status: 2024-S1

## Day 3/10

## Stories
| Story | Points | Status | Progress |
|-------|--------|--------|----------|
| AUTH-001 | 8 | 🔄 In Progress | 60% |
| AUTH-002 | 5 | ⏳ Pending | 0% |
| UI-001 | 5 | ✅ Done | 100% |
| API-001 | 13 | ⏳ Pending | 0% |
| UI-002 | 3 | ⏳ Pending | 0% |

## Burndown
```
Points
34 |████████████████████
30 |██████████████████  
26 |████████████████    
22 |██████████████      
18 |████████████        ← Today (13 points left)
   +--------------------
   D1 D2 D3 D4 D5 D6 D7 D8 D9 D10
```

## Today's Focus
1. Complete AUTH-001 (JWT middleware + login page + tests)
2. Start AUTH-002 if time permits
```

### Step 4: Ask User
```
QUESTIONS:

1. Continue where you left off?
   - Yes → Resume AUTH-001 from JWT middleware
   - No → Choose different story

2. Any changes since yesterday?
   - New requirements?
   - Blockers?
   - Priority changes?

3. Need help with anything?
   - Technical questions?
   - Design decisions?
   - Architecture questions?
```

### Step 5: Resume Work
```javascript
async function startDay() {
  // 1. Load session state
  const sessionState = await loadSessionState();
  const sprintState = await loadSprintState();
  
  // 2. Find in-progress stories
  const inProgressStories = Object.entries(sprintState.stories)
    .filter(([_, story]) => story.state === 'IN_PROGRESS');
  
  // 3. Show status
  console.log('=== SPRINT STATUS ===');
  console.log(`Sprint: ${sprintState.sprintId}`);
  console.log(`Day: ${getDayNumber(sprintState)}/10`);
  console.log(`Progress: ${getCompletionRate(sprintState)}%`);
  
  if (inProgressStories.length > 0) {
    console.log('\n=== IN PROGRESS ===');
    for (const [id, story] of inProgressStories) {
      console.log(`${id}: ${story.title} (${story.progress}%)`);
      console.log(`  Next: ${story.nextTask}`);
      console.log(`  Agent: ${story.assignedTo}`);
    }
  }
  
  // 4. Ask user
  const answer = await askUser({
    question: 'Continue where you left off?',
    options: ['Yes, continue', 'No, choose different story', 'Check changes first'],
  });
  
  if (answer === 'Yes, continue') {
    // Resume in-progress story
    for (const [id, story] of inProgressStories) {
      await executeStory(story);
    }
  } else if (answer === 'Check changes first') {
    // Check for changes
    await runSkill('change-request', { type: 'check' });
  } else {
    // Show available stories
    await showAvailableStories();
  }
}
```

### Step 6: Handle Overnight Changes
```markdown
# Overnight Changes

## Check For
1. New feature requests
2. Bug reports
3. Requirement changes
4. Blocker resolutions

## If Changes Found
1. Classify change type
2. Assess impact
3. Update sprint if needed
4. Notify team

## Example
**Change Found:** External API for AUTH-003 now available
**Impact:** Can unblock AUTH-003
**Action:** Add AUTH-003 back to current sprint
```

### Step 7: Generate Day Plan
```markdown
# Day Plan: 2024-01-16

## Sprint: 2024-S1 (Day 4/10)

## Today's Goals
1. Complete AUTH-001 (2h remaining)
2. Start AUTH-002 (3h)
3. Code review for UI-001 (1h)

## Time Allocation
| Task | Time | Priority |
|------|------|----------|
| AUTH-001 (JWT) | 2h | P0 |
| AUTH-001 (Tests) | 1h | P0 |
| AUTH-002 (Start) | 3h | P1 |
| Code Review | 1h | P1 |
| **Total** | **7h** | |

## Dependencies
- AUTH-001 must complete before AUTH-002
- AUTH-002 can start after AUTH-001 auth endpoints

## Risks
- JWT middleware might need more testing
- External API dependency for AUTH-003
```

### Step 8: Update Session State
```json
// production/session-state/active.md
{
  "sessionId": "session-2024-01-16",
  "startDate": "2024-01-16",
  "sprintId": "2024-S1",
  "dayNumber": 4,
  "currentStory": "AUTH-001",
  "currentTask": "JWT middleware",
  "progress": 60,
  "lastSession": {
    "date": "2024-01-15",
    "workDone": ["AUTH-001: 60%", "UI-001: 100%"],
    "blockers": []
  },
  "todayPlan": {
    "goals": ["Complete AUTH-001", "Start AUTH-002"],
    "timeAllocation": {
      "AUTH-001": "3h",
      "AUTH-002": "3h",
      "codeReview": "1h"
    }
  }
}
```

## Output
- Session state loaded
- Sprint status displayed
- In-progress work identified
- Day plan generated
- Ready to continue
