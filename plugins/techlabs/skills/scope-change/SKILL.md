# scope-change

Handle scope changes within a story or epic.

## When to Use
- Story requirements change
- Acceptance criteria updated
- New task added to story
- Story split needed

## Agents to Dispatch
- product-manager: Scope decisions
- lead-engineer: Technical impact
- quality-lead: Quality implications

## Scope Change Types

```
SCOPE CHANGES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

TYPE 1: ADD REQUIREMENT
  - New acceptance criteria
  - Additional task
  - Extra feature

TYPE 2: REMOVE REQUIREMENT
  - Simplify story
  - Remove task
  - Defer feature

TYPE 3: MODIFY REQUIREMENT
  - Change how it works
  - Update criteria
  - Different approach

TYPE 4: SPLIT STORY
  - Story too big
  - Need to break down
  - Create sub-stories
```

## Execution

### Step 1: Identify Scope Change
```
ASK USER:
1. What is changing?
2. Why is it changing?
3. When is it needed?
4. Impact on current work?
```

### Step 2: Assess Impact
```markdown
# Scope Change Impact: STORY-001

## Current Scope
- [ ] Task 1: Database schema
- [ ] Task 2: API endpoints
- [ ] Task 3: Frontend UI
- [ ] Task 4: Tests

## Requested Change
**Add:** Task 5: Export to CSV

## Impact Analysis
| Metric | Before | After | Change |
|--------|--------|-------|--------|
| Tasks | 4 | 5 | +1 |
| Story Points | 8 | 10 | +2 |
| Estimated Hours | 13h | 16h | +3h |
| Sprint Impact | - | -2 points available | - |

## Options
1. **Accept:** Add to story, increase estimate
2. **Split:** Create separate story for export
3. **Defer:** Add to backlog, do later
```

### Step 3: Handle Split Story
```markdown
# Story Split: STORY-001

## Original Story
**Title:** User Management
**Points:** 13

### Original Tasks
- [ ] User CRUD (5h)
- [ ] User roles (3h)
- [ ] User export (2h)
- [ ] User import (3h)

## Split Into

### STORY-001a: User CRUD
**Points:** 8
- [ ] User CRUD (5h)
- [ ] User roles (3h)

### STORY-001b: User Export
**Points:** 3
- [ ] User export (2h)

### STORY-001c: User Import
**Points:** 3
- [ ] User import (3h)

## Original Story
- Points: 13
- Status: SPLIT
- Replaced by: STORY-001a, STORY-001b, STORY-001c
```

### Step 4: Update Story
```javascript
async function updateStoryScope(storyId, scopeChange) {
  const story = await getStory(storyId);
  
  switch (scopeChange.type) {
    case 'add':
      story.tasks.push(...scopeChange.newTasks);
      story.estimatedPoints += scopeChange.additionalPoints;
      break;
      
    case 'remove':
      story.tasks = story.tasks.filter(
        t => !scopeChange.removedTasks.includes(t.id)
      );
      story.estimatedPoints -= scopeChange.removedPoints;
      break;
      
    case 'modify':
      story.tasks = story.tasks.map(t => 
        scopeChange.modifiedTasks.find(m => m.id === t.id) || t
      );
      story.estimatedPoints = scopeChange.newEstimate;
      break;
      
    case 'split':
      await splitStory(story, scopeChange.splits);
      break;
  }
  
  await saveStory(story);
  await updateSprintCapacity();
}
```

### Step 5: Update Sprint
```markdown
# Sprint Update After Scope Change

## Story Changes
| Story | Before | After | Action |
|-------|--------|-------|--------|
| STORY-001 | 13 pts | - | SPLIT |
| STORY-001a | - | 8 pts | NEW |
| STORY-001b | - | 3 pts | NEW |
| STORY-001c | - | 3 pts | NEW |

## Sprint Capacity
- Original: 40 points
- Current: 34 points
- After change: 34 points (no change)
- Stories: 12 → 14

## Sprint Plan Update
- Continue: STORY-001a (8 pts)
- Add to backlog: STORY-001b, STORY-001c
```

### Step 6: Generate Change Log
```markdown
# Scope Change Log

## CHANGE-001

**Date:** 2024-01-15
**Story:** STORY-001 (User Management)
**Type:** Split
**Requested by:** User

### Change Details
Original story (13 pts) split into 3 stories:
- STORY-001a: User CRUD (8 pts)
- STORY-001b: User Export (3 pts)
- STORY-001c: User Import (3 pts)

### Impact
- Sprint capacity unchanged
- More granular tracking
- Better prioritization

### Status
- [x] Story updated
- [x] Sprint plan updated
- [x] State updated
- [ ] Team notified
```

### Step 7: Update State
```json
{
  "storyId": "STORY-001",
  "scopeChanges": [
    {
      "id": "SC-001",
      "type": "split",
      "date": "2024-01-15",
      "description": "Split into CRUD, Export, Import",
      "impact": {
        "originalPoints": 13,
        "newStories": ["STORY-001a", "STORY-001b", "STORY-001c"],
        "totalPoints": 14
      }
    }
  ]
}
```

## Output
- Scope change identified
- Impact assessed
- Story updated or split
- Sprint plan adjusted
- Change logged
- State updated
