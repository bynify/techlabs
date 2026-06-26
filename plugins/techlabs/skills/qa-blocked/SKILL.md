# qa-blocked

Handle QA unable to proceed.

## When to Use
- QA can't access environment
- QA can't test due to bugs
- QA missing test data
- QA blocked by dependency

## Agents to Dispatch
- devops-lead: Environment issues
- quality-lead: QA coordination
- lead-agent: Decision making

## Enforcement

```
⚠️ MANDATORY: QA blockers must be resolved before story continues

QA BLOCKED:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

QA REPORTS BLOCK:
- Story blocked
- Lead notified

ANALYZE:
- Why blocked?
- Can we fix environment?
- Can we skip QA?
- Can we manual QA?

DECIDE:
- Option A: Fix environment
- Option B: Manual QA (lead)
- Option C: Skip QA (risky)
- Option D: Reassign QA
```

## Execution

### Step 1: Receive QA Block Report
```
LOAD:
- production/stories/{story-id}.md
- QA block report
- Block reason

EXTRACT:
- Story ID
- Block reason
- Environment status
- Test data status
- Dependency status
```

### Step 2: Analyze Block
```javascript
async function analyzeQABlock(block) {
  const analysis = {
    storyId: block.storyId,
    reason: block.reason,
    blockType: identifyBlockType(block),
    canFixEnvironment: false,
    canManualQA: false,
    canSkipQA: false,
    canReassign: false,
    riskLevel: calculateRisk(block),
    recommendation: null
  };
  
  // Check each option
  analysis.canFixEnvironment = await canFixEnvironment(block);
  analysis.canManualQA = await canManualQA(block);
  analysis.canSkipQA = await canSkipQA(block);
  analysis.canReassign = await canReassign(block);
  
  // Calculate risk
  analysis.riskLevel = calculateRisk(block);
  
  // Make recommendation
  analysis.recommendation = makeRecommendation(analysis);
  
  return analysis;
}

function identifyBlockType(block) {
  if (block.reason.includes('environment')) return 'ENVIRONMENT';
  if (block.reason.includes('test data')) return 'TEST_DATA';
  if (block.reason.includes('dependency')) return 'DEPENDENCY';
  if (block.reason.includes('bug')) return 'BUG';
  return 'OTHER';
}

function calculateRisk(block) {
  if (block.type === 'SECURITY') return 'HIGH';
  if (block.type === 'REGRESSION') return 'HIGH';
  if (block.type === 'FEATURE') return 'MEDIUM';
  return 'LOW';
}

function makeRecommendation(analysis) {
  // If environment: fix environment
  if (analysis.blockType === 'ENVIRONMENT' && analysis.canFixEnvironment) {
    return 'FIX_ENVIRONMENT';
  }
  
  // If can manual QA: lead does QA
  if (analysis.canManualQA) {
    return 'MANUAL_QA';
  }
  
  // If high risk: cannot skip
  if (analysis.riskLevel === 'HIGH') {
    return 'FIX_ENVIRONMENT';
  }
  
  // If low risk: can skip
  if (analysis.canSkipQA && analysis.riskLevel === 'LOW') {
    return 'SKIP_QA';
  }
  
  // Default: fix environment
  return 'FIX_ENVIRONMENT';
}
```

### Step 3: Present Options to Lead
```
LEAD REVIEWS OPTIONS:

1. FIX ENVIRONMENT:
   - Escalate to devops
   - Fix environment
   - QA continues
   - Good for: environment issues

2. MANUAL QA (LEAD):
   - Lead does QA
   - Test critical paths
   - Document results
   - Good for: small features

3. SKIP QA (RISKY):
   - Accept risk
   - Deploy to staging
   - Test in staging
   - Good for: low-risk features

4. REASSIGN QA:
   - Assign to different QA
   - Continue testing
   - Good for: QA unavailability
```

### Step 4: Make Decision
```
LEAD DECIDES:

IF FIX ENVIRONMENT:
  - Escalate to devops
  - Fix environment
  - QA continues

IF MANUAL QA:
  - Lead does QA
  - Test critical paths
  - Document results
  - Continue

IF SKIP QA:
  - Document risk
  - Get approval
  - Deploy to staging
  - Test in staging

IF REASSIGN:
  - Find available QA
  - Reassign story
  - Continue
```

### Step 5: Document Decision
```json
{
  "qaBlockId": "QA-BLOCK-001",
  "storyId": "AUTH-001",
  "block": {
    "reason": "QA environment down",
    "type": "ENVIRONMENT",
    "riskLevel": "MEDIUM"
  },
  "analysis": {
    "canFixEnvironment": true,
    "canManualQA": true,
    "canSkipQA": false,
    "canReassign": true
  },
  "decision": "FIX_ENVIRONMENT",
  "rationale": "Environment issues must be fixed first",
  "action": "Escalate to devops",
  "escalatedTo": "devops-lead",
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 6: Execute Decision
```
IF FIX ENVIRONMENT:
  - Escalate to devops
  - Fix environment
  - Notify QA

IF MANUAL QA:
  - Lead does QA
  - Document results

IF SKIP QA:
  - Document risk
  - Get approval
  - Deploy

IF REASSIGN:
  - Find QA
  - Reassign
```

## Output
- QA block analyzed
- Decision made
- Action taken
- Story continues
