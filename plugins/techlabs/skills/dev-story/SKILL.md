# dev-story

Implement a user story end-to-end with mandatory documentation.

## When to Use
- Development stories
- Sprint planning
- Task breakdown
- Estimation

## Agents to Dispatch
- (uses dispatch-story for agent selection)

## Execution

### Step 1: Load Story
```
READ:
- production/stories/{story-id}.md (story file)
- docs/PRD.md (requirements)
- docs/architecture.md (architecture)
```

### Step 2: Plan Implementation (WITH DOCS)
```
⚠️ ENFORCEMENT: Documentation required for ALL changes

DETERMINE:
1. Which files to create/modify
2. Which tests to write
3. Which documentation to update
   - README.md (if new feature)
   - API docs (if endpoints changed)
   - Changelog (always)
   - Architecture (if design changed)
4. Dependencies and order
```

### Step 3: Implement
```
FOR EACH FILE:
1. Show draft to user
2. Get approval
3. Write file
4. Run validation
```

### Step 4: Update Documentation (MANDATORY)
```
⚠️ ENFORCEMENT: Docs MUST be updated before story complete

CHECKLIST:
- [ ] README.md updated (new features, commands)
- [ ] API docs updated (if endpoints changed)
- [ ] Changelog updated (entry added)
- [ ] Architecture updated (if design changed)
- [ ] Comments added to complex logic

IF docs not updated → BLOCK story completion
```

### Step 5: Test
```
RUN:
- Unit tests
- Integration tests
- Linting
- Type checking
```

### Step 6: Update Story
```
UPDATE:
- Mark story as "Done"
- Add completion notes
- Update session state
```

## Output
- Implemented code
- Tests passing
- Documentation updated (MANDATORY)
- Story marked as done
