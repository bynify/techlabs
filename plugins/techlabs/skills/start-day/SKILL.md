# start-day

Resume work from previous session. Detect current phase and continue accordingly.

## When to Use
- Start of work day
- Resume interrupted work
- Continue from yesterday
- Check current progress

## Phases Detected

```
PHASE DETECTION:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PHASE 1: PLANNING
  Check: production/project-context.json exists?
  Check: production/sprint/state.json exists?
  Result: In planning phase, no sprint yet

PHASE 2: SPRINT PLANNING
  Check: production/sprint/state.json with PLANNING status
  Result: Sprint planned, not yet executing

PHASE 3: SPRINT EXECUTION
  Check: production/sprint/state.json with ACTIVE status
  Result: Sprint running, stories in progress

PHASE 4: SPRINT COMPLETE
  Check: production/sprint/state.json with CLOSED status
  Result: Sprint done, ready for next sprint
```

## Execution

### Step 1: Detect Current Phase
```
CHECK FILES:
1. production/session-state/active.md → Last session state
2. production/project-context.json → Project planning status
3. production/sprint/state.json → Sprint status
4. production/epics/ → Epics created
5. production/stories/ → Stories created
6. production/scope-discussions/ → Pending scope approvals
7. production/docs-updates/ → Pending docs updates

DETERMINE PHASE:
IF no project-context.json → PHASE 0 (Not started)
IF project-context.json AND no sprint → PHASE 1 (Planning)
IF sprint.state == PLANNING → PHASE 2 (Sprint Planning)
IF sprint.state == ACTIVE → PHASE 3 (Sprint Execution)
IF sprint.state == CLOSED → PHASE 4 (Sprint Complete)

CHECK PENDING WORK:
IF scope-discussions/ has APPROVED but docs not updated → PENDING DOCS
IF stories have IN_PROGRESS status → IN PROGRESS
IF stories have BLOCKED status → BLOCKED
```

### Step 2: Show Status Based on Phase

```markdown
# Session Status

## Detected Phase: [PHASE NAME]

### If Phase 0 (Not Started)
```
Status: No project started yet
Next: /start (guided onboarding)
```

### If Phase 1 (Planning)
```
Status: Planning in progress

Done:
- [ ] /brainstorm
- [ ] /create-prd
- [ ] /project-planning
- [ ] /choose-stack
- [ ] /choose-frontend
- [ ] /create-architecture

Remaining:
- [ ] /create-epics
- [ ] /user-stories
- [ ] /sprint-plan

Next Step: /create-epics
```

### If Phase 2 (Sprint Planning)
```
Status: Sprint planned, ready to execute

Sprint: 2024-S1
Stories: 5 (34 points)
Status: PLANNING

Next: /sprint-orchestrator
```

### If Phase 3 (Sprint Execution)
```
Status: Sprint in progress

Sprint: 2024-S1 (Day 4/10)
Progress: 13/34 points (38%)
In Progress: AUTH-001 (60%)

Scope Changes:
- SCOPE-001: Add phone field (APPROVED)
  - Lead: lead-engineer
  - Agents consulted: security-lead, quality-lead, product-manager, devops-lead
  - Status: ✅ Approved (11 conditions)
  - Docs updated: ✅ Yes
  - Implementation: 🔄 In progress (3/11 conditions met)

Next: Continue story execution with scope conditions
```

### If Phase 4 (Sprint Complete)
```
Status: Sprint complete, ready for next

Sprint: 2024-S1 ✅
Velocity: 34 points
Stories: 8/10 complete

Next: /sprint-transition → Start Sprint 2
```
```

### Step 3: Load Session State
```markdown
# Last Session

## Date: 2024-01-15
## Duration: 4 hours
## Phase: 1 (Planning)

## Work Done
- ✅ /brainstorm
- ✅ /create-prd
- ✅ /project-planning
- ⬜ /choose-stack (in progress)

## Files Created
- docs/PRD.md
- production/project-context.json
- production/session-state/active.md

## Next Steps
1. Complete /choose-stack
2. Run /choose-frontend
3. Continue planning flow
```

### Step 4: Ask User Based on Phase
```
PHASE 1 (PLANNING):
1. Continue planning?
   - Yes → Resume from last step
   - No → Show remaining steps

2. Any changes to project?
   - New requirements?
   - Stack changes?
   - Team changes?

PHASE 2 (SPRINT PLANNING):
1. Start sprint execution?
   - Yes → Run /sprint-orchestrator
   - No → Review sprint plan first

PHASE 3 (SPRINT EXECUTION):
1. Continue where you left off?
   - Yes → Resume current story
   - No → Choose different story

2. Scope changes pending?
   - Check approved scope changes
   - Review conditions
   - Continue implementation

3. Any changes since yesterday?
   - New requirements?
   - Blockers?
   - Priority changes?
```

