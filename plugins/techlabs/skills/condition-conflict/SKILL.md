# condition-conflict

Handle conflicting conditions from different agents.

## When to Use
- Conditions contradict each other
- Condition A requires X, Condition B requires not-X
- Condition priorities unclear
- Too many conditions

## Agents to Dispatch
- technical-director: Priority resolution
- lead-agent: Condition prioritization

## Enforcement

```
⚠️ MANDATORY: All conditions must be non-conflicting

CONDITION CONFLICT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

IDENTIFY CONFLICT:
- Condition 1: Says do X
- Condition 2: Says don't do X
- Cannot do both

ANALYZE:
- Which condition is more important?
- Can we satisfy both?
- Can we simplify?

DECIDE:
- Option A: Higher priority wins
- Option B: Find compromise
- Option C: Remove one condition
```

## Execution

### Step 1: Identify Conflicting Conditions
```
LOAD:
- production/scope-discussions/{scope-id}.json

IDENTIFY:
- List all conditions from all agents
- Check for contradictions
- Check for dependencies
```

### Step 2: Analyze Conditions
```javascript
async function analyzeConditions(conditions) {
  const analysis = {
    total: conditions.length,
    conflicts: [],
    priorities: [],
    canSatisfyAll: false,
    resolution: null
  };
  
  // Check for conflicts
  for (let i = 0; i < conditions.length; i++) {
    for (let j = i + 1; j < conditions.length; j++) {
      if (isConflicting(conditions[i], conditions[j])) {
        analysis.conflicts.push({
          conditionA: conditions[i],
          conditionB: conditions[j],
          reason: getConflictReason(conditions[i], conditions[j])
        });
      }
    }
  }
  
  // Prioritize conditions
  analysis.priorities = prioritizeConditions(conditions);
  
  // Check if can satisfy all
  analysis.canSatisfyAll = analysis.conflicts.length === 0;
  
  return analysis;
}

function isConflicting(conditionA, conditionB) {
  // Direct contradiction
  if (conditionA.type === 'require' && conditionB.type === 'forbid') {
    return conditionA.target === conditionB.target;
  }
  
  // Resource conflict
  if (conditionA.resource && conditionB.resource) {
    if (conditionA.resource === conditionB.resource) {
      return conditionA.amount + conditionB.amount > MAX_RESOURCE;
    }
  }
  
  return false;
}

function prioritizeConditions(conditions) {
  return conditions.sort((a, b) => {
    // P0: Security conditions (must do)
    if (a.source === 'security' && b.source !== 'security') return -1;
    if (b.source === 'security' && a.source !== 'security') return 1;
    
    // P1: Compliance conditions (must do)
    if (a.source === 'compliance' && b.source !== 'compliance') return -1;
    if (b.source === 'compliance' && a.source !== 'compliance') return 1;
    
    // P2: Quality conditions (should do)
    if (a.source === 'quality' && b.source !== 'quality') return -1;
    if (b.source === 'quality' && a.source !== 'quality') return 1;
    
    // P3: Documentation conditions (nice to have)
    if (a.source === 'documentation' && b.source !== 'documentation') return -1;
    if (b.source === 'documentation' && a.source !== 'documentation') return 1;
    
    return 0;
  });
}
```

### Step 3: Find Resolution
```
IF NO CONFLICT:
  → All conditions can be satisfied
  → Proceed with all conditions

IF CONFLICT EXISTS:
  → Lead analyzes conflict
  → Tries to find compromise
  → If no compromise, higher priority wins
```

### Step 4: Make Decision
```
DECISION MATRIX:

PRIORITY LEVELS:
- P0: Security/Compliance → MUST DO
- P1: Performance/Scalability → SHOULD DO
- P2: Quality/Testing → SHOULD DO
- P3: Documentation → NICE TO HAVE

IF P0 vs P1:
  → P0 wins (Security over Performance)
  → Example: "Encrypt phone, optimize later"

IF P0 vs P2:
  → P0 wins (Security over Quality)
  → Example: "Encrypt phone, test later"

IF P0 vs P3:
  → P0 wins (Security over Documentation)
  → Example: "Encrypt phone, document later"

IF P1 vs P2:
  → P1 wins (Performance over Quality)
  → Example: "Cache data, test later"

IF P1 vs P3:
  → P1 wins (Performance over Documentation)
  → Example: "Cache data, document later"

IF P2 vs P3:
  → P2 wins (Quality over Documentation)
  → Example: "Test code, document later"
```

### Step 5: Document Resolution
```json
{
  "conflictId": "COND-CONFLICT-001",
  "scopeId": "SCOPE-001",
  "conditions": [
    {
      "id": "COND-001",
      "source": "security-lead",
      "priority": "P0",
      "requirement": "Encrypt phone with AES-256"
    },
    {
      "id": "COND-002",
      "source": "quality-lead",
      "priority": "P2",
      "requirement": "Skip encryption for faster testing"
    }
  ],
  "conflict": "Encrypt vs Skip encryption",
  "resolution": "Encrypt phone (P0 wins over P2)",
  "rationale": "Security is higher priority than testing speed",
  "conditionsKept": ["COND-001"],
  "conditionsRemoved": ["COND-002"],
  "compromise": "Encrypt phone, optimize testing later",
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 6: Update Scope Discussion
```
UPDATE:
- production/scope-discussions/{scope-id}.json
- Add condition conflict resolution
- Update conditions list
- Mark conflict as resolved
```

## Output
- Conflicting conditions identified
- Priority analysis done
- Resolution made
- Conditions updated
