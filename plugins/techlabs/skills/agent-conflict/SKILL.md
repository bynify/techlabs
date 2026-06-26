# agent-conflict

Handle conflicting feedback between agents.

## When to Use
- Agents give opposite recommendations
- Security says one thing, quality says another
- Performance vs security trade-off
- Speed vs quality trade-off

## Agents to Dispatch
- technical-director: Conflict resolution
- lead-agent: Mediation

## Enforcement

```
⚠️ MANDATORY: All conflicts must be resolved before approval

CONFLICT RESOLUTION:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

IDENTIFY CONFLICT:
- Agent A: Says X
- Agent B: Says Y
- X and Y are contradictory

ANALYZE:
- What's the conflict?
- Which domain is higher priority?
- Can we compromise?

DECIDE:
- Option A: Higher priority domain wins
- Option B: Compromise solution
- Option C: Escalate to technical-director
```

## Execution

### Step 1: Identify Conflict
```
LOAD:
- production/scope-discussions/{scope-id}.json

IDENTIFY:
- Which agents gave conflicting feedback?
- What are the conflicting recommendations?
- What domains are affected?
```

### Step 2: Analyze Conflict
```javascript
async function analyzeConflict(conflict) {
  const analysis = {
    agentA: conflict.agentA,
    agentB: conflict.agentB,
    domainA: conflict.domainA,
    domainB: conflict.domainB,
    recommendationA: conflict.recommendationA,
    recommendationB: conflict.recommendationB,
    conflictType: identifyConflictType(conflict),
    priorityA: getDomainPriority(conflict.domainA),
    priorityB: getDomainPriority(conflict.domainB),
    canCompromise: false,
    compromise: null
  };
  
  // Check if can compromise
  analysis.canCompromise = await canCompromise(conflict);
  
  // Try to find compromise
  if (analysis.canCompromise) {
    analysis.compromise = await findCompromise(conflict);
  }
  
  return analysis;
}

function getDomainPriority(domain) {
  const priorities = {
    'security': 1,      // HIGHEST
    'compliance': 1,
    'architecture': 2,
    'performance': 3,
    'scalability': 3,
    'quality': 4,
    'testing': 4,
    'documentation': 5   // LOWEST
  };
  return priorities[domain] || 3;
}

function identifyConflictType(conflict) {
  // Trade-off: Both valid but can't have both
  if (conflict.type === 'trade-off') return 'TRADE_OFF';
  
  // Contradiction: One must be wrong
  if (conflict.type === 'contradiction') return 'CONTRADICTION';
  
  // Incomplete: One agent missing info
  if (conflict.type === 'incomplete') return 'INCOMPLETE';
  
  return 'UNKNOWN';
}
```

### Step 3: Try Compromise
```
LEAD TRIES TO COMPROMISE:

IF TRADE_OFF:
  - Find middle ground
  - Example: "Encrypt but use fast algorithm"
  - Example: "Test critical paths only"
  
IF CONTRADICTION:
  - Find which is correct
  - Verify facts
  - Make decision
  
IF INCOMPLETE:
  - Get more info from agent
  - Re-analyze
```

### Step 4: Make Decision
```
IF COMPROMISE FOUND:
  → Apply compromise
  → Document compromise
  → Notify both agents

IF NO COMPROMISE AND DIFFERENT PRIORITIES:
  → Higher priority wins
  → Document decision
  → Notify losing agent

IF NO COMPROMISE AND SAME PRIORITY:
  → Escalate to technical-director
  → Technical director decides
```

### Step 5: Document Resolution
```json
{
  "conflictId": "CONFLICT-001",
  "scopeId": "SCOPE-001",
  "agentA": {
    "name": "security-lead",
    "domain": "security",
    "recommendation": "Encrypt phone with AES-256"
  },
  "agentB": {
    "name": "quality-lead",
    "domain": "quality",
    "recommendation": "Skip encryption for MVP"
  },
  "conflictType": "TRADE_OFF",
  "priorityA": 1,
  "priorityB": 4,
  "compromiseFound": true,
  "compromise": "Encrypt phone with AES-256, add tests later",
  "decision": "COMPROMISE",
  "rationale": "Security is higher priority, quality can add tests in next sprint",
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 6: Notify Agents
```
NOTIFY AGENTS:
- Security-lead: "Compromise: encrypt phone, tests in next sprint"
- Quality-lead: "Compromise: encrypt phone, tests in next sprint"

UPDATE SCOPE DISCUSSION:
- Add conflict resolution
- Add compromise details
```

## Output
- Conflict identified
- Compromise found or escalated
- Decision documented
- Agents notified
