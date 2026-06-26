# sprint-transition

Handle sprint completion and transition to next sprint with carryover and backlog management.

## When to Use
- Sprint 1 complete, start Sprint 2
- Requirement change between sprints
- Carryover stories from previous sprint
- Sprint planning for next iteration

## Agents to Dispatch
- product-manager: Sprint transition decisions
- lead-engineer: Technical carryover assessment
- quality-lead: Quality review before transition

## Transition Flow

```
SPRINT TRANSITION FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SPRINT 1 (Complete)
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  SPRINT 1 REVIEW                                        │
│  ─────────────────────────────────────────────────────  │
│  1. Stories completed: 8/10                             │
│  2. Stories incomplete: 2                               │
│  3. Velocity: 34 points                                 │
│  4. Retrospective notes                                 │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  TRANSITION PROCESS                                     │
│  ─────────────────────────────────────────────────────  │
│  1. Move incomplete stories to backlog                  │
│  2. Update project velocity                             │
│  3. Check for requirement changes                       │
│  4. Create Sprint 2 plan                                │
└─────────────────────────────────────────────────────────┘
    │
    ▼
SPRINT 2 (Start)
```

## Execution

### Step 1: Complete Current Sprint
```
READ:
- production/sprint/state.json
- production/sprint/current.json

CHECK:
- All stories done or moved
- Sprint metrics calculated
- Retrospective completed
```

### Step 2: Generate Sprint Summary
```markdown
# Sprint 1 Summary

## Status: COMPLETE

## Stories Completed
| Story | Points | Status | Notes |
|-------|--------|--------|-------|
| AUTH-001 | 8 | ✅ Done | On time |
| AUTH-002 | 5 | ✅ Done | On time |
| UI-001 | 5 | ✅ Done | 1 day late |
| API-001 | 13 | ✅ Done | On time |
| UI-002 | 3 | ✅ Done | On time |

## Stories Incomplete
| Story | Points | Status | Reason |
|-------|--------|--------|--------|
| AUTH-003 | 5 | ❌ Blocked | External API |
| UI-003 | 3 | ❌ Incomplete | Scope change |

## Metrics
- **Planned:** 40 points
- **Completed:** 34 points (85%)
- **Velocity:** 34 points/sprint
- **Carryover:** 8 points

## Retrospective
### What went well
- Good team collaboration
- Fast feedback loops
- Clean code reviews

### What to improve
- Better estimation
- Earlier blocker identification
- More testing coverage
```

### Step 3: Handle Requirement Changes
```markdown
# Requirement Changes Between Sprints

## Changes Detected
1. **New Feature:** Dark mode (requested by user)
2. **Priority Change:** Export feature now P1
3. **Removed:** Legacy API support (no longer needed)

## Impact on Sprint 2
| Change | Impact | Action |
|--------|--------|--------|
| Dark mode | +5 points | Add to Sprint 2 |
| Export P1 | +3 points | Add to Sprint 2 |
| Legacy removed | -2 points | Remove from backlog |

## Updated Backlog
| Story | Points | Priority | Sprint |
|-------|--------|----------|--------|
| AUTH-003 | 5 | P0 | Sprint 2 (carryover) |
| UI-003 | 3 | P1 | Sprint 2 (carryover) |
| Dark mode | 5 | P1 | Sprint 2 (new) |
| Export | 3 | P1 | Sprint 2 (new) |
| ... | ... | ... | Backlog |
```

### Step 4: Create Next Sprint Plan
```markdown
# Sprint 2 Plan

## Goal
Complete authentication system and add dark mode

## Capacity
- **Velocity:** 34 points (from Sprint 1)
- **Team:** 4 developers
- **Sprint Length:** 2 weeks

## Stories
| Story | Points | Type | Agent |
|-------|--------|------|-------|
| AUTH-003 | 5 | carryover | go-specialist |
| UI-003 | 3 | carryover | ui-engineer |
| Dark mode | 5 | new | ui-engineer |
| Export | 3 | new | python-specialist |
| API-002 | 13 | new | go-specialist |
| UI-004 | 5 | new | ui-engineer |

**Total:** 34 points

## Dependencies
- AUTH-003 depends on external API (unblocked)
- Export depends on API-002
```

### Step 5: Update Sprint State
```javascript
// production/sprint/history.json
{
  "sprints": [
    {
      "id": "2024-S1",
      "status": "COMPLETE",
      "startDate": "2024-01-15",
      "endDate": "2024-01-29",
      "plannedPoints": 40,
      "completedPoints": 34,
      "velocity": 34,
      "stories": {
        "completed": ["AUTH-001", "AUTH-002", "UI-001", "API-001", "UI-002"],
        "incomplete": ["AUTH-003", "UI-003"]
      }
    },
    {
      "id": "2024-S2",
      "status": "ACTIVE",
      "startDate": "2024-01-30",
      "endDate": "2024-02-12",
      "plannedPoints": 34,
      "completedPoints": 0,
      "velocity": null,
      "stories": {
        "carryover": ["AUTH-003", "UI-003"],
        "new": ["Dark-mode", "Export", "API-002", "UI-004"]
      }
    }
  ],
  "currentSprint": "2024-S2",
  "averageVelocity": 34
}
```

### Step 6: Initialize New Sprint
```javascript
// production/sprint/state.json (reset for new sprint)
{
  "sprintId": "2024-S2",
  "sprintState": "PLANNING",
  "startedAt": "2024-01-30",
  "stories": {
    "AUTH-003": {
      "state": "READY",
      "source": "carryover",
      "points": 5
    },
    "UI-003": {
      "state": "READY",
      "source": "carryover",
      "points": 3
    },
    "Dark-mode": {
      "state": "BACKLOG",
      "source": "new",
      "points": 5
    }
    // ... other stories
  }
}
```

### Step 7: Handle Requirement Change During Sprint
```markdown
# Requirement Change During Sprint 2

## Change Request
**Date:** Sprint 2, Day 3
**Type:** Feature Request
**Description:** Add two-factor authentication

## Impact Analysis
- **Current Sprint:** 34 points planned
- **New Requirement:** +8 points
- **Can Add Without Removing?** No (would exceed capacity)

## Options
1. **Accept:** Add 2FA, remove Export (3 pts) + UI-004 (5 pts)
2. **Defer:** Add to Sprint 3 backlog
3. **Swap:** Replace API-002 (13 pts) with 2FA (8 pts)

## Decision
**DEFER** - Add to Sprint 3 backlog

## Updated Sprint 2
- No changes
- 2FA added to Sprint 3 backlog
```

## Output
- Sprint summary generated
- Requirement changes documented
- Carryover stories identified
- Next sprint plan created
- Sprint state updated
- History preserved
