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
  → SKIP if existing research provided
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
"Starting new project setup. This will run 23 planning skills."

PHASES:
- Phase 0: Research & Discovery (4 skills)
- Phase 0.5: Stack Selection (3 skills)
- Phase 1: Business Documents (3 skills)
- Phase 2: Technical Documents (7 skills)
- Phase 3: Knowledge Base (1 skill)
- Phase 4: Monitoring (2 skills)
- Phase 5: Sprint Planning (3 skills)

ASK USER:
1. Project name?
2. Project description?
3. Main goal?

ASK USER (EXISTING ASSETS):
4. Do you have existing BRD? (yes/no)
   - If yes: "Provide BRD file path or paste content"
5. Do you have existing PRD? (yes/no)
   - If yes: "Provide PRD file path or paste content"
6. Do you have existing landing page? (yes/no)
   - If yes: "Provide landing page file path or URL"
7. Do you have existing research? (yes/no)
   - If yes: "Provide research files"
8. Do you have existing design? (yes/no)
   - If yes: "Provide design files (Figma, images, etc.)"
9. Do you have existing API docs? (yes/no)
   - If yes: "Provide API docs file path or URL"
10. Do you have existing code? (yes/no)
    - If yes: "Provide code repository path"

EXISTING ASSETS FOLDER:
```
production/existing-assets/
├── brd/           ← Existing BRD files
├── prd/           ← Existing PRD files
├── landing-page/  ← Existing landing pages
├── research/      ← Existing research
├── design/        ← Existing design files
├── api-docs/      ← Existing API docs
├── code/          ← Existing code
└── README.md      ← Index of existing assets
```

