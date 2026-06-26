# tech-plan

Engineer must create technical plan before coding.

## When to Use
- Before implementing any story
- Technical design review
- Architecture decisions
- Complex feature planning

## Agents to Dispatch
- lead-engineer: Review tech plan
- technical-director: Approve tech plan

## Enforcement

```
⚠️ MANDATORY: Tech plan required before coding

FLOW:
  story-readiness
       ↓
  tech-plan (THIS SKILL) ← MANDATORY
       ↓
  dev-story → implementation
       ↓
  review-doc → review

IF no tech plan → BLOCK implementation
```

## Execution

### Step 1: Load Story Context
```
READ:
- production/stories/{story-id}.md
- docs/PRD.md (requirements)
- docs/architecture.md (system design)
```

### Step 2: Create Tech Plan Template
```markdown
# Technical Plan: {story-id}

## Story
- **Title:** {story title}
- **Points:** {story points}
- **Priority:** {P0/P1/P2}

## Context
- **PRD Reference:** {section}
- **Architecture Reference:** {component}
- **Dependencies:** {list}

## Technical Design

### Components Affected
| Component | Action | Files |
|-----------|--------|-------|
| {component} | create/modify | {file paths} |

### Implementation Steps
1. {step 1}
2. {step 2}
3. {step 3}

### Data Model Changes
- {table/column changes if any}

### API Changes
- {endpoint changes if any}

### Security Considerations
- {auth, encryption, validation}

### Performance Considerations
- {caching, queries, optimization}

### Testing Strategy
- Unit tests: {coverage target}
- Integration tests: {scope}
- E2E tests: {if needed}

## Risks & Mitigations
| Risk | Impact | Mitigation |
|------|--------|------------|
| {risk} | {high/med/low} | {action} |

## Timeline
- Estimated: {hours}
- Dependencies: {blocked by}

## Approval
- [ ] Lead Engineer reviewed
- [ ] Technical Director approved (if complex)
```

### Step 3: Present Tech Plan
```
SHOW tech plan to user

ASK:
"Tech plan ready. Options:
1. Approve and start implementation
2. Request changes
3. Need more review"
```

### Step 4: Save Tech Plan
```
SAVE TO:
- production/tech-plans/{story-id}.md

UPDATE:
- story.status = "READY_FOR_IMPLEMENTATION"
- story.techPlan = "created"
```

### Step 5: Approval Gate
```
IF approved:
  → Continue to dev-story
  → Load tech plan during implementation

IF changes requested:
  → Update tech plan
  → Re-present for approval

IF need more review:
  → Escalate to lead-engineer
  → Wait for review feedback
```

## Output
- Tech plan created
- Technical design documented
- Implementation steps defined
- Risks identified
- Approval obtained
- Ready for implementation
