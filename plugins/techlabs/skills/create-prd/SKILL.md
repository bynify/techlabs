# create-prd

Create a Product Requirements Document (PRD).

## Execution

### Step 1: Gather Information
```
ASK USER:
1. What problem does this product solve?
2. Who are the target users?
3. What are the key features?
4. What's the timeline?
5. What are the success metrics?
```

### Step 2: Load Context
```
READ:
- docs/ (existing documentation)
- CLAUDE.md (project config)
- production/session-state/active.md (current state)
```

### Step 3: Create PRD
```
CREATE docs/PRD.md WITH:
- Overview section
- Problem statement
- Target audience
- Goals & objectives
- Features (P0, P1, P2)
- User stories with acceptance criteria
- Success metrics
- Timeline
- Risks & mitigations
- Open questions
```

### Step 4: Present Draft
```
SHOW:
- PRD draft to user
- Request approval
- Make adjustments if needed
```

### Step 5: Finalize
```
WRITE:
- docs/PRD.md (final version)
- Update production/session-state/active.md
```

## Output
- Created docs/PRD.md
- Updated session state
