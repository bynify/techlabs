# impl-blocked

Handle dev unable to meet conditions.

## When to Use
- Dev says "can't implement"
- Dev says "need more time"
- Dev says "too complex"
- Dev says "blocked by dependency"

## Agents to Dispatch
- lead-agent: Decision making
- technical-director: Escalation

## Enforcement

```
⚠️ MANDATORY: All implementation blockers must be resolved

IMPL BLOCKER:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RECEIVE BLOCKER:
- Dev reports inability
- Lead receives report

ANALYZE:
- Why blocked?
- Can we simplify?
- Can we add time?
- Can we split?

DECIDE:
- Option A: Simplify condition
- Option B: Add more time
- Option C: Split story
- Option D: Remove condition (with approval)
```

## Execution

### Step 1: Receive Blocker Report
```
LOAD:
- production/stories/{story-id}.md
- Current conditions
- Dev's blocker report

EXTRACT:
- Story ID
- Conditions list
- Which condition blocked
- Reason for blockage
```

### Step 2: Analyze Blocker
```javascript
async function analyzeBlocker(blocker) {
  const analysis = {
    storyId: blocker.storyId,
    condition: blocker.condition,
    reason: blocker.reason,
    blockerType: identifyBlockerType(blocker),
    canSimplify: false,
    canAddTime: false,
    canSplit: false,
    canRemove: false,
    recommendation: null
  };
  
  // Check each option
  analysis.canSimplify = await canSimplifyCondition(blocker);
  analysis.canAddTime = await canAddTime(blocker);
  analysis.canSplit = await canSplitStory(blocker);
  analysis.canRemove = await canRemoveCondition(blocker);
  
  // Make recommendation
  analysis.recommendation = makeRecommendation(analysis);
  
  return analysis;
}

function identifyBlockerType(blocker) {
  if (blocker.reason.includes('complex')) return 'COMPLEXITY';
  if (blocker.reason.includes('dependency')) return 'DEPENDENCY';
  if (blocker.reason.includes('time')) return 'TIME';
  if (blocker.reason.includes('skill')) return 'SKILL';
  return 'UNKNOWN';
}

function makeRecommendation(analysis) {
  // If complexity: simplify
  if (analysis.blockerType === 'COMPLEXITY' && analysis.canSimplify) {
    return 'SIMPLIFY';
  }
  
  // If dependency: split story
  if (analysis.blockerType === 'DEPENDENCY' && analysis.canSplit) {
    return 'SPLIT';
  }
  
  // If time: add more time
  if (analysis.blockerType === 'TIME' && analysis.canAddTime) {
    return 'ADD_TIME';
  }
  
  // If skill: reassign or escalate
  if (analysis.blockerType === 'SKILL') {
    return 'ESCALATE';
  }
  
  // Default: try to simplify
  if (analysis.canSimplify) return 'SIMPLIFY';
  if (analysis.canAddTime) return 'ADD_TIME';
  if (analysis.canSplit) return 'SPLIT';
  if (analysis.canRemove) return 'REMOVE';
  
  return 'ESCALATE';
}
```

### Step 3: Present Options to Lead
```
LEAD REVIEWS OPTIONS:

1. SIMPLIFY CONDITION:
   - Break condition into smaller parts
   - Do MVP version first
   - Add full version later
   
2. ADD MORE TIME:
   - Extend story timeline
   - Keep conditions same
   - Adjust sprint plan
   
3. SPLIT STORY:
   - Break story into 2 stories
   - MVP story (current sprint)
   - Full story (next sprint)
   
4. REMOVE CONDITION:
   - Remove condition entirely
   - Requires approval from source agent
   - Document why removed
   
5. ESCALATE:
   - Escalate to technical-director
   - Technical director decides
```

### Step 4: Make Decision
```
LEAD DECIDES:

IF SIMPLIFY:
  - Modify condition to be simpler
  - Break into phases
  - Example: "Full encryption" → "Basic encryption now, full later"

IF ADD_TIME:
  - Extend story time
  - Update sprint plan
  - Notify team

IF SPLIT:
  - Create 2 stories
  - MVP story: basic condition
  - Full story: all conditions
  - Assign MVP to current sprint
  - Assign full to next sprint

IF REMOVE:
  - Get approval from source agent
  - Remove condition
  - Document reason
  - Accept risk

IF ESCALATE:
  - Notify technical-director
  - Provide context
  - Wait for decision
```

### Step 5: Document Resolution
```json
{
  "blockerId": "BLOCK-001",
  "storyId": "AUTH-001",
  "condition": "Full AES-256 encryption",
  "reason": "Too complex, need crypto library",
  "blockerType": "COMPLEXITY",
  "resolution": "SPLIT",
  "details": {
    "mvpStory": "AUTH-001A",
    "mvpCondition": "Basic encryption (AES-128)",
    "fullStory": "AUTH-001B",
    "fullCondition": "Full encryption (AES-256)"
  },
  "approvalRequired": false,
  "approvedBy": "lead-agent",
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 6: Update Story State
```
UPDATE:
- production/stories/{story-id}.md
- production/sprint/state.json
- production/sprint-plan.md

IF SPLIT:
  - Create new stories
  - Update sprint plan
  - Assign stories
```

## Output
- Blocker analyzed
- Options presented
- Decision made
- Story updated
