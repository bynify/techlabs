# architecture-decision

Create Architecture Decision Records (ADRs) for documenting technical decisions.

## When to Use

## Agents to Dispatch
- technical-director: Complex decisions
- lead-engineer: Technical review
- Choosing between frameworks or approaches
- Documenting why a decision was made
- Recording trade-offs considered
- Onboarding new team members

## Execution

### Step 1: Gather Context
```
ASK USER:
1. What decision needs to be made?
2. What are the options considered?
3. What are the constraints?
4. Who are the stakeholders?
```

### Step 2: Create ADR
```markdown
# ADR-{number}: {Title}

## Status
Proposed | Accepted | Deprecated | Superseded by [ADR-xxx]

## Date
{date}

## Context
What is the issue that motivates this decision? What forces are at play?

## Decision
What is the change being proposed or decided?

## Options Considered

### Option 1: {Name}
**Pros:**
- Pro 1
- Pro 2

**Cons:**
- Con 1
- Con 2

### Option 2: {Name}
**Pros:**
- Pro 1

**Cons:**
- Con 1
- Con 2

## Consequences
What are the implications of this decision?

### Positive
- Outcome 1

### Negative
- Outcome 2

### Risks
- Risk 1: Mitigation

## Follow-up Actions
- [ ] Action 1
- [ ] Action 2
```

### Step 3: Save ADR
```
SAVE to docs/decisions/ADR-{number}-{slug}.md

IF existing ADRs:
  - Read existing ADRs for naming convention
  - Check for related decisions
  - Reference in superseding ADR if needed
```

### Step 4: Update Decision Log
```markdown
# Decision Log

| ADR | Date | Decision | Status |
|-----|------|----------|--------|
| ADR-001 | 2024-01-15 | Use PostgreSQL | Accepted |
| ADR-002 | 2024-01-20 | REST over GraphQL | Accepted |
```

## Output
- ADR document created
- Decision log updated
- Stakeholders notified
