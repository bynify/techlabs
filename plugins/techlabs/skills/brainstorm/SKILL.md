# brainstorm

Structured ideation, feature exploration, and concept development.

## When to Use
- Starting a new project
- Exploring feature ideas
- Solving complex problems
- Validating assumptions

## Execution

### MANDATORY GATES (Must Complete)
```
GATE 1: QUESTION GATE ✅
- ALL 5 questions MUST be asked
- User MUST respond
- NEVER skip questions

GATE 2: DRAFT GATE ✅
- Show brainstorm output to user
- Wait for approval
- NEVER proceed without approval

GATE 3: SAVE GATE ✅
- Save output to production/session-state/active.md
- Confirm save to user
```

### Step 1: Define Problem Space
```
ASK USER (ALL REQUIRED):
1. What problem are we solving?
2. Who has this problem?
3. Current solutions? Why insufficient?
4. Constraints? (time, budget, tech)
5. Success looks like?
```

### Step 2: Generate Ideas
```
BRAINSTORM TECHNIQUE: Mind Mapping

Core Problem: [Problem statement]
├── Category 1
│   ├── Idea A
│   ├── Idea B
│   └── Idea C
├── Category 2
│   ├── Idea D
│   └── Idea E
└── Category 3
    └── Idea F
```

### Step 3: Evaluate Ideas
```
FOR EACH idea, score:
- Impact (1-5): How much does this move the needle?
- Effort (1-5): How hard to implement?
- Risk (1-5): What could go wrong?

Priority = Impact / (Effort × Risk)
```

### Step 4: Create Action Plan
```markdown
## Selected Ideas

### Idea 1: [Name]
**Impact:** High | **Effort:** Medium | **Risk:** Low
- MVP scope: ...
- Timeline: 2 weeks
- Dependencies: ...

### Idea 2: [Name]
**Impact:** Medium | **Effort:** Low | **Risk:** Low
- Quick win, implement immediately
```

## Output
- Problem statement
- Idea map with scores
- Prioritized action plan
- Next steps defined
