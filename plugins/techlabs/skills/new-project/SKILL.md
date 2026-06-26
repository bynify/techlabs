# new-project

Complete project setup from scratch in one command.

## When to Use
- Starting brand new project
- Want complete planning done at once
- Don't want to run 10+ commands manually

## Agents to Dispatch
- product-manager: Business requirements
- technical-director: Technical decisions
- lead-engineer: Architecture
- All specialists: Domain-specific tasks

## What This Does

Chains 23 planning skills into one comprehensive flow.

## Execution

### Step 1: Gather Information (MANDATORY - DO THIS FIRST)

```
⚠️ STOP! DO NOT SKIP THIS STEP!
⚠️ YOU MUST ASK ALL QUESTIONS BELOW BEFORE PROCEEDING!

ANNOUNCE TO USER:
"Starting new project setup. Let me gather some information first."

THEN ASK THESE QUESTIONS ONE BY ONE:

QUESTION 1: "What is the project name?"
→ Wait for answer
→ Save to projectInfo.projectName

QUESTION 2: "What is the project description?"
→ Wait for answer
→ Save to projectInfo.description

QUESTION 3: "What is the main goal of this project?"
→ Wait for answer
→ Save to projectInfo.goal

QUESTION 4: "Do you have an existing BRD (Business Requirements Document)? (yes/no)"
→ If yes: "Please provide the BRD file path or paste the content"
→ Save to projectInfo.existingAssets.brd

QUESTION 5: "Do you have an existing PRD (Product Requirements Document)? (yes/no)"
→ If yes: "Please provide the PRD file path or paste the content"
→ Save to projectInfo.existingAssets.prd

QUESTION 6: "Do you have an existing landing page? (yes/no)"
→ If yes: "Please provide the landing page file path or URL"
→ Save to projectInfo.existingAssets.landingPage

QUESTION 7: "Do you have existing research (market, competitor, user)? (yes/no)"
→ If yes: "Please provide the research files"
→ Save to projectInfo.existingAssets.research

QUESTION 8: "Do you have existing design files (Figma, images, wireframes)? (yes/no)"
→ If yes: "Please provide the design files"
→ Save to projectInfo.existingAssets.design

QUESTION 9: "Do you have existing API documentation? (yes/no)"
→ If yes: "Please provide the API docs file path or URL"
→ Save to projectInfo.existingAssets.apiDocs

QUESTION 10: "Do you have existing code/repository? (yes/no)"
→ If yes: "Please provide the code repository path"
→ Save to projectInfo.existingAssets.code

⚠️ DO NOT PROCEED TO STEP 2 UNTIL ALL QUESTIONS ARE ANSWERED!
```

### Step 2: Create Project Structure & Session State

```
AFTER GATHERING ALL INFORMATION:

1. CREATE FOLDERS:
- production/existing-assets/brd/
- production/existing-assets/prd/
- production/existing-assets/landing-page/
- production/existing-assets/research/
- production/existing-assets/design/
- production/existing-assets/api-docs/
- production/existing-assets/code/

2. CREATE SESSION STATE (production/session-state/active.md):

# Active Session State

## Current Phase: PLANNING
## Current Step: new-project
## Project: {projectName}
## Started: {date}

## Progress
- [x] Step 1: Gather Information
- [ ] Step 2: Create Project Structure
- [ ] Step 3: Research & Discovery
- [ ] Step 4: Stack Selection
- [ ] Step 5: Business Documents
- [ ] Step 6: Technical Documents
- [ ] Step 7: Knowledge Base
- [ ] Step 8: Monitoring
- [ ] Step 9: Sprint Planning

## Existing Assets
- BRD: {provided/not provided}
- PRD: {provided/not provided}
- Landing Page: {provided/not provided}
- Research: {provided/not provided}
- Design: {provided/not provided}
- API Docs: {provided/not provided}
- Code: {provided/not provided}

3. CREATE PROJECT CONTEXT (production/project-context.json):
{
  "projectName": "{projectName}",
  "description": "{description}",
  "goal": "{goal}",
  "existingAssets": {
    "brd": {"provided": false, "path": null},
    "prd": {"provided": false, "path": null},
    "landingPage": {"provided": false, "path": null},
    "research": {"provided": false, "path": null},
    "design": {"provided": false, "path": null},
    "apiDocs": {"provided": false, "path": null},
    "code": {"provided": false, "path": null}
  },
  "stack": null,
  "frontend": null,
  "phase": "planning"
}

4. CREATE PROGRESS TRACKER (production/shortcuts/new-project.json):
{
  "shortcut": "new-project",
  "projectName": "{projectName}",
  "currentStep": 2,
  "totalSteps": 23,
  "status": "in-progress",
  "completedSteps": ["gather-info", "create-structure"]
}

IF USER PROVIDED EXISTING ASSETS:
- Copy/move files to appropriate folders
- Load content into context
- Update project-context.json
```

