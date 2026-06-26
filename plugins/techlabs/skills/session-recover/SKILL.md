# session-recover

Handle corrupted session state and recovery.

## When to Use
- Session crashes
- State file corrupted
- Missing state files
- Inconsistent state

## Agents to Dispatch
- lead-agent: Recovery coordination

## Enforcement

```
⚠️ MANDATORY: Session recovery must be graceful

SESSION RECOVER:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SESSION CRASHED:
- State corrupted
- Start-day detects corruption

ANALYZE:
- What's corrupted?
- Can we restore from backup?
- Can we rebuild from files?

DECIDE:
- Option A: Restore from backup
- Option B: Rebuild from project files
- Option C: Manual recovery
```

## Execution

### Step 1: Detect Corruption
```
START-DAY DETECTS:
- State file corrupted
- Missing files
- Inconsistent data

LOAD:
- production/sprint/state.json
- production/sprint/state.json.backup
- production/session-state/
```

### Step 2: Analyze Corruption
```javascript
async function analyzeCorruption(corruption) {
  const analysis = {
    corruptionType: identifyCorruptionType(corruption),
    affectedFiles: corruption.affectedFiles,
    canRestoreBackup: false,
    canRebuildFromFiles: false,
    canManualRecover: false,
    dataLoss: calculateDataLoss(corruption),
    recommendation: null
  };
  
  // Check each option
  analysis.canRestoreBackup = await canRestoreBackup(corruption);
  analysis.canRebuildFromFiles = await canRebuildFromFiles(corruption);
  analysis.canManualRecover = await canManualRecover(corruption);
  
  // Calculate data loss
  analysis.dataLoss = calculateDataLoss(corruption);
  
  // Make recommendation
  analysis.recommendation = makeRecommendation(analysis);
  
  return analysis;
}

function identifyCorruptionType(corruption) {
  if (corruption.type === 'file_missing') return 'FILE_MISSING';
  if (corruption.type === 'json_invalid') return 'JSON_INVALID';
  if (corruption.type === 'data_inconsistent') return 'DATA_INCONSISTENT';
  return 'UNKNOWN';
}

function calculateDataLoss(corruption) {
  if (corruption.type === 'file_missing') return 'HIGH';
  if (corruption.type === 'json_invalid') return 'MEDIUM';
  if (corruption.type === 'data_inconsistent') return 'LOW';
  return 'UNKNOWN';
}

function makeRecommendation(analysis) {
  // If can restore backup: restore
  if (analysis.canRestoreBackup && analysis.dataLoss === 'HIGH') {
    return 'RESTORE_BACKUP';
  }
  
  // If can rebuild: rebuild
  if (analysis.canRebuildFromFiles && analysis.dataLoss === 'MEDIUM') {
    return 'REBUILD_FROM_FILES';
  }
  
  // If can manual: manual
  if (analysis.canManualRecover && analysis.dataLoss === 'LOW') {
    return 'MANUAL_RECOVER';
  }
  
  // Default: restore backup
  return 'RESTORE_BACKUP';
}
```

### Step 3: Present Options to Lead
```
LEAD REVIEWS OPTIONS:

1. RESTORE FROM BACKUP:
   - Restore from state.json.backup
   - May lose recent changes
   - Good for: file corruption

2. REBUILD FROM FILES:
   - Rebuild state from project files
   - Scan all files
   - Reconstruct state
   - Good for: missing data

3. MANUAL RECOVERY:
   - Lead manually recovers
   - Read files
   - Reconstruct state
   - Good for: minor issues
```

### Step 4: Make Decision
```
LEAD DECIDES:

IF RESTORE BACKUP:
  - Restore state.json.backup
  - Verify integrity
  - Continue

IF REBUILD FROM FILES:
  - Scan all project files
  - Reconstruct state
  - Verify completeness
  - Continue

IF MANUAL RECOVERY:
  - Lead reads files
  - Reconstructs state
  - Verifies accuracy
  - Continues
```

### Step 5: Execute Recovery
```
RESTORE BACKUP:
1. cp state.json.backup state.json
2. Verify file integrity
3. Check for recent changes
4. Continue

REBUILD FROM FILES:
1. Scan all project files
2. Reconstruct state object
3. Verify completeness
4. Save state
5. Continue

MANUAL RECOVERY:
1. Lead reads all relevant files
2. Reconstructs state
3. Verifies accuracy
4. Saves state
5. Continues
```

### Step 6: Document Recovery
```json
{
  "sessionRecoveryId": "SESSION-RECOVER-001",
  "corruption": {
    "type": "JSON_INVALID",
    "affectedFiles": ["production/sprint/state.json"],
    "dataLoss": "MEDIUM"
  },
  "analysis": {
    "canRestoreBackup": true,
    "canRebuildFromFiles": true,
    "canManualRecover": false,
    "recommendation": "RESTORE_BACKUP"
  },
  "decision": "RESTORE_BACKUP",
  "rationale": "Backup available, most reliable option",
  "recoveryStatus": "SUCCESS",
  "dataRecovered": "100%",
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 7: Verify Recovery
```
VERIFY:
- All files intact?
- State consistent?
- Recent changes?
- Continue safely?
```

## Output
- Corruption analyzed
- Recovery option selected
- State restored/rebuilt
- Session continues
