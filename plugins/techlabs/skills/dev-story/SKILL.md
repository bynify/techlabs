# dev-story

Implement a user story end-to-end with mandatory documentation.

## When to Use
- Development stories
- Sprint planning
- Task breakdown
- Estimation

## Agents to Dispatch
- (uses dispatch-story for agent selection)

## Enforcement

```
⚠️ MANDATORY: Documentation and scope control required

DEV-FLOW:
  tech-plan → implementation → docs-update → story-done

SCOPE RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WITHIN SCOPE (no approval):
  - Task items from story
  - Direct implementation of criteria
  - Bug fixes within feature
  - Refactoring within same file

OUT OF SCOPE (approval required):
  - New files not in task
  - Changes to other modules
  - API signature changes
  - Database schema changes
  - New dependencies
  - Architecture changes

IF out-of-scope → scope-approval → lead-docs-update
```

## Execution

### Step 0: CRITICAL THINKING (FIRST)
```
⚠️ MANDATORY: Dev must think critically AND proactively

RUN: /critical-thinking

WITH:
- story: {story-id}

RESULT:
- Issues identified
- Questions formulated
- Lead clarified
- Task updated with clarity
- Proposals made
- Concerns raised
- Alternatives suggested

RULES:
- NO GUESSING ALLOWED
- If unclear → Ask lead
- If ambiguous → Ask lead
- If incomplete → Ask lead
- If conflicting → Ask lead
- If better approach → Propose to lead
- If concern → Raise to lead
- Wait for answers before implementing
```

### Step 1: Load Story Context
```
READ:
- production/stories/{story-id}.md
- production/tech-plans/{story-id}.md
- docs/PRD.md (requirements)
- docs/architecture.md (architecture)
- docs/api-design.md (API design)
- docs/database-design.md (database design)
- production/clarifications/{story-id}.json (if exists)
```

### Step 2: Plan Implementation (WITH DOCS)
```
⚠️ ENFORCEMENT: Documentation required for ALL changes

DETERMINE:
1. Which files to create/modify
2. Which tests to write
3. Which documentation to update:
   - README.md (if new feature)
   - API docs (if endpoints changed)
   - Database docs (if schema changed)
   - Architecture (if design changed)
   - Changelog (always)
4. Dependencies and order
```

### Step 3: Implement
```
FOR EACH FILE:
1. Show draft to user
2. Get approval
3. Write file
4. Run validation

⚠️ SCOPE CHECK (during implementation):

IF change is OUT OF SCOPE:
  → STOP
  → Document scope change
  → RUN /scope-approval
  → Wait for lead approval
  → IF approved:
    - RUN /lead-docs-update
    - Continue implementation
  → IF rejected:
    - Revert change
    - Continue within scope
```

### Step 4: Update Documentation (MANDATORY)
```
⚠️ ENFORCEMENT: Docs MUST be updated before story complete

API CHANGES (if endpoints changed):
  - [ ] Update api-design.md
  - [ ] Update OpenAPI spec
  - [ ] Update endpoint examples
  - [ ] Update request/response

DATABASE CHANGES (if schema changed):
  - [ ] Update database-design.md
  - [ ] Update ER diagram
  - [ ] Update migration SQL
  - [ ] Update data dictionary

GENERAL:
  - [ ] README.md updated
  - [ ] Changelog updated
  - [ ] Comments on complex logic

IF docs not updated → BLOCK story completion
```

### Step 5: Self-Review
```
CHECK:
- [ ] All acceptance criteria met
- [ ] No TODO/FIXME left
- [ ] Error handling complete
- [ ] Tests passing
- [ ] Linting clean
- [ ] Type checking clean
- [ ] Documentation complete
```

### Step 6: Update Story
```
UPDATE:
- Mark story as "READY_FOR_REVIEW"
- Add implementation notes
- Link to docs updates
- Update session state
```

## Output
- Implemented code
- Tests passing
- Documentation updated (MANDATORY)
- Scope changes approved (if any)
- Story marked as ready for review