### Step 3: Run Flow with Existing Assets Check

```
NOW RUN EACH PHASE:

PHASE 0: RESEARCH & DISCOVERY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

IF existing research NOT provided:
  → Run /brainstorm
  → Run /market-research
  → Run /competitor-research
  → Run /user-research

IF existing research provided:
  → SKIP research phase
  → Use existing research

UPDATE session-state/active.md: "Phase 0 complete"

PHASE 0.5: STACK SELECTION (MANDATORY)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

→ Run /choose-stack (ALWAYS - based on research)
→ Run /choose-frontend (ALWAYS)
→ Run /choose-messaging (IF needed)

UPDATE session-state/active.md: "Phase 0.5 complete, stack selected"
UPDATE project-context.json: "stack": "{selected-stack}"

PHASE 1: BUSINESS DOCUMENTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

IF existing BRD NOT provided:
  → Run /create-brd

IF existing BRD provided:
  → SKIP /create-brd
  → Load existing BRD

IF existing PRD NOT provided:
  → Run /create-prd

IF existing PRD provided:
  → SKIP /create-prd
  → Load existing PRD

→ Run /create-urs (ALWAYS)

UPDATE session-state/active.md: "Phase 1 complete"

PHASE 2: TECHNICAL DOCUMENTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

→ Run /project-planning (ALWAYS)
→ Run /create-project-lead (ALWAYS)
→ Run /create-srs (ALWAYS)
→ Run /create-adr (ALWAYS)
→ Run /create-architecture (ALWAYS)

IF existing API docs NOT provided:
  → Run /api-design

IF existing API docs provided:
  → SKIP /api-design
  → Load existing API docs

→ Run /database-design (ALWAYS)

UPDATE session-state/active.md: "Phase 2 complete"

PHASE 3: KNOWLEDGE BASE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

→ Run /knowledge-base (ALWAYS - loads stack-specific docs)

UPDATE session-state/active.md: "Phase 3 complete"

PHASE 4: MONITORING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

→ Run /create-monitoring-plan (ALWAYS)
→ Run /create-revenue-analysis (ALWAYS)

UPDATE session-state/active.md: "Phase 4 complete"

PHASE 5: SPRINT PLANNING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

→ Run /create-epics (ALWAYS)
→ Run /user-stories (ALWAYS)
→ Run /sprint-plan (ALWAYS)

UPDATE session-state/active.md: "Phase 5 complete"

FINAL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

→ Run /doc-validator (ALWAYS)
→ UPDATE session-state/active.md: "PLANNING COMPLETE"
→ UPDATE project-context.json: "phase": "planning-complete"
```

### Step 4: Show Progress

```
AFTER EACH STEP:
1. Show which step completed
2. Show which steps skipped (if existing assets)
3. Ask for approval at checkpoints
4. Update session-state/active.md
5. Update shortcuts/new-project.json
```

### Step 5: Handle Existing Assets

```
EXISTING ASSETS FOLDER:
production/existing-assets/
├── brd/           ← Existing BRD files
├── prd/           ← Existing PRD files
├── landing-page/  ← Existing landing pages
├── research/      ← Existing research
├── design/        ← Existing design files
├── api-docs/      ← Existing API docs
├── code/          ← Existing code
└── README.md      ← Index of existing assets

WHEN LOADING EXISTING ASSET:
1. Read file content
2. Parse and understand
3. Integrate into context
4. Use in subsequent steps

EXAMPLE - Loading existing BRD:
```
READ: production/existing-assets/brd/brd.md
EXTRACT:
- Business objectives
- Stakeholders
- Budget
- Timeline
- Constraints

USE IN:
- /create-prd (reference BRD)
- /project-planning (budget, timeline)
- /create-srs (constraints)
```
```

## Output
- All planning documents created (or loaded from existing)
- Checkpoints at critical steps
- Progress saved if stopped
- Final validation report
- Session state updated
- Project context created