SAVE to session state:
{
  "shortcut": "new-project",
  "projectName": "[user-input]",
  "currentStep": 1,
  "totalSteps": 23,
  "existingAssets": {
    "brd": {"provided": false, "path": null},
    "prd": {"provided": false, "path": null},
    "landingPage": {"provided": false, "path": null},
    "research": {"provided": false, "path": null},
    "design": {"provided": false, "path": null},
    "apiDocs": {"provided": false, "path": null},
    "code": {"provided": false, "path": null}
  }
}
```

### Step 2: Run Each Step with Checkpoints
```javascript
async function runNewProject(projectInfo) {
  const steps = [
    // PHASE 0: RESEARCH
    { skill: 'brainstorm', args: { topic: projectInfo.goal }, skipIf: 'existingResearch' },
    { skill: 'market-research', args: {}, skipIf: 'existingResearch' },
    { skill: 'competitor-research', args: {}, skipIf: 'existingResearch' },
    { skill: 'user-research', args: {}, skipIf: 'existingResearch' },
    
    // PHASE 0.5: STACK SELECTION (BEFORE BUSINESS DOCS)
    { skill: 'choose-stack', args: {} },
    { skill: 'choose-frontend', args: {} },
    { skill: 'choose-messaging', args: {}, optional: true },
    
    // PHASE 1: BUSINESS DOCUMENTS (WITH STACK CONTEXT)
    { skill: 'create-brd', args: {}, skipIf: 'existingBRD' },
    { skill: 'create-prd', args: {}, skipIf: 'existingPRD' },
    { skill: 'create-urs', args: {} },
    
    // PHASE 2: TECHNICAL DOCUMENTS
    { skill: 'project-planning', args: {} },
    { skill: 'create-project-lead', args: {} },
    { skill: 'create-srs', args: {} },
    { skill: 'create-adr', args: {} },
    { skill: 'create-architecture', args: {} },
    { skill: 'api-design', args: {} },
    { skill: 'database-design', args: {} },
    
    // PHASE 3: KNOWLEDGE BASE
    { skill: 'knowledge-base', args: {} },
    
    // PHASE 4: MONITORING
    { skill: 'create-monitoring-plan', args: {} },
    { skill: 'create-revenue-analysis', args: {} },
    
    // PHASE 5: SPRINT PLANNING
    { skill: 'create-epics', args: {} },
    { skill: 'user-stories', args: {} },
    { skill: 'sprint-plan', args: {} }
  ];
  
  for (let i = 0; i < steps.length; i++) {
    const step = steps[i];
    
    // Skip optional steps if not needed
    if (step.optional) {
      const needed = await askUser({
        question: `${step.skill} needed?`,
        options: ['Yes', 'No']
      });
      if (needed === 'No') continue;
    }
    
    // Skip if existing asset provided
    if (step.skipIf && projectInfo.existingAssets[step.skipIf]) {
      console.log(`\n=== Step ${i + 1}/${steps.length}: /${step.skill} (SKIPPED - using existing) ===`);
      await loadExistingAsset(step.skipIf);
      continue;
    }
    
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

async function loadExistingAsset(assetType) {
  const assetPath = `production/existing-assets/${assetType}/`;
  console.log(`Loading existing ${assetType} from ${assetPath}`);
  // Load and integrate existing asset into context
  return await readFile(assetPath);
}

function isCriticalStep(stepIndex) {
  // Critical steps that need approval
  // Index: 0=brainstorm, 1=market, 2=competitor, 3=user,
  //        4=choose-stack, 5=choose-frontend, 6=choose-messaging,
  //        7=brd, 8=prd, 9=urs,
  //        10=project-planning, 11=project-lead, 12=srs,
  //        13=adr, 14=architecture, 15=api-design, 16=database,
  //        17=knowledge-base, 18=monitoring, 19=revenue,
  //        20=epics, 21=user-stories, 22=sprint-plan
  
  const critical = [
    4,   // choose-stack
    7,   // brd
    8,   // prd
    12,  // srs
    14,  // architecture
    22   // sprint-plan
  ];
  
  return critical.includes(stepIndex);
}
```

### Step 3: Show Progress
```markdown
# New Project Setup Progress

## PHASE 0: RESEARCH
## Step 1/23: Brainstorm ✅
- Ideas generated
- Problem space defined

## Step 2/23: Market Research ✅
- Market size analyzed
- Trends identified

## Step 3/23: Competitor Research ✅
- Competitor profiles created
- Competitive analysis done

## Step 4/23: User Research ✅
- User personas created
- User journeys mapped

## PHASE 0.5: STACK SELECTION
## Step 5/23: Choose Stack ✅ (CHECKPOINT)
- Backend: [selected]
- Database: [selected]
- Messaging: [selected]
- → Continue? [Yes/Review/Stop]

## Step 6/23: Choose Frontend ✅
- Framework: [selected]
- UI Library: [selected]

## Step 7/23: Choose Messaging ✅
- Messaging: [selected]

## PHASE 1: BUSINESS DOCUMENTS
## Step 8/23: BRD ✅ (CHECKPOINT)
- Business requirements documented
- Budget approved
- → Continue? [Yes/Review/Stop]

## Step 9/23: PRD ✅
- Product requirements documented
- Features defined

## Step 10/23: URS ✅
- User requirements specified
- Use cases documented

## PHASE 2: TECHNICAL DOCUMENTS
## Step 11/23: Project Planning ✅
- Team planned
- Infrastructure decided

## Step 12/23: Project Lead ✅
- Lead agent created
- Knowledge base built

## Step 13/23: SRS ✅ (CHECKPOINT)
- Software requirements documented
- Non-functional requirements defined
- → Continue? [Yes/Review/Stop]

## Step 14/23: ADR ✅
- Architecture decisions documented
- Trade-offs recorded

## Step 15/23: Architecture ✅ (CHECKPOINT)
- System designed
- Components defined
- → Continue? [Yes/Review/Stop]

## Step 16/23: API Design ✅
- Endpoints defined
- Schemas created

## Step 17/23: Database Design ✅
- Schema created
- Indexes defined

## PHASE 3: KNOWLEDGE BASE
## Step 18/23: Knowledge Base ✅
- Documentation loaded
- Patterns organized
- Best practices documented

## PHASE 4: MONITORING
## Step 19/23: Monitoring Plan ✅
- Business metrics defined
- UX metrics defined
- Technical metrics defined

## Step 20/23: Revenue Analysis ✅
- Revenue model defined
- Conversion targets set
- Churn targets set

## PHASE 5: SPRINT PLANNING
## Step 21/23: Epics ✅
- Features broken into epics
- Points estimated

## Step 22/23: User Stories ✅
- Stories created
- Acceptance criteria defined

## Step 23/23: Sprint Plan ✅ (CHECKPOINT)
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
    totalSteps: 23,
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
