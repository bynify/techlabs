# sprint-orchestrator

Master workflow engine that connects all sprint skills end-to-end.

## When to Use
- Sprint execution
- Story lifecycle management
- Sprint automation
- End-to-end sprint flow

## Edge Case Handlers

```
⚠️ MANDATORY: Edge case handlers must be loaded

SPRINT ORCHESTRATOR LOADS:

1. EDGE CASE HANDLERS:
   - agent-rejection: Handle agent rejecting scope change
   - agent-conflict: Handle conflicting agent feedback
   - condition-conflict: Handle conflicting conditions
   - impl-blocked: Handle dev can't meet conditions
   - review-loop: Handle reviewer rejecting repeatedly
   - qa-critical: Handle critical bugs from QA
   - qa-blocked: Handle QA can't proceed
   - deploy-rollback: Handle deployment failure
   - session-recover: Handle corrupted session state

2. SPRINT LEAD KNOWLEDGE:
   - Dependencies: Story dependencies
   - Blockers: Current blockers
   - Critical Path: Most important stories
   - Timeline: Sprint timeline
```

```
┌─────────────────────────────────────────────────────────────────┐
│                     SPRINT ORCHESTRATOR                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  PHASE 1: PLANNING                                              │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐
│  │brainstorm│→│create-prd│→│create-   │→│user-     │→│sprint-   │
│  │          │ │          │ │epics     │ │stories   │ │plan      │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘ └──────────┘
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


## Agents to Dispatch
- lead-engineer: Sprint execution
- quality-lead: Quality gates

## Execution

### MANDATORY GATES (Must Complete)
```
GATE 1: CONTEXT GATE ✅
- Load sprint state
- Load session state
- Verify sprint is active

GATE 2: APPROVAL GATE ✅
- Show sprint status to user
- Wait for approval to continue

GATE 3: DISPATCH GATE ✅
- Dispatch to specialist agent
- Load agent context
- Verify agent is loaded

GATE 4: REVIEW GATE ✅
- Run code review
- Run quality gates
- Wait for review approval
```

### Step 1: Validate Prerequisites (CRITICAL)
```
BEFORE STARTING SPRINT:

CHECK:
1. PRD exists? (docs/PRD.md)
2. Architecture exists? (docs/architecture.md)
3. Stack defined? (docs/stack.md)
4. Epics created? (production/epics/)
5. Stories created? (production/stories/)
6. Sprint plan exists? (production/sprint/current.json)

IF ANY MISSING:
  → Run /sprint-prerequisites
  → Run /doc-recovery for missing docs
  → Block sprint until complete
```

### Step 2: Load Sprint Context
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
  
  // 3. Create epics from PRD
  const epics = await runSkill('create-epics', { prd: 'docs/PRD.md' });
  
  // 4. Generate user stories from epics
  const stories = await runSkill('user-stories', { epics });
  
  // 5. Prioritize features
  await runSkill('feature-prioritize', { stories });
  
  // 6. Create sprint plan
  const sprintPlan = await runSkill('sprint-plan', {
    epics,
    stories,
    capacity: teamCapacity,
    velocity: teamVelocity,
  });
  
  // 7. Save sprint state
  await updateSprintState('PLANNING_COMPLETE', { sprintPlan });
  
  return sprintPlan;
}
```

