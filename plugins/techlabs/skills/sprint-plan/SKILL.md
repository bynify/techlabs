# sprint-plan

Sprint planning with story estimation, backlog prioritization, and orchestrator integration.

## When to Use
- Sprint kickoff
- Backlog grooming
- Capacity planning
- Team alignment


## Agents to Dispatch
- product-manager: Sprint planning
- lead-engineer: Capacity planning

## Execution

### Step 1: Validate Prerequisites (MANDATORY)
```
⚠️ ANOMALY PREVENTION: Validate docs before sprint plan

1. RUN /sprint-prerequisites
   - Check file existence
   - Check content quality (score >= 70)
   
2. IF validation fails:
   - SHOW validation report
   - BLOCK sprint planning
   - ASK user to fix docs first
   
3. IF validation passes:
   - CONTINUE to sprint planning
```

### Step 2: Load Context
```
READ:
- production/stories/ (all stories)
- production/sprint/state.json (if exists)
- docs/PRD.md (requirements)
- docs/architecture.md (if exists)
- production/validation-results.json (validation output)
```

### Step 2: Capacity Planning
```markdown
## Team Capacity

| Member | Role | Days | Hours |
|--------|------|------|-------|
| Dev 1 | Backend | 10 | 80 |
| Dev 2 | Frontend | 10 | 80 |
| Dev 3 | Full Stack | 10 | 80 |
| Dev 4 | DevOps | 5 | 40 |

**Total:** 280 hours
**Adjusted (80%):** 224 hours
**Velocity:** 40 points/sprint
**Sprint Length:** 2 weeks
```

### Step 3: Select Stories from Backlog
```markdown
## Backlog (Prioritized)

| # | Story | Points | Priority | Dependencies |
|---|-------|--------|----------|--------------|
| 1 | User auth | 8 | P0 | - |
| 2 | Dashboard | 5 | P0 | - |
| 3 | API v1 | 13 | P1 | #1 |
| 4 | Notifications | 5 | P2 | #1 |
| 5 | Export | 3 | P2 | #3 |

## Selected for Sprint

**Total Points:** 34 (within 40-point velocity)

| Story | Points | Type | Agent |
|-------|--------|------|-------|
| User auth | 8 | auth | go-specialist |
| Dashboard | 5 | frontend | nextjs-specialist |
| API v1 | 13 | backend-api | python-specialist |
```

### Step 4: Task Breakdown
```markdown
## Story: User Auth (8 pts)

### Tasks:
- [ ] Database schema (2h) → postgres-specialist
- [ ] Auth endpoints (4h) → go-specialist
- [ ] JWT middleware (2h) → go-specialist
- [ ] Login page (3h) → nextjs-specialist
- [ ] Tests (2h) → go-specialist
- [ ] Documentation (1h) → lead-engineer

### Acceptance Criteria:
- [ ] JWT token generation
- [ ] Token validation middleware
- [ ] Refresh token logic
- [ ] Error handling
- [ ] Unit tests (≥80% coverage)

### Review Requirements:
- [ ] Code review
- [ ] Security review
- [ ] QA testing
```

### Step 5: Initialize Sprint State
```javascript
// Initialize state.json for sprint-orchestrator
const sprintState = {
  sprintId: '2024-S1',
  sprintState: 'PLANNING',
  startedAt: new Date().toISOString(),
  goal: 'Implement user authentication',
  capacity: {
    totalHours: 280,
    adjustedHours: 224,
    velocity: 40,
  },
  stories: {
    'AUTH-001': {
      title: 'User auth',
      points: 8,
      type: 'auth',
      state: 'BACKLOG',
      assignedTo: null,
      tasks: [
        { id: 'T1', title: 'Database schema', hours: 2, agent: 'postgres-specialist' },
        { id: 'T2', title: 'Auth endpoints', hours: 4, agent: 'go-specialist' },
        { id: 'T3', title: 'JWT middleware', hours: 2, agent: 'go-specialist' },
        { id: 'T4', title: 'Login page', hours: 3, agent: 'nextjs-specialist' },
        { id: 'T5', title: 'Tests', hours: 2, agent: 'go-specialist' },
      ],
      transitions: [],
      metrics: {},
    },
    // ... other stories
  },
  metrics: {
    totalStories: 3,
    completed: 0,
    inProgress: 0,
    blocked: 0,
    velocity: 0,
    burndown: [],
  },
};

await saveSprintState(sprintState);
```

### Step 6: Generate Sprint Plan
```markdown
# Sprint Plan: 2024-S1

## Goal
Implement user authentication and core API

## Duration
Jan 15 - Jan 29 (2 weeks)

## Stories (34 points)

| Story | Points | Type | Agent | Est. Hours |
|-------|--------|------|-------|------------|
| User auth | 8 | auth | go-specialist | 13h |
| Dashboard | 5 | frontend | nextjs-specialist | 15h |
| API v1 | 13 | backend-api | python-specialist | 40h |

## Risks
1. API v1 might need more time
2. External dependency for auth

## Definition of Done
- All tests passing
- Code reviewed
- Documentation updated
- Deployed to staging
- QA verified

## Next Steps
1. Run `/sprint-orchestrator` to execute
2. Stories will be dispatched to specialists
3. Review gates will enforce quality
```

### Step 7: Start Execution
```
IF user wants to execute:
  → RUN /sprint-orchestrator
  
ELSE:
  → Save sprint plan
  → User can start execution later with /sprint-orchestrator
```

## Output
- Sprint plan created
- Stories selected and prioritized
- Task breakdown done
- Sprint state initialized
- Ready for orchestrator execution
