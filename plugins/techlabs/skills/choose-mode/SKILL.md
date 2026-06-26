# choose-mode

Select project operating mode (speed, quality, research).

## When to Use
- Project kickoff
- Sprint planning
- Resource allocation

## Execution

### Step 1: Define Modes
```
MODES:
- Speed: Ship fast, technical debt OK
- Quality: Production-ready, tests required
- Research: Spike, disposable code OK
```

### Step 2: Ask Context
```
QUESTIONS:
1. What's the deadline?
2. Is this production or prototype?
3. What's the risk tolerance?
4. Team capacity?
```

### Step 3: Configure
```
IF mode == "speed":
  → Skip optional tests
  → Minimal docs
  → Quick iterations

IF mode == "quality":
  → Full test coverage
  → Documentation required
  → Code review mandatory

IF mode == "research":
  → Spike solution
  → Document findings
  → No production deploy
```

## Output
- Mode selected
- Configuration applied
- Team aligned