### Step 3: Run Story Execution Loop
```javascript
async function executeSprintStories(sprintPlan) {
  for (const story of sprintPlan.stories) {
    // ⚠️ ANOMALY PREVENTION: Check for changes MORE OFTEN
    
    // Check before EACH story
    const pendingChanges = await checkForPendingChanges();
    if (pendingChanges.length > 0) {
      // ⚠️ ANOMALY PREVENTION: Batch process
      console.log(`Found ${pendingChanges.length} pending changes`);
      const impact = await analyzeBatchImpact(pendingChanges);
      
      // Show combined impact
      await showBatchImpactReport(impact);
      
      // Ask user: process all at once?
      const processBatch = await askUser({
        question: 'Process all pending changes?',
        options: ['Yes, process all', 'No, one at a time']
      });
      
      if (processBatch === 'Yes, process all') {
        await processBatchChanges(pendingChanges);
      } else {
        // Process one at a time
        for (const change of pendingChanges) {
          await handleChangeRequest(change);
        }
      }
    }
    
    // Check for changes BETWEEN stories
    const changeRequest = await checkForChanges();
    if (changeRequest) {
      await handleChangeRequest(changeRequest);
    }
    
    await executeStory(story);
  }
}

// ⚠️ ANOMALY PREVENTION: Batch change processing
async function processBatchChanges(changes) {
  // Group changes by affected stories
  const changesByStory = {};
  for (const change of changes) {
    for (const storyId of change.affectedStories) {
      if (!changesByStory[storyId]) {
        changesByStory[storyId] = [];
      }
      changesByStory[storyId].push(change);
    }
  }
  
  // Apply all changes to each story
  for (const [storyId, changes] of Object.entries(changesByStory)) {
    await applyBatchChanges(storyId, changes);
  }
}

// Handle mid-sprint changes
async function handleChangeRequest(changeRequest) {
  switch (changeRequest.type) {
    case 'emergency':
      // Pause current work, fix emergency
      await runSkill('change-request', changeRequest);
      break;
    
    case 'feature':
      // Add to sprint or backlog
      await runSkill('change-request', changeRequest);
      if (changeRequest.priority === 'P0') {
        await runSkill('sprint-replan', { reason: 'New P0 feature' });
      }
      break;
    
    case 'scope-change':
      // Update current story
      await runSkill('scope-change', changeRequest);
      break;
    
    case 'replan':
      // Full sprint replan
      await runSkill('sprint-replan', changeRequest);
      break;
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
  
  // CHECKPOINT 1b: Critical Thinking (MANDATORY)
  // Dev must think critically and proactively
  const criticalThinking = await runSkill('critical-thinking', { story });
  
  // Handle reactive questions
  if (criticalThinking.questions.length > 0) {
    console.log(`\n⚠️ Dev has ${criticalThinking.questions.length} questions before implementing`);
    const answers = await askLeadForClarification(criticalThinking.questions);
    
    if (!answers.allResolved) {
      await updateStoryState(story.id, 'BLOCKED', { reason: 'Questions not answered' });
      return;
    }
    
    // Save clarifications
    await saveClarifications(story.id, answers);
  }
  
  // Handle proactive proposals
  if (criticalThinking.proposals.length > 0) {
    console.log(`\n💡 Dev has ${criticalThinking.proposals.length} proposals`);
    const decisions = await leadDecidesOnProposals(criticalThinking.proposals);
    
    // Save proposals and decisions
    await saveProposals(story.id, decisions);
    
    // Update task if proposal accepted
    if (decisions.accepted.length > 0) {
      await updateTaskWithAcceptedProposals(story.id, decisions.accepted);
    }
  }
  
  // Handle concerns
  if (criticalThinking.concerns.length > 0) {
    console.log(`\n⚠️ Dev has ${criticalThinking.concerns.length} concerns`);
    const resolutions = await leadResolvesConcerns(criticalThinking.concerns);
    
    // Save concerns and resolutions
    await saveConcerns(story.id, resolutions);
  }
  
  // CHECKPOINT 2: Dispatch to Specialist
  const agent = await runSkill('dispatch-story', { story });
  await updateStoryState(story.id, 'IN_PROGRESS', { assignedTo: agent });
  
  // CHECKPOINT 3: Tech Plan (MANDATORY)
  // ⚠️ ENFORCEMENT: Engineer must create tech plan before coding
  const techPlan = await runSkill('tech-plan', { story, agent });
  if (!techPlan) {
    await updateStoryState(story.id, 'BLOCKED', { reason: 'No tech plan' });
    return;
  }
  
  // CHECKPOINT 4: Implementation
  const implementation = await runSkill('dev-story', { story, agent, techPlan });
  
  // CHECKPOINT 5: Scope Approval (if out-of-scope changes)
  if (implementation.scopeChanges && implementation.scopeChanges.length > 0) {
    console.log(`\\n⚠️ ${implementation.scopeChanges.length} out-of-scope changes detected`);
    const approved = await runSkill('scope-approval', {
      story,
      changes: implementation.scopeChanges
    });
    
    if (!approved) {
      await updateStoryState(story.id, 'BLOCKED', { reason: 'Scope changes not approved' });
      return;
    }
    
    // Lead updates docs after approval
    await runSkill('lead-docs-update', {
      story,
      changes: implementation.scopeChanges
    });
  }
  
  // CHECKPOINT 6: Code Review Gate
  const reviewPassed = await runSkill('review-gate', {
  // CHECKPOINT 5: Scope Approval (if out-of-scope changes)
  if (implementation.scopeChanges && implementation.scopeChanges.length > 0) {
    console.log(`\\n⚠️ ${implementation.scopeChanges.length} out-of-scope changes detected`);
    
    // Load project lead
    const projectLead = await loadProjectLead();
    
    if (!projectLead) {
      console.log('⚠️ No project lead found, using lead-engineer');
      // Fallback to lead-engineer
      const approved = await runSkill('scope-approval', {
        story,
        changes: implementation.scopeChanges
      });
    } else {
      console.log(`\\n📋 Coordinating with project lead: ${projectLead.name}`);
      // Use project lead for coordination
      const approved = await runSkill('scope-approval', {
        story,
        changes: implementation.scopeChanges,
        coordinator: projectLead
      });
      
      if (!approved) {
        await updateStoryState(story.id, 'BLOCKED', { reason: 'Scope changes not approved' });
        return;
      }
      
      // Project lead updates docs after approval
      await runSkill('lead-docs-update', {
        story,
        changes: implementation.scopeChanges,
        lead: projectLead
      });
    }
  }
  const reviewPassed = await runSkill('review-gate', {
    story,
    code: implementation.files,
    type: 'code-review',
  });
  
  // CHECKPOINT 7: Review Documentation (MANDATORY)
  const reviewDoc = await runSkill('review-doc', { story, review: reviewPassed });
  if (!reviewDoc) {
    await updateStoryState(story.id, 'BLOCKED', { reason: 'No review docs' });
    return;
  }
  
  if (!reviewPassed) {
    await updateStoryState(story.id, 'REVISION_NEEDED');
    await runSkill('dev-story', { story, feedback: reviewPassed.feedback });
    return;
  }
  
  // CHECKPOINT 8: Automated QA Gate
  const gatePassed = await runSkill('gate-check', {
    story,
    checks: ['tests', 'lint', 'types', 'coverage', 'security'],
  });
  
  if (!gatePassed) {
    await updateStoryState(story.id, 'QA_FAILED');
    await runSkill('dev-story', { story, feedback: gatePassed.failures });
    return;
  }
  
  // CHECKPOINT 9: Manual QA (if needed)
  if (story.requiresManualQA) {
    await runSkill('qa-plan', { story });
  }
  
  // CHECKPOINT 10: QA Report (MANDATORY)
  const qaReport = await runSkill('qa-report', { story });
  if (!qaReport) {
    await updateStoryState(story.id, 'BLOCKED', { reason: 'No QA report' });
    return;
  }
  
  // CHECKPOINT 11: Final Verification
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
  // ⚠️ ENFORCEMENT: Sprint-Release-Gate BEFORE sprint done
  console.log("\\n=== SPRINT RELEASE GATES ===");
  const gatesPassed = await runSkill('sprint-release-gate', {
    sprintId: currentSprint.id
  });
  
  if (!gatesPassed) {
    console.log("❌ SPRINT RELEASE GATES FAILED");
    console.log("Fix issues before completing sprint.");
    return false;
  }
  
  console.log("✅ SPRINT RELEASE GATES PASSED");
  
  // 1. Performance baseline
  await runSkill('perf-baseline', { sprintId: currentSprint.id });
  
  // 2. Load testing
  await runSkill('load-test', { endpoints: getAPIEndpoints() });
  
  // 3. Security audit
  await runSkill('security-audit', { codebase: 'src/' });
  
  // 4. Compliance check
  await runSkill('compliance-audit', { framework: 'gdpr' });
  
  // 5. Sprint review
  await runSkill('milestone-review', {
    sprintId: currentSprint.id,
    stories: completedStories,
  });
  
  // 6. Post-mortem
  await runSkill('post-mortem', {
    sprintId: currentSprint.id,
    metrics: sprintMetrics,
  });
  
  // 7. Final status report
  await runSkill('sprint-status', {
    sprintId: currentSprint.id,
  });
  
  return true;
}
```
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
