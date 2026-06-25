# create-architecture

Create system architecture documentation.

## Execution

### Step 1: Gather Requirements
```
ASK USER:
1. What are the main components?
2. How do they communicate?
3. What's the data flow?
4. What are the integration points?
5. What are the scaling requirements?
```

### Step 2: Load Context
```
READ:
- docs/PRD.md (requirements)
- docs/stack-reference/ (stack documentation)
- CLAUDE.md (project config)
```

### Step 3: Design Architecture
```
CREATE docs/architecture.md WITH:
- System overview diagram
- Component descriptions
- Data flow diagrams
- Integration points
- Security considerations
- Scalability strategy
- Monitoring plan
- Deployment architecture
```

### Step 4: Present Draft
```
SHOW:
- Architecture draft to user
- Request approval
- Make adjustments if needed
```

### Step 5: Finalize
```
WRITE:
- docs/architecture.md (final version)
- Update production/session-state/active.md
```

## Output
- Created docs/architecture.md
- Updated session state
