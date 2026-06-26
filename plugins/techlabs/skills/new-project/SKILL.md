# new-project

Complete project setup from scratch in one command.

## When to Use
- Starting brand new project
- Want complete planning done at once
- Don't want to run 10+ commands manually

## What This Does

Chains 20+ planning skills into one comprehensive flow:

```
FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PHASE 0: RESEARCH & DISCOVERY

STEP 0a: /brainstorm
  → Ask 5 questions about problem
  → Generate ideas
  → SAVE CHECKPOINT: "Brainstorm complete"

STEP 0b: /market-research
  → Market size (TAM/SAM/SOM)
  → Market trends
  → Competitor analysis
  → SAVE CHECKPOINT: "Market research complete"

STEP 0c: /competitor-research
  → Competitor profiles
  → Competitive analysis
  → SAVE CHECKPOINT: "Competitor research complete"

STEP 0d: /user-research
  → User personas
  → User journeys
  → SAVE CHECKPOINT: "User research complete"

PHASE 0.5: STACK SELECTION (BEFORE BUSINESS DOCS)

STEP 0e: /choose-stack (MANDATORY)
  → Select backend, database, messaging
  → Based on research findings
  → SAVE CHECKPOINT: "Stack selected"

STEP 0f: /choose-frontend (MANDATORY)
  → Select frontend framework
  → Based on project requirements
  → SAVE CHECKPOINT: "Frontend selected"

STEP 0g: /choose-messaging (IF NEEDED)
  → Select messaging system
  → If async processing needed
  → SAVE CHECKPOINT: "Messaging selected"

PHASE 1: BUSINESS DOCUMENTS (WITH STACK CONTEXT)

STEP 1a: /create-brd (MANDATORY)
  → Business Requirements Document
  → Now has stack context
  → Stakeholder alignment
  → Budget approval
  → SAVE CHECKPOINT: "BRD created and approved"

STEP 1b: /create-prd
  → Product Requirements Document
  → Now has stack context
  → Feature definitions
  → SAVE CHECKPOINT: "PRD created"

STEP 1c: /create-urs (MANDATORY)
  → User Requirements Specification
  → User personas, journeys, use cases
  → SAVE CHECKPOINT: "URS created and approved"

PHASE 2: TECHNICAL DOCUMENTS

STEP 2a: /project-planning
  → Team composition
  → Infrastructure planning
  → Security requirements
  → Budget estimation
  → SAVE CHECKPOINT: "Project plan created"

STEP 2b: /create-project-lead (MANDATORY)
  → Create project-specific lead agent
  → Build knowledge base
  → SAVE CHECKPOINT: "Project lead created"

STEP 2c: /create-srs (MANDATORY)
  → Software Requirements Specification
  → Functional & non-functional requirements
  → Security & performance requirements
  → SAVE CHECKPOINT: "SRS created and approved"

STEP 2d: /create-adr (MANDATORY)
  → Architecture Decision Records
  → Document all technical decisions
  → SAVE CHECKPOINT: "ADR created"

STEP 2e: /create-architecture
  → System design, components
  → SAVE CHECKPOINT: "Architecture created"

STEP 2f: /api-design
  → API endpoints, schemas
  → SAVE CHECKPOINT: "API design created"

STEP 2g: /database-design
  → Schema, indexes, constraints
  → SAVE CHECKPOINT: "Database design created"

PHASE 3: KNOWLEDGE BASE (WITH STACK)

STEP 3a: /knowledge-base (MANDATORY)
  → Search ALL documentation for project stack
  → Process documentation (not raw)
  → Organize by stack component
  → Store in knowledge base
  → All agents can access
  → SAVE CHECKPOINT: "Knowledge base built"

KNOWLEDGE BASE INCLUDES:
- Backend docs (language, framework, patterns)
- Frontend docs (framework, components, state)
- Database docs (schema, indexing, optimization)
- Infrastructure docs (deployment, monitoring)
- Security docs (auth, compliance, best practices)
- Performance docs (caching, optimization)

PHASE 4: MONITORING & BUSINESS PLANNING

STEP 4a: /create-monitoring-plan (MANDATORY)
  → Define business metrics
  → Define UX metrics
  → Define technical metrics
  → Design dashboards
  → Configure alerts
  → SAVE CHECKPOINT: "Monitoring plan created"

STEP 4b: /create-revenue-analysis (MANDATORY)
  → Revenue model defined
  → Conversion targets set
  → Churn targets set
  → SAVE CHECKPOINT: "Revenue analysis created"

PHASE 5: SPRINT PLANNING

STEP 5a: /create-epics
  → Break into epics
  → SAVE CHECKPOINT: "Epics created"

STEP 5b: /user-stories
  → Create user stories
  → SAVE CHECKPOINT: "User stories created"

STEP 5c: /sprint-plan
  → Plan first sprint
  → SAVE CHECKPOINT: "Sprint plan created"

FINAL: /doc-validator
  → Validate all documents
  → SAVE CHECKPOINT: "Documents validated"

POST-LAUNCH: CONTINUOUS IMPROVEMENT LOOP

STEP 6a: /business-monitoring (AFTER LAUNCH)
  → Track metrics
  → Analyze data
  → Identify issues
  → Identify opportunities
  → SAVE CHECKPOINT: "Monitoring complete"

STEP 6b: /business-improvement (AFTER MONITORING)
  → Create improvement proposals
  → Prioritize improvements
  → Assign to planning
  → SAVE CHECKPOINT: "Improvements proposed"

STEP 6c: /business-planning-update (AFTER IMPROVEMENTS)
  → Update business planning
  → Update documents
  → Create new sprint items
  → SAVE CHECKPOINT: "Planning updated"

→ REPEAT FROM STEP 6a (CONTINUOUS LOOP)
```

## Multi-Agent Discussions

```
⚠️ MANDATORY: Multi-agent discussions at critical decisions

DISCUSSION POINTS:

1. BRD APPROVAL
   - Product Manager: Requirements clear?
   - Business Analyst: Workflows defined?
   - Financial Analyst: Budget realistic?
   - Security Lead: Compliance requirements clear?

2. STACK SELECTION
   - Technical Director: Technically sound?
   - Security Lead: Security implications?
   - Performance Lead: Performance implications?

3. ARCHITECTURE DECISION
   - Technical Director: Architecture feasible?
   - Security Lead: Security requirements met?
   - Performance Lead: Scalability requirements met?

4. API DESIGN
   - Technical Director: API design sound?
   - Security Lead: Security requirements met?
   - Performance Lead: Performance requirements met?

5. DATABASE DESIGN
   - Technical Director: Schema design sound?
   - Security Lead: Data protection requirements met?
   - Performance Lead: Performance requirements met?

ALL AGENTS MUST AGREE BEFORE PROCEEDING
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
