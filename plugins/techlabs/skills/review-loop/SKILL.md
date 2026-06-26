# review-loop

Handle reviewer rejecting repeatedly.

## When to Use
- Reviewer rejects code review
- Dev fixes but reviewer still rejects
- Multiple review cycles
- Reviewer too strict

## Agents to Dispatch
- lead-agent: Reviewer intervention
- quality-lead: Quality standards

## Enforcement

```
⚠️ MANDATORY: Max 3 review cycles before escalation

REVIEW LOOP:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

REVIEW CYCLE 1:
- Reviewer rejects
- Dev fixes
- Re-review

REVIEW CYCLE 2:
- Reviewer rejects
- Dev fixes
- Re-review

REVIEW CYCLE 3:
- Reviewer rejects
- ESCALATE to lead
- Lead intervenes
```

## Execution

### Step 1: Track Review Cycles
```
LOAD:
- production/stories/{story-id}.md
- Review history

TRACK:
- Review cycle count
- Reviewer feedback per cycle
- Dev fixes per cycle
```

### Step 2: Check Review Cycle Count
```javascript
async function checkReviewCycle(storyId) {
  const reviewHistory = await loadReviewHistory(storyId);
  
  const status = {
    storyId,
    cycleCount: reviewHistory.cycles.length,
    maxCycles: 3,
    exceeded: reviewHistory.cycles.length >= 3,
    lastFeedback: reviewHistory.cycles[reviewHistory.cycles.length - 1]?.feedback,
    devFixes: reviewHistory.cycles[reviewHistory.cycles.length - 1]?.devFixes
  };
  
  return status;
}
```

### Step 3: Handle Based on Cycle Count
```
IF CYCLE 1:
  → Normal review process
  → Dev fixes
  → Re-review

IF CYCLE 2:
  → Lead notified
  → Reviewer asked to be more specific
  → Dev fixes
  → Re-review

IF CYCLE 3 (EXCEEDED):
  → ESCALATE to lead
  → Lead intervenes
  → Lead makes decision
```

### Step 4: Lead Intervention
```
LEAD INTERVENES WHEN:

1. REVIEWER TOO STRICT:
   - Reviewer has unrealistic standards
   - Reviewer blocking for minor issues
   - Lead overrides reviewer
   
2. DEV MISSING SOMETHING:
   - Dev not understanding feedback
   - Dev missing key points
   - Lead guides dev
   
3. REQUIREMENTS UNCLEAR:
   - Requirements ambiguous
   - Different interpretations
   - Lead clarifies requirements
   
4. CODE QUALITY ISSUE:
   - Fundamental problem
   - Need to rewrite
   - Lead decides approach
```

### Step 5: Make Decision
```
LEAD DECIDES:

IF REVIEWER TOO STRICT:
  - Override reviewer
  - Accept code
  - Document override
  - Discuss with reviewer

IF DEV MISSING POINTS:
  - Guide dev
  - Explain what's needed
  - Dev fixes again
  - Re-review

IF REQUIREMENTS UNCLEAR:
  - Clarify requirements
  - Update acceptance criteria
  - Dev fixes based on clarification
  - Re-review

IF FUNDAMENTAL ISSUE:
  - Rewrite required
  - Dev rewrites
  - Re-review from scratch
```

### Step 6: Document Decision
```json
{
  "reviewLoopId": "REVIEW-LOOP-001",
  "storyId": "AUTH-001",
  "cycleCount": 3,
  "reviewer": "lead-engineer",
  "dev": "backend-dev",
  "lastFeedback": "Code doesn't handle edge cases",
  "devFixes": "Added null checks",
  "reviewerRejection": "Still missing edge cases",
  "interventionReason": "Reviewer too strict",
  "decision": "Override reviewer",
  "rationale": "Null checks are sufficient for MVP",
  "actionTaken": "Code approved",
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 7: Notify Team
```
NOTIFY:
- Dev: "Code approved by lead"
- Reviewer: "Override applied, discuss later"
- QA: "Ready for testing"

UPDATE STORY:
- Mark as review approved
- Add intervention note
```

## Output
- Review cycle tracked
- Intervention triggered after 3 cycles
- Decision made
- Code approved or rewritten
