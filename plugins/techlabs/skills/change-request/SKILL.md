# change-request

Handle feature requests, bug reports, and changes during sprint execution.

## When to Use
- Feature request from user
- Bug report during development
- Requirement change from stakeholder
- Emergency fix needed

## Agents to Dispatch
- product-manager: Priority assessment
- lead-engineer: Impact analysis
- technical-director: Major changes

## Change Types

```
CHANGE TYPES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

TYPE 1: NEW FEATURE REQUEST
  - User asks for new functionality
  - Not in current sprint
  - Goes to backlog or next sprint

TYPE 2: BUG FIX
  - Something broken in current sprint
  - Needs immediate attention
  - May delay current story

TYPE 3: SCOPE CHANGE
  - Existing story needs modification
  - Acceptance criteria changed
  - May increase/decrease effort

TYPE 4: EMERGENCY (HOTFIX)
  - Production down
  - Security vulnerability
  - Data loss
  - Immediate fix required
```

## Execution

### Step 1: Check for Batch Changes
```
⚠️ ANOMALY PREVENTION: Batch Change Detection

CHECK if multiple change requests are pending:
- Load pending change requests from state
- Count how many changes are pending

IF multiple changes pending (≥2):
  → SHOW all pending changes
  → ASK: "Process all at once?"
  → SHOW combined impact
  → PROCESS batch

IF single change:
  → Continue with normal flow
```

### Step 2: Classify Change Request
```
ASK USER:
1. What type of change? (Feature/Bug/Scope/Emergency)
2. When is it needed? (Now/This sprint/Backlog)
3. Priority? (P0-Critical/P1-High/P2-Medium/P3-Low)
4. Impact? (Affects current sprint work?)
5. Which stories are affected? (all/selected)
```

### Step 2: Impact Analysis
```markdown
# Impact Analysis: [Change Request]

## Change Description
[What is being requested]

## Affected Items
| Item | Impact | Notes |
|------|--------|-------|
| Current Story | Low/Med/High | [Details] |
| Sprint Scope | Low/Med/High | [Details] |
| Timeline | Low/Med/High | [Details] |
| Resources | Low/Med/High | [Details] |

## Options

### Option 1: Accept Now
- [What happens]
- [Effort required]
- [What gets delayed]

### Option 2: Accept Next Sprint
- [What happens]
- [When it will be done]
- [Priority in backlog]

### Option 3: Reject
- [Why rejecting]
- [Alternative suggestions]
```

### Step 3: Classification Decision
```
IF type == "emergency":
  → IMMEDIATE ACTION
  → Pause current work
  → Fix issue
  → Resume sprint

IF type == "bug":
  IF severity == "critical":
    → Same as emergency
  ELSE:
    → Add to current sprint
    → Adjust sprint scope

IF type == "feature":
  IF priority == "P0":
    → Add to current sprint
    → Remove lowest priority story
  ELSE:
    → Add to backlog
    → Schedule for next sprint

IF type == "scope_change":
  → Update current story
  → Re-estimate if needed
  → Update sprint plan
```

### Step 4: Update Sprint State
```javascript
// For emergency/hotfix
async function handleEmergency(changeRequest) {
  // 1. Pause current story
  await updateStoryState(currentStory.id, 'PAUSED');
  
  // 2. Create hotfix story
  const hotfixStory = await createStory({
    title: changeRequest.title,
    type: 'hotfix',
    priority: 'P0',
    estimatedPoints: 2,
  });
  
  // 3. Dispatch to specialist
  await runSkill('dispatch-story', { story: hotfixStory });
  
  // 4. Execute immediately
  await executeStory(hotfixStory);
  
  // 5. Resume original story
  await updateStoryState(currentStory.id, 'IN_PROGRESS');
}

// For feature request
async function handleFeatureRequest(changeRequest) {
  // 1. Add to backlog
  await addToBacklog({
    title: changeRequest.title,
    priority: changeRequest.priority,
    estimatedPoints: changeRequest.estimatedPoints,
  });
  
  // 2. If P0, add to current sprint
  if (changeRequest.priority === 'P0') {
    await addToSprint(changeRequest);
    await removeFromSprint(lowestPriorityStory);
  }
  
  // 3. Update sprint plan
  await updateSprintPlan();
}

// For scope change
async function handleScopeChange(changeRequest) {
  // 1. Update current story
  await updateStory(currentStory.id, {
    acceptanceCriteria: changeRequest.newCriteria,
    estimatedPoints: changeRequest.newEstimate,
  });
  
  // 2. Re-estimate if needed
  if (changeRequest.estimateChanged) {
    await updateSprintCapacity();
  }
  
  // 3. Update sprint plan
  await updateSprintPlan();
}
```

### Step 5: Generate Change Report
```markdown
# Change Request: CR-001

## Status: ACCEPTED / REJECTED / DEFERRED

## Summary
- **Type:** Feature Request
- **Priority:** P1
- **Requested by:** User
- **Date:** 2024-01-15

## Description
Add dark mode toggle to settings page

## Impact Analysis
- **Current Story:** Low impact
- **Sprint Scope:** Can add without removing
- **Timeline:** +2 hours

## Decision
**ACCEPTED** - Add to current sprint

## Action Items
- [ ] Create dark mode story
- [ ] Estimate: 5 points
- [ ] Add to sprint backlog
- [ ] Dispatch to ui-engineer

## Updated Sprint Plan
| Story | Points | Status |
|-------|--------|--------|
| Auth | 8 | In Progress |
| Dashboard | 5 | Done |
| Dark Mode | 5 | NEW |
| API | 13 | Pending |
```

### Step 6: Update Sprint State
```json
{
  "sprintId": "2024-S1",
  "changeRequests": [
    {
      "id": "CR-001",
      "type": "feature",
      "priority": "P1",
      "status": "accepted",
      "addedAt": "2024-01-15T14:00:00Z",
      "storyId": "UI-005"
    }
  ],
  "sprintAdjusted": true,
  "adjustmentReason": "Feature request: Dark mode"
}
```

## Output
- Change request classified
- Impact analysis completed
- Decision made (accept/reject/defer)
- Sprint plan updated
- State updated
