# sprint-state

Track and manage sprint/story lifecycle state machine.

## When to Use
- Sprint execution
- Story lifecycle tracking
- Progress monitoring
- State transitions

## State Machine

```
STORY LIFECYCLE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ┌─────────┐
  │ BACKLOG │ (created in planning)
  └────┬────┘
       │ story-readiness ✅
       ↓
  ┌─────────┐
  │  READY  │ (all prerequisites met)
  └────┬────┘
       │ dispatch-story
       ↓
  ┌──────────────┐
  │ IN_PROGRESS  │ (assigned to specialist)
  └──────┬───────┘
         │ dev-story complete
         ↓
  ┌──────────────┐
  │ CODE_REVIEW  │ (review-gate running)
  └──────┬───────┘
         │
    ┌────┴────┐
    ↓         ↓
┌────────┐ ┌───────────────┐
│ PASS   │ │ REVISION_     │
│        │ │ NEEDED        │
└───┬────┘ └───────┬───────┘
    │              │ (back to IN_PROGRESS)
    ↓
┌──────────────┐
│ QA_REVIEW    │ (gate-check running)
└──────┬───────┘
       │
  ┌────┴────┐
  ↓         ↓
┌────────┐ ┌───────────────┐
│ PASS   │ │ QA_FAILED     │
│        │ │               │
└───┬────┘ └───────┬───────┘
    │              │ (back to IN_PROGRESS)
    ↓
┌──────────┐
│ MANAUAL  │ (qa-plan if needed)
│ QA       │
└────┬─────┘
     │ story-done ✅
     ↓
┌─────────┐
│  DONE   │ (complete)
└─────────┘


SPRINT LIFECYCLE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ┌──────────┐
  │ PLANNING │ (sprint-plan running)
  └────┬─────┘
       │ all stories created
       ↓
  ┌──────────┐
  │ ACTIVE   │ (stories being executed)
  └────┬─────┘
       │ all stories done OR sprint end
       ↓
  ┌──────────┐
  │ REVIEW   │ (milestone-review running)
  └────┬─────┘
       │ review complete
       ↓
  ┌──────────┐
  │ CLOSED   │ (sprint complete)
  └──────────┘
```

## Execution

### Step 1: Initialize State Storage
```javascript
// production/sprint/state.json
{
  "sprintId": "2024-S1",
  "sprintState": "ACTIVE",
  "startedAt": "2024-01-15T09:00:00Z",
  "stories": {
    "AUTH-001": {
      "state": "IN_PROGRESS",
      "assignedTo": "go-specialist",
      "transitions": [
        { "from": "BACKLOG", "to": "READY", "at": "2024-01-15T09:05:00Z" },
        { "from": "READY", "to": "IN_PROGRESS", "at": "2024-01-15T10:00:00Z" }
      ],
      "metrics": {
        "startedAt": "2024-01-15T10:00:00Z",
        "reviewAttempts": 0,
        "qaAttempts": 0
      }
    }
  },
  "metrics": {
    "totalStories": 15,
    "completed": 0,
    "inProgress": 1,
    "blocked": 0,
    "velocity": 0,
    "burndown": []
  }
}
```

### Step 2: State Transition Function
```javascript
const VALID_TRANSITIONS = {
  'BACKLOG': ['READY', 'BLOCKED'],
  'READY': ['IN_PROGRESS', 'BLOCKED'],
  'BLOCKED': ['READY', 'BACKLOG'],
  'IN_PROGRESS': ['CODE_REVIEW', 'BLOCKED'],
  'CODE_REVIEW': ['QA_REVIEW', 'REVISION_NEEDED'],
  'REVISION_NEEDED': ['IN_PROGRESS'],
  'QA_REVIEW': ['MANUAL_QA', 'DONE', 'QA_FAILED'],
  'QA_FAILED': ['IN_PROGRESS'],
  'MANUAL_QA': ['DONE', 'IN_PROGRESS'],
  'DONE': [],
};

async function transitionStory(storyId, newState, metadata = {}) {
  const state = await loadSprintState();
  const story = state.stories[storyId];
  
  // Validate transition
  if (!VALID_TRANSITIONS[story.state]?.includes(newState)) {
    throw new Error(`Invalid transition: ${story.state} → ${newState}`);
  }
  
  // Record transition
  story.transitions.push({
    from: story.state,
    to: newState,
    at: new Date().toISOString(),
    ...metadata,
  });
  
  // Update state
  story.state = newState;
  
  // Update metrics
  updateSprintMetrics(state);
  
  // Save state
  await saveSprintState(state);
  
  // Log transition
  await logTransition(storyId, story.state, newState, metadata);
  
  return story;
}
```

