# deploy-rollback

Handle deployment failure and rollback.

## When to Use
- Deployment fails
- Build fails
- Tests fail in CI/CD
- Production issues after deploy

## Agents to Dispatch
- devops-lead: Deployment issues
- lead-agent: Decision making
- security-lead: Security issues

## Enforcement

```
⚠️ MANDATORY: Failed deployment must be handled

DEPLOY ROLLBACK:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

DEPLOYMENT FAILS:
- Auto-rollback triggered
- Team notified

ANALYZE:
- What failed?
- Why failed?
- How to fix?

DECIDE:
- Option A: Auto-rollback
- Option B: Manual rollback
- Option C: Hotfix forward
- Option D: Re-deploy later
```

## Execution

### Step 1: Detect Deployment Failure
```
LOAD:
- CI/CD pipeline status
- Deployment logs
- Error messages

EXTRACT:
- Build ID
- Error type
- Error message
- Failure point
```

### Step 2: Analyze Failure
```javascript
async function analyzeDeployFailure(failure) {
  const analysis = {
    buildId: failure.buildId,
    errorType: failure.errorType,
    errorMessage: failure.errorMessage,
    failurePoint: failure.failurePoint,
    canAutoRollback: false,
    canFixQuickly: false,
    fixTimeEstimate: 0,
    riskLevel: calculateRisk(failure),
    recommendation: null
  };
  
  // Check if can auto-rollback
  analysis.canAutoRollback = await canAutoRollback(failure);
  
  // Check if can fix quickly
  analysis.canFixQuickly = await canFixQuickly(failure);
  analysis.fixTimeEstimate = await estimateFixTime(failure);
  
  // Calculate risk
  analysis.riskLevel = calculateRisk(failure);
  
  // Make recommendation
  analysis.recommendation = makeRecommendation(analysis);
  
  return analysis;
}

function calculateRisk(failure) {
  if (failure.type === 'CRASH') return 'CRITICAL';
  if (failure.type === 'DATA_LOSS') return 'CRITICAL';
  if (failure.type === 'SECURITY') return 'CRITICAL';
  if (failure.type === 'PERFORMANCE') return 'HIGH';
  if (failure.type === 'BUG') return 'MEDIUM';
  return 'LOW';
}

function makeRecommendation(analysis) {
  // If critical: auto-rollback
  if (analysis.riskLevel === 'CRITICAL') {
    return 'AUTO_ROLLBACK';
  }
  
  // If can fix quickly: hotfix forward
  if (analysis.canFixQuickly && analysis.fixTimeEstimate <= 5) {
    return 'HOTFIX_FORWARD';
  }
  
  // If high risk: rollback
  if (analysis.riskLevel === 'HIGH') {
    return 'MANUAL_ROLLBACK';
  }
  
  // Default: try hotfix
  if (analysis.canFixQuickly) {
    return 'HOTFIX_FORWARD';
  }
  
  return 'MANUAL_ROLLBACK';
}
```

### Step 3: Handle Auto-Rollback
```
AUTO-ROLLBACK TRIGGERED:
1. Revert to previous version
2. Verify rollback worked
3. Check health endpoints
4. Notify team
5. Document incident
```

### Step 4: Make Decision
```
LEAD DECIDES:

IF AUTO_ROLLBACK:
  - Rollback automatically
  - Verify health
  - Notify team
  - Investigate failure

IF MANUAL_ROLLBACK:
  - Lead triggers rollback
  - Verify health
  - Notify team
  - Investigate failure

IF HOTFIX_FORWARD:
  - Dev fixes issue
  - Build passes
  - Re-deploy
  - Monitor

IF RE_DEPLOY_LATER:
  - Document failure
  - Schedule re-deploy
  - Notify team
```

### Step 5: Document Incident
```json
{
  "deployRollbackId": "DEPLOY-ROLLBACK-001",
  "buildId": "BUILD-123",
  "failure": {
    "type": "CRASH",
    "error": "Application crashes on startup",
    "failurePoint": "BUILD",
    "riskLevel": "CRITICAL"
  },
  "analysis": {
    "canAutoRollback": true,
    "canFixQuickly": false,
    "fixTimeEstimate": 0,
    "recommendation": "AUTO_ROLLBACK"
  },
  "decision": "AUTO_ROLLBACK",
  "rationale": "Critical failure, must rollback immediately",
  "rollbackStatus": "SUCCESS",
  "healthCheck": "PASS",
  "teamNotified": true,
  "incidentDocumented": true,
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 6: Investigate and Fix
```
INVESTIGATE:
- What caused failure?
- How to prevent?
- How to fix?

FIX:
- Create hotfix story
- Fix issue
- Test thoroughly
- Re-deploy
```

## Output
- Deployment failure analyzed
- Rollback triggered
- Incident documented
- Fix planned
