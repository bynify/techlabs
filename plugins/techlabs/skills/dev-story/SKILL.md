# dev-story

Implement a user story end-to-end.

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

### Step 2: Plan Implementation
```
DETERMINE:
1. Which files to create/modify
2. Which tests to write
3. Which documentation to update
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

### Step 4: Test
```
RUN:
- Unit tests
- Integration tests
- Linting
- Type checking
```

### Step 5: Update Story
```
UPDATE:
- Mark story as "Done"
- Add completion notes
- Update session state
```

## Output
- Implemented code
- Tests passing
- Documentation updated
- Story marked as done