### Step 3: Load State Function
```javascript
async function loadSprintState() {
  const statePath = 'production/sprint/state.json';
  
  try {
    const content = await fs.readFile(statePath, 'utf8');
    return JSON.parse(content);
  } catch (error) {
    // Initialize if not exists
    return initializeSprintState();
  }
}

async function saveSprintState(state) {
  const statePath = 'production/sprint/state.json';
  await fs.writeFile(statePath, JSON.stringify(state, null, 2));
}
```

### Step 4: Query Functions
```javascript
// Get all stories in a state
async function getStoriesByState(state) {
  const sprintState = await loadSprintState();
  return Object.entries(sprintState.stories)
    .filter(([_, story]) => story.state === state)
    .map(([id, story]) => ({ id, ...story }));
}

// Get story progress
async function getStoryProgress(storyId) {
  const sprintState = await loadSprintState();
  const story = sprintState.stories[storyId];
  
  return {
    id: storyId,
    state: story.state,
    timeInState: getTimeInState(story),
    totalTime: getTotalTime(story),
    transitions: story.transitions,
    metrics: story.metrics,
  };
}

// Get sprint progress
async function getSprintProgress() {
  const sprintState = await loadSprintState();
  
  const counts = {};
  for (const story of Object.values(sprintState.stories)) {
    counts[story.state] = (counts[story.state] || 0) + 1;
  }
  
  return {
    sprintId: sprintState.sprintId,
    state: sprintState.sprintState,
    totalStories: Object.keys(sprintState.stories).length,
    byState: counts,
    completionRate: (counts['DONE'] || 0) / Object.keys(sprintState.stories).length,
    metrics: sprintState.metrics,
  };
}
```

### Step 5: Update Sprint Metrics
```javascript
function updateSprintMetrics(state) {
  const stories = Object.values(state.stories);
  
  state.metrics = {
    totalStories: stories.length,
    completed: stories.filter(s => s.state === 'DONE').length,
    inProgress: stories.filter(s => s.state === 'IN_PROGRESS').length,
    inReview: stories.filter(s => s.state === 'CODE_REVIEW').length,
    inQA: stories.filter(s => s.state === 'QA_REVIEW').length,
    blocked: stories.filter(s => s.state === 'BLOCKED').length,
    velocity: calculateVelocity(stories),
    burndown: updateBurndown(state),
  };
}

function calculateVelocity(stories) {
  const completed = stories.filter(s => s.state === 'DONE');
  const totalPoints = completed.reduce((sum, s) => sum + (s.points || 0), 0);
  return totalPoints;
}
```

### Step 6: Generate Status Report
```markdown
# Sprint Status: 2024-S1

## Overview
- State: ACTIVE
- Day: 5/10
- Stories: 12/15 (80%)
- Points: 34/40 (85%)

## Story States
| State | Count | Stories |
|-------|-------|---------|
| DONE | 12 | AUTH-001, AUTH-002, ... |
| IN_PROGRESS | 2 | UI-003, API-005 |
| CODE_REVIEW | 1 | AUTH-004 |
| BLOCKED | 0 | - |

## Burndown
```
Points
40 |████████████████████
35 |██████████████████  
30 |████████████████    
25 |██████████████      
20 |████████████        
15 |██████████          
10 |████████            
 5 |██████              
 0 |████                
   +--------------------
   D1 D2 D3 D4 D5 D6 D7 D8 D9 D10
```

## At Risk
- None currently

## Recommendations
- AUTH-004 needs review attention
- Consider adding resources to UI-003
```

## Output
- State machine implemented
- Transitions tracked
- Metrics calculated
- Status reports generated
- History preserved
