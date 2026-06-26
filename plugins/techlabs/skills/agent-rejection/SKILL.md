# agent-rejection

Handle agent rejecting scope change with escalation path.

## When to Use
- Agent rejects scope change
- Agent says "not feasible"
- Agent says "too risky"
- Agent says "not in domain"

## Agents to Dispatch
- technical-director: Escalation path
- lead-agent: Coordination

## Enforcement

```
⚠️ MANDATORY: All agent rejections must be handled

REJECTION HANDLING:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RECEIVE REJECTION:
- Agent provides reason
- Lead receives rejection

ANALYZE:
- Why rejected?
- Is alternative possible?
- Can we simplify?

DECIDE:
- Option A: Find alternative
- Option B: Simplify change
- Option C: Reject change to dev
- Option D: Escalate to technical-director
```

## Execution

### Step 1: Receive Rejection
```
LOAD:
- production/scope-discussions/{scope-id}.json
- Agent rejection details

EXTRACT:
- Agent name
- Rejection reason
- Concerns raised
- Domain affected
```

### Step 2: Analyze Rejection
```javascript
async function analyzeRejection(rejection) {
  const analysis = {
    reason: rejection.reason,
    domain: rejection.domain,
    concerns: rejection.concerns,
    severity: calculateSeverity(rejection),
    alternatives: [],
    canSimplify: false,
    canEscalate: false
  };
  
  // Check if alternative exists
  analysis.alternatives = await findAlternatives(rejection);
  
  // Check if can simplify
  analysis.canSimplify = await canSimplifyChange(rejection);
  
  // Check if should escalate
  analysis.canEscalate = analysis.severity === 'HIGH' || 
                         rejection.domain === 'security' ||
                         rejection.domain === 'architecture';
  
  return analysis;
}

function calculateSeverity(rejection) {
  const highSeverity = ['security', 'architecture', 'compliance'];
  const mediumSeverity = ['performance', 'scalability'];
  
  if (highSeverity.includes(rejection.domain)) return 'HIGH';
  if (mediumSeverity.includes(rejection.domain)) return 'MEDIUM';
  return 'LOW';
}
```

### Step 3: Find Alternatives
```
LEAD ANALYZES:
- Can we do it differently?
- Can we use different approach?
- Can we simplify the change?

IF alternative found:
  - Re-discuss with agent
  - Get new approval

IF no alternative:
  - Go to Step 4
```

### Step 4: Decide Action
```
IF HIGH SEVERITY:
  → Escalate to technical-director
  → Technical director makes final decision
  
IF MEDIUM SEVERITY:
  → Lead tries to find alternative
  → If no alternative, reject change to dev
  
IF LOW SEVERITY:
  → Lead decides to simplify or reject
```

### Step 5: Document Decision
```json
{
  "rejectionId": "REJ-001",
  "scopeId": "SCOPE-001",
  "agent": "security-lead",
  "reason": "Phone data must be encrypted",
  "domain": "security",
  "severity": "HIGH",
  "alternativesFound": false,
  "action": "ESCALATED",
  "escalatedTo": "technical-director",
  "decision": "Approved with conditions",
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 6: Take Action
```
IF ESCALATED:
  - Notify technical-director
  - Provide full context
  - Wait for decision
  
IF REJECTED:
  - Notify dev
  - Explain reason
  - Suggest alternative
  
IF ALTERNATIVE:
  - Re-discuss with agent
  - Update scope change
  - Get new approval
```

## Output
- Rejection analyzed
- Alternative found or escalation triggered
- Decision documented
- Action taken
