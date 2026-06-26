# full-cycle

Run complete sprint cycle: start → execute → review → transition.

## When to Use
- Continue from yesterday
- Want complete sprint cycle
- Sprint already planned

## What This Does

Chains 5 skills:

```
FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STEP 1: /start-day
  → Resume from last session
  → Show current status

STEP 2: /sprint-orchestrator
  → Execute all stories

STEP 3: /milestone-review
  → Sprint review
  → Demo completed work

STEP 4: /post-mortem
  → Retrospective
  → What went well, what to improve

STEP 5: /sprint-transition
  → Complete sprint
  → Start next sprint
```

## Execution

### Step 1: Resume Session
```
RUN /start-day

→ Load session state
→ Show current sprint status
→ Continue from last point
```

### Step 2: Execute Sprint
```
CHECKPOINT:
"Sprint ready to execute. Continue?"

RUN /sprint-orchestrator

→ Execute all stories
→ Run quality gates
```

### Step 3: Sprint Review
```
CHECKPOINT:
"Sprint execution complete. Run review?"

RUN /milestone-review

→ Demo completed work
→ Show metrics
```

### Step 4: Retrospective
```
RUN /post-mortem

→ What went well
→ What to improve
→ Action items
```

### Step 5: Transition
```
CHECKPOINT:
"Retrospective complete. Start next sprint?"

RUN /sprint-transition

→ Complete current sprint
→ Carryover stories
→ Initialize next sprint
```

## Output
- Sprint resumed
- Stories executed
- Review completed
- Retrospective done
- Next sprint started