### Step 5: Resume Based on Phase
```javascript
async function startDay() {
  const phase = await detectPhase();
  
  switch (phase) {
    case 'not-started':
      console.log('No project started. Run /start to begin.');
      break;
      
    case 'planning':
      const lastStep = await getLastPlanningStep();
      const nextStep = getNextPlanningStep(lastStep);
      console.log(`Last step: ${lastStep}`);
      console.log(`Next step: ${nextStep}`);
      
      const answer = await askUser({
        question: `Continue with ${nextStep}?`,
        options: ['Yes', 'Show remaining steps', 'Review what I have'],
      });
      
      if (answer === 'Yes') {
        await runSkill(nextStep);
      } else if (answer === 'Show remaining steps') {
        await showRemainingSteps();
      } else {
        await showPlanningStatus();
      }
      break;
      
    case 'sprint-planning':
      const sprintPlan = await loadSprintPlan();
      console.log(`Sprint: ${sprintPlan.id}`);
      console.log(`Stories: ${sprintPlan.stories.length}`);
      console.log(`Points: ${sprintPlan.totalPoints}`);
      
      const startSprint = await askUser({
        question: 'Start sprint execution?',
        options: ['Yes, start sprint', 'No, review plan first'],
      });
      
      if (startSprint === 'Yes, start sprint') {
        await runSkill('sprint-orchestrator');
      } else {
        await showSprintPlan();
      }
      break;
      
    case 'sprint-execution':
      const sprintState = await loadSprintState();
      const inProgress = Object.entries(sprintState.stories)
        .filter(([_, s]) => s.state === 'IN_PROGRESS');
      
      // Check for pending scope changes
      const scopeDir = 'production/scope-discussions/';
      const scopeFiles = await readdir(scopeDir);
      const pendingScope = [];
      
      for (const file of scopeFiles) {
        const scope = await loadJSON(`${scopeDir}/${file}`);
        if (scope.status === 'APPROVED' && !scope.docsUpdated) {
          pendingScope.push(scope);
        }
      }
      
      if (pendingScope.length > 0) {
        console.log('\n📋 PENDING SCOPE CHANGES:');
        for (const scope of pendingScope) {
          console.log(`- ${scope.id}: ${scope.description}`);
          console.log(`  Lead: ${scope.coordinatedBy}`);
          console.log(`  Conditions: ${scope.conditions.length}`);
        }
        
        const handleScope = await askUser({
          question: 'Handle pending scope changes first?',
          options: ['Yes, update docs', 'No, continue story'],
        });
        
        if (handleScope === 'Yes, update docs') {
          for (const scope of pendingScope) {
            await runSkill('lead-docs-update', { scope });
          }
        }
      }
      
      if (inProgress.length > 0) {
        console.log('\n🔄 IN PROGRESS:');
        for (const [id, story] of inProgress) {
          console.log(`- ${id}: ${story.title} (${story.progress}%)`);
          
          // Show scope conditions if any
          if (story.scopeChanges && story.scopeChanges.length > 0) {
            console.log(`  Scope conditions: ${story.scopeConditionsMet}/${story.scopeConditionsTotal} met`);
          }
        }
        
        const continueWork = await askUser({
          question: 'Continue where left off?',
          options: ['Yes', 'Choose different story', 'Check changes'],
        });
        
        if (continueWork === 'Yes') {
          for (const [id, story] of inProgress) {
            await executeStory(story);
          }
        } else if (continueWork === 'Check changes') {
          await runSkill('change-request', { type: 'check' });
        } else {
          await showAvailableStories();
        }
      } else {
        await showSprintStatus();
      }
      break;
      
    case 'sprint-complete':
      console.log('Sprint complete!');
      console.log('Run /sprint-transition to start next sprint.');
      break;
  }
}
```

### Step 6: Update Session State
```json
{
  "sessionId": "session-2024-01-16",
  "startDate": "2024-01-16",
  "detectedPhase": "planning",
  "lastPhase": "planning",
  "lastStep": "project-planning",
  "nextStep": "create-epics",
  "progress": {
    "brainstorm": "done",
    "create-prd": "done",
    "project-planning": "done",
    "choose-stack": "pending",
    "choose-frontend": "pending",
    "create-architecture": "pending",
    "create-epics": "pending",
    "user-stories": "pending",
    "sprint-plan": "pending"
  }
}
```

## Output
- Phase detected correctly
- Status displayed based on phase
- User asked appropriate questions
- Work resumed from correct point
