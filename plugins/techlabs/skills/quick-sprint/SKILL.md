# quick-sprint

Plan and execute sprint in one command.

## When to Use
- Planning docs already exist
- Want to start sprint quickly
- Don't want to run 2 commands manually

## What This Does

Chains 2 skills:

```
FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STEP 1: /sprint-plan
  → Create sprint plan
  → CHECKPOINT: "Sprint plan ready?"

STEP 2: /sprint-orchestrator
  → Execute sprint end-to-end
```

## Execution

### Step 1: Validate Prerequisites
```
CHECK:
1. PRD exists? (docs/PRD.md)
2. Architecture exists? (docs/architecture.md)
3. Stories exist? (production/stories/)

IF MISSING:
  → SHOW missing docs
  → ASK: "Run /new-project first?"
  → BLOCK sprint

IF EXISTS:
  → CONTINUE
```

### Step 2: Run Sprint Plan
```
RUN /sprint-plan

CHECKPOINT:
" sprint plan created with [X] stories ([Y] points). Ready to execute?"

OPTIONS:
1. Start execution
2. Review plan first
3. Cancel
```

### Step 3: Run Sprint Orchestrator
```
RUN /sprint-orchestrator

→ Execute all stories
→ Run quality gates
→ Complete sprint
```

## Output
- Sprint planned
- Sprint executed
- Stories completed
