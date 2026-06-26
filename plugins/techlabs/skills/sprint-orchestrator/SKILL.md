# sprint-orchestrator

Master workflow engine that connects all sprint skills end-to-end.

## When to Use
- Sprint execution
- Story lifecycle management
- Sprint automation
- End-to-end sprint flow

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     SPRINT ORCHESTRATOR                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  PHASE 1: PLANNING                                              │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐          │
│  │brainstorm│→│create-prd│→│user-     │→│sprint-   │          │
│  │          │ │          │ │stories   │ │plan      │          │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘          │
│                                                                 │
│  PHASE 2: EXECUTION (per story)                                 │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐          │
│  │story-    │→│dispatch- │→│dev-story │→│review-   │          │
│  │readiness │ │story     │ │          │ │gate      │          │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘          │
│       ↑                              │          │              │
│       │         ┌────────────────────┘          │              │
│       │         ↓                               ↓              │
│       │    (if fail)                       ┌──────────┐        │
│       └────back────                        │gate-check│        │
│                                            └────┬─────┘        │
│                                                 ↓              │
│                                            ┌──────────┐        │
│                                            │qa-plan   │        │
│                                            └────┬─────┘        │
│                                                 ↓              │
│                                            ┌──────────┐        │
│                                            │story-done│        │
│                                            └──────────┘        │
│                                                                 │
│  PHASE 3: REVIEW                                                │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐                       │
│  │milestone-│→│post-     │→│sprint-   │                       │
│  │review    │ │mortem    │ │status    │                       │
│  └──────────┘ └──────────┘ └──────────┘                       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Execution

### Step 1: Load Sprint Context
```
READ:
- production/sprint/current.json (sprint config)
- production/stories/ (all stories)
- production/session-state/active.md (current state)

EXTRACT:
- Sprint ID
- Sprint goal
- Story list
- Team capacity
- Current progress
```

### Step 2: Run Planning Phase
```javascript
async function runPlanningPhase() {
  // 1. Brainstorm (if new sprint)
  if (isNewSprint) {
    await runSkill('brainstorm', { topic: 'sprint goals' });
  }
  
  // 2. Create/update PRD
  await runSkill('create-prd', { scope: 'sprint features' });
  
  // 3. Generate user stories
  const stories = await runSkill('user-stories', { prd: 'docs/PRD.md' });
  
  // 4. Prioritize features
  await runSkill('feature-prioritize', { stories });
  
  // 5. Create sprint plan
  const sprintPlan = await runSkill('sprint-plan', {
    stories,
    capacity: teamCapacity,
    velocity: teamVelocity,
  });
  
  // 6. Save sprint state
  await updateSprintState('PLANNING_COMPLETE', { sprintPlan });
  
  return sprintPlan;
}
```

### Step 3: Run Story Execution Loop
```javascript
async function executeSprintStories(sprintPlan) {
  for (const story of sprintPlan.stories) {
    await executeStory(story);
  }
}

async function executeStory(story) {
  const state = loadSprintState();
  
  // CHECKPOINT 1: Story Readiness
  const isReady = await runSkill('story-readiness', { story });
  if (!isReady) {
    await updateStoryState(story.id, 'BLOCKED', { reason: 'Not ready' });
    return;
  }
  
  // CHECKPOINT 2: Dispatch to Specialist
  const agent = await runSkill('dispatch-story', { story });
  await updateStoryState(story.id, 'IN_PROGRESS', { assignedTo: agent });
  
  // CHECKPOINT 3: Implementation
  const implementation = await runSkill('dev-story', { story, agent });
  
  // CHECKPOINT 4: Code Review Gate
  const reviewPassed = await runSkill('review-gate', {
    story,
    code: implementation.files,
    type: 'code-review',
  });
  
  if (!reviewPassed) {
    await updateStoryState(story.id, 'REVISION_NEEDED');
    // Re-run dev-story with feedback
    await runSkill('dev-story', { story, feedback: reviewPassed.feedback });
  }
  
  // CHECKPOINT 5: Automated QA Gate
  const gatePassed = await runSkill('gate-check', {
    story,
    checks: ['tests', 'lint', 'types', 'coverage', 'security'],
  });
  
  if (!gatePassed) {
    await updateStoryState(story.id, 'QA_FAILED');
    await runSkill('dev-story', { story, feedback: gatePassed.failures });
  }
  
  // CHECKPOINT 6: Manual QA (if needed)
  if (story.requiresManualQA) {
    await runSkill('qa-plan', { story });
  }
  
  // CHECKPOINT 7: Final Verification
  const isDone = await runSkill('story-done', { story });
  
  if (isDone) {
    await updateStoryState(story.id, 'DONE');
  } else {
    await updateStoryState(story.id, 'INCOMPLETE');
  }
}
```

### Step 4: Run Review Phase
```javascript
async function runReviewPhase() {
  // 1. Sprint review
  await runSkill('milestone-review', {
    sprintId: currentSprint.id,
    stories: completedStories,
  });
  
  // 2. Post-mortem
  await runSkill('post-mortem', {
    sprintId: currentSprint.id,
    metrics: sprintMetrics,
  });
  
  // 3. Final status report
  await runSkill('sprint-status', {
    sprintId: currentSprint.id,
  });
}
```

### Step 5: Generate Sprint Report
```markdown
# Sprint Report

## Sprint: 2024-S1
## Goal: Implement user authentication
## Duration: Jan 15 - Jan 29

## Stories Summary
| Story | Points | Status | Agent | Time |
|-------|--------|--------|-------|------|
| AUTH-001 | 8 | ✅ Done | go-specialist | 6h |
| AUTH-002 | 5 | ✅ Done | nextjs-specialist | 4h |
| AUTH-003 | 3 | ❌ Failed | - | - |

## Quality Metrics
- Stories completed: 13/15 (87%)
- Points completed: 34/40 (85%)
- Test coverage: 87%
- Code review pass rate: 95%

## Issues
- AUTH-003 blocked by external API
- Need more frontend capacity

## Recommendations
- Add frontend specialist to team
- Pre-spike external dependencies
```

## Output
- Sprint executed end-to-end
- All stories processed through lifecycle
- Quality gates enforced
- Sprint report generated
- State tracked throughout
