# create-adr

Create Architecture Decision Records (ADR) for documenting technical decisions.

## When to Use
- Technical decisions made
- Architecture choices
- Stack selection
- Design patterns chosen
- Trade-offs accepted

## Agents to Dispatch
- technical-director: Decision review
- security-lead: Security implications
- performance-lead: Performance implications

## Enforcement

```
⚠️ MANDATORY: All technical decisions must be documented as ADR

ADR ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ADR MUST INCLUDE:
1. Title
2. Status (Proposed/Accepted/Deprecated/Superseded)
3. Context (why decision needed)
4. Decision (what was decided)
5. Consequences (positive/negative/neutral)
6. Alternatives Considered
7. Trade-offs Accepted
8. Approval (who approved)

DECISIONS REQUIRING ADR:
- Stack selection (Go vs Python vs Node)
- Database selection (Postgres vs MongoDB)
- Architecture pattern (Monolith vs Microservices)
- Authentication method (JWT vs Session)
- Deployment strategy (Blue/Green vs Canary)
- Caching strategy (Redis vs Memcached)
- Message queue (Kafka vs RabbitMQ)
- Any P0/P1 decision
```

## Execution

### Step 1: Identify Decision
```
ASK USER:

1. DECISION CONTEXT
   - What decision needs to be made?
   - Why is this decision needed?
   - What problem are we solving?
   - What constraints exist?

2. OPTIONS
   - What are the alternatives?
   - What are the pros/cons?
   - What are the trade-offs?
   - What are the risks?

3. CRITERIA
   - What are the evaluation criteria?
   - What's most important?
   - What can we compromise on?
   - What's non-negotiable?
```

### Step 2: Research Alternatives
```
TOOL CALLS:
- Search latest documentation for each option
- Search best practices for each option
- Search case studies for each option
- Search performance benchmarks for each option

COMPARE:
- Feature comparison
- Performance comparison
- Cost comparison
- Community support comparison
- Learning curve comparison
- Maintenance comparison
```

### Step 3: Multi-Agent Discussion
```
DISCUSS WITH:

TECHNICAL-DIRECTOR:
- Is the decision technically sound?
- Are there technical risks?
- Is it maintainable?

SECURITY-LEAD:
- Are there security implications?
- Are there compliance issues?
- Are there data privacy concerns?

PERFORMANCE-LEAD:
- Are there performance implications?
- Are there scalability concerns?
- Are there resource constraints?

ALL MUST AGREE ON TRADE-OFFS
```

### Step 4: Create ADR Document
```markdown
# ADR-{number}: {title}

## Status
{Proposed | Accepted | Deprecated | Superseded by ADR-XXX}

## Date
{date}

## Context
{Describe the context and problem that needs to be addressed}

### Problem Statement
{Clear description of the problem}

### Constraints
- Constraint 1: {description}
- Constraint 2: {description}
- Constraint 3: {description}

### Requirements
- Requirement 1: {description}
- Requirement 2: {description}
- Requirement 3: {description}

## Decision
{Describe the decision that was made}

### Chosen Option
**{Option Name}**

{Detailed description of the chosen option}

### Rationale
- Reason 1: {description}
- Reason 2: {description}
- Reason 3: {description}

## Alternatives Considered

### Option A: {Option Name}
**Description:** {description}

**Pros:**
- Pro 1: {description}
- Pro 2: {description}

**Cons:**
- Con 1: {description}
- Con 2: {description}

**Rejected because:** {reason}

### Option B: {Option Name}
**Description:** {description}

**Pros:**
- Pro 1: {description}
- Pro 2: {description}

**Cons:**
- Con 1: {description}
- Con 2: {description}

**Rejected because:** {reason}

### Option C: {Option Name}
**Description:** {description}

**Pros:**
- Pro 1: {description}
- Pro 2: {description}

**Cons:**
- Con 1: {description}
- Con 2: {description}

**Rejected because:** {reason}

## Trade-offs Accepted

### Positive Consequences
- ✅ Benefit 1: {description}
- ✅ Benefit 2: {description}
- ✅ Benefit 3: {description}

### Negative Consequences
- ❌ Drawback 1: {description}
- ❌ Drawback 2: {description}
- ❌ Drawback 3: {description}

### Mitigation for Negative Consequences
- Drawback 1: {mitigation}
- Drawback 2: {mitigation}
- Drawback 3: {mitigation}

## Implementation Plan
### Phase 1: {phase}
- Task 1: {description}
- Task 2: {description}

### Phase 2: {phase}
- Task 1: {description}
- Task 2: {description}

## Risks
| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| {risk} | High | Medium | {mitigation} |

## References
- Reference 1: {url}
- Reference 2: {url}

## Approval
| Role | Name | Date | Status |
|------|------|------|--------|
| Technical Director | {name} | {date} | ✅ Approved |
| Security Lead | {name} | {date} | ✅ Approved |
| Performance Lead | {name} | {date} | ✅ Approved |

## Related ADRs
- ADR-{number}: {title}
- ADR-{number}: {title}
```

### Step 5: Save & Validate
```
SAVE TO:
- docs/adr/ADR-{number}-{title}.md

VALIDATE:
- All alternatives documented?
- Trade-offs accepted?
- All agents approved?
- Implementation plan clear?

IF VALID:
- Mark as ACCEPTED
- Link to related ADRs

IF INVALID:
- Mark as PROPOSED
- Request revisions
- Re-approve
```

### Step 6: Link to Related Documents
```
UPDATE:
- docs/architecture.md (link to ADR)
- docs/SRS.md (link to ADR)
- docs/stack-reference/ (link to ADR)

TRACK:
- All ADRs in docs/adr/README.md
- Decision history
- Superseded decisions
```

## Output
- ADR document created
- Decision documented
- Alternatives considered
- Trade-offs accepted
- All agents approved
- Ready for implementation
