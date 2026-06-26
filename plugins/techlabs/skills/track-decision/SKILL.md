# track-decision

Track a decision made during development.

## When to Use
- Decision tracking
- Architecture decisions
- ADR management
- Decision log

## Execution

### Step 1: Gather Decision Details
```
ASK:
1. What skill/agent made this decision?
2. What was the decision?
3. What were the alternatives?
4. What was the context?
5. What was the outcome?
```

### Step 2: Update History
```
ADD to .claude/analytics/decision-history.yaml:
- id: Unique ID
- date: Current timestamp
- skill: Skill name
- agent: Agent name
- decision: Decision made
- context: Why
- alternatives: Other options
- outcome: success/pending/failed
- notes: Additional info
```

### Step 3: Update Patterns
```
UPDATE patterns:
- User preferences
- Success patterns
- Recommendations
```

## Output
- Updated decision history
- Updated patterns
