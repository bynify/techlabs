# new-project

Complete project setup from scratch in one command.

## When to Use
- Starting brand new project
- Want complete planning done at once
- Don't want to run 10+ commands manually

## What This Does

Chains 10 planning skills into one flow:

```
FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STEP 1: /brainstorm
  → Ask 5 questions about problem
  → Generate ideas
  → SAVE CHECKPOINT: "Brainstorm complete, ideas generated"

STEP 2: /create-prd
  → Create requirements document
  → SAVE CHECKPOINT: "PRD created at docs/PRD.md"

STEP 3: /project-planning
  → Plan team, infra, security, budget
  → SAVE CHECKPOINT: "Project plan created"

STEP 3b: /create-project-lead (MANDATORY)
  → Create project-specific lead agent
  → Lead coordinates all work
  → SAVE CHECKPOINT: "Project lead created"

STEP 4: /choose-stack
  → Select backend, database, messaging
  → SAVE CHECKPOINT: "Stack selected"

STEP 5: /choose-frontend
  → Select frontend framework
  → SAVE CHECKPOINT: "Frontend selected"

STEP 6: /create-architecture
  → System design, components
  → SAVE CHECKPOINT: "Architecture created"

STEP 7: /api-design
  → API endpoints, schemas
  → SAVE CHECKPOINT: "API design created"

STEP 8: /database-design
  → Schema, indexes, constraints
  → SAVE CHECKPOINT: "Database design created"

STEP 9: /create-epics
  → Break into epics
  → SAVE CHECKPOINT: "Epics created"

STEP 10: /user-stories
  → Create user stories
  → SAVE CHECKPOINT: "User stories created"

STEP 11: /sprint-plan
  → Plan first sprint
  → SAVE CHECKPOINT: "Sprint plan created"

FINAL: /doc-validator
  → Validate all documents
  → SAVE CHECKPOINT: "Documents validated"
```

## Execution

### Step 1: Start Flow
```
ANNOUNCE:
"Starting new project setup. This will run 11 planning skills."

ASK USER:
1. Project name?
2. Project description?
3. Main goal?

SAVE to session state:
{
  "shortcut": "new-project",
  "projectName": "[user-input]",
  "currentStep": 1,
  "totalSteps": 11
}
```

### Step 2: Run Each Step with Checkpoints
```javascript
async function runNewProject(projectInfo) {
  const steps = [
    { skill: 'brainstorm', args: { topic: projectInfo.goal } },
    { skill: 'create-prd', args: {} },
    { skill: 'project-planning', args: {} },
    { skill: 'choose-stack', args: {} },
    { skill: 'choose-frontend', args: {} },
    { skill: 'create-architecture', args: {} },
    { skill: 'api-design', args: {} },
    { skill: 'database-design', args: {} },
    { skill: 'create-epics', args: {} },
    { skill: 'user-stories', args: {} },
    { skill: 'sprint-plan', args: {} }
  ];
  
  for (let i = 0; i < steps.length; i++) {
    const step = steps[i];
    
    console.log(`\n=== Step ${i + 1}/${steps.length}: /${step.skill} ===`);
    
    // Run skill
    await runSkill(step.skill, step.args);
    
    // CHECKPOINT at critical steps
    if (isCriticalStep(i)) {
      const proceed = await askUser({
        question: `Step ${i + 1} complete. Continue to next step?`,
        options: ['Continue', 'Review this step', 'Stop here']
      });
      
      if (proceed === 'Stop here') {
        await saveProgress(i);
        return { status: 'stopped', atStep: i };
      }
    }
  }
  
  // Final validation
  await runSkill('doc-validator');
  
  return { status: 'complete', allDocs: 'validated' };
}

function isCriticalStep(stepIndex) {
  // Critical steps that need approval
  const critical = [2, 5, 10]; // PRD, Architecture, Sprint Plan
  return critical.includes(stepIndex);
}
```

### Step 3: Show Progress
```markdown
# New Project Setup Progress

## Step 1/11: Brainstorm ✅
- Ideas generated
- Problem space defined

## Step 2/11: PRD ✅ (CHECKPOINT)
- Requirements documented
- Features defined
- → Continue? [Yes/Review/Stop]

## Step 3/11: Project Planning ✅
- Team planned
- Infrastructure decided

## Step 4/11: Choose Stack ✅
- Backend: [selected]
- Database: [selected]
- Messaging: [selected]

## Step 5/11: Choose Frontend ✅
- Framework: [selected]
- UI Library: [selected]

## Step 6/11: Architecture ✅ (CHECKPOINT)
- System designed
- Components defined
- → Continue? [Yes/Review/Stop]

## Step 7/11: API Design ✅
- Endpoints defined
- Schemas created

## Step 8/11: Database Design ✅
- Schema created
- Indexes defined

## Step 9/11: Epics ✅
- Features broken into epics
- Points estimated

## Step 10/11: User Stories ✅
- Stories created
- Acceptance criteria defined

## Step 11/11: Sprint Plan ✅ (CHECKPOINT)
- First sprint planned
- Stories selected
- → Continue? [Yes/Review/Stop]

## Final: Document Validation ✅
- All docs validated
- Score: 85/100
```

### Step 4: Handle Stop
```javascript
async function saveProgress(completedStep) {
  const progress = {
    shortcut: 'new-project',
    completedSteps: completedStep,
    totalSteps: 11,
    status: 'in-progress',
    completedAt: new Date().toISOString()
  };
  
  await saveToFile('production/shortcuts/new-project.json', progress);
  
  console.log(`\nProgress saved at step ${completedStep}`);
  console.log('Run /new-project again to continue from where you stopped.');
}
```

## Output
- All 11 planning documents created
- Checkpoints at critical steps
- Progress saved if stopped
- Final validation report
