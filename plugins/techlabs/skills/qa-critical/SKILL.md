# qa-critical

Handle critical bugs found by QA.

## When to Use
- QA finds critical bug
- QA finds security vulnerability
- QA finds data loss bug
- QA finds system crash bug

## Agents to Dispatch
- security-lead: Security bugs
- quality-lead: Bug severity
- lead-agent: Decision making

## Enforcement

```
⚠️ MANDATORY: Critical bugs block story

QA CRITICAL:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

QA FINDS CRITICAL BUG:
- Story blocked
- Lead notified

ANALYZE:
- What's the bug?
- How severe?
- Can we fix quickly?

DECIDE:
- Option A: Fix now (hotfix)
- Option B: Create hotfix story
- Option C: Defer (with risk assessment)
```

## Execution

### Step 1: Receive QA Report
```
LOAD:
- production/stories/{story-id}.md
- QA report
- Bug details

EXTRACT:
- Story ID
- Bug description
- Severity
- Impact
- Steps to reproduce
```

### Step 2: Analyze Bug
```javascript
async function analyzeCriticalBug(bug) {
  const analysis = {
    storyId: bug.storyId,
    description: bug.description,
    severity: bug.severity,
    impact: bug.impact,
    bugType: identifyBugType(bug),
    canFixQuickly: false,
    fixTimeEstimate: 0,
    riskLevel: calculateRisk(bug),
    recommendation: null
  };
  
  // Check if can fix quickly
  analysis.canFixQuickly = await canFixQuickly(bug);
  analysis.fixTimeEstimate = await estimateFixTime(bug);
  
  // Calculate risk
  analysis.riskLevel = calculateRisk(bug);
  
  // Make recommendation
  analysis.recommendation = makeRecommendation(analysis);
  
  return analysis;
}

function identifyBugType(bug) {
  if (bug.type === 'security') return 'SECURITY';
  if (bug.type === 'data_loss') return 'DATA_LOSS';
  if (bug.type === 'crash') return 'CRASH';
  if (bug.type === 'corruption') return 'CORRUPTION';
  return 'OTHER';
}

function calculateRisk(bug) {
  const highRisk = ['SECURITY', 'DATA_LOSS', 'CORRUPTION'];
  const mediumRisk = ['CRASH'];
  
  if (highRisk.includes(identifyBugType(bug))) return 'HIGH';
  if (mediumRisk.includes(identifyBugType(bug))) return 'MEDIUM';
  return 'LOW';
}

function makeRecommendation(analysis) {
  // If security/data loss: fix now
  if (analysis.bugType === 'SECURITY' || analysis.bugType === 'DATA_LOSS') {
    return 'FIX_NOW';
  }
  
  // If can fix quickly: fix now
  if (analysis.canFixQuickly && analysis.fixTimeEstimate <= 2) {
    return 'FIX_NOW';
  }
  
  // If crash: fix now or create story
  if (analysis.bugType === 'CRASH') {
    return analysis.canFixQuickly ? 'FIX_NOW' : 'CREATE_STORY';
  }
  
  // Default: create story
  return 'CREATE_STORY';
}
```

### Step 3: Present Options to Lead
```
LEAD REVIEWS OPTIONS:

1. FIX NOW (HOTFIX):
   - Fix immediately
   - Block story until fixed
   - Re-test after fix
   - Good for: security, data loss, quick fixes

2. CREATE HOTFIX STORY:
   - Create new story for bug
   - Add to current or next sprint
   - Continue current story (if non-critical)
   - Good for: complex bugs

3. DEFER (WITH RISK):
   - Document bug
   - Accept risk
   - Fix in next sprint
   - Good for: low-risk bugs
```

### Step 4: Make Decision
```
LEAD DECIDES:

IF FIX NOW:
  - Dev fixes bug immediately
  - QA re-tests
  - Story continues
  - Update QA report

IF CREATE STORY:
  - Create hotfix story
  - Add to sprint
  - Continue current story
  - Fix hotfix in parallel

IF DEFER:
  - Document bug
  - Get approval
  - Accept risk
  - Fix later
```

### Step 5: Document Decision
```json
{
  "qaCriticalId": "QA-CRIT-001",
  "storyId": "AUTH-001",
  "bug": {
    "description": "SQL injection vulnerability",
    "severity": "CRITICAL",
    "type": "SECURITY",
    "impact": "Data breach possible"
  },
  "analysis": {
    "bugType": "SECURITY",
    "riskLevel": "HIGH",
    "canFixQuickly": true,
    "fixTimeEstimate": 1
  },
  "decision": "FIX_NOW",
  "rationale": "Security bug must be fixed before deploy",
  "action": "Dev fixes immediately",
  "retestRequired": true,
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 6: Execute Decision
```
IF FIX NOW:
  - Dev fixes
  - QA re-tests
  - Story continues

IF CREATE STORY:
  - Create story
  - Add to sprint
  - Continue

IF DEFER:
  - Document
  - Get approval
  - Continue
```

## Output
- Critical bug analyzed
- Decision made
- Action taken
- Story updated
