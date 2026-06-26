# start

Guided onboarding for new projects. Detects current state and recommends workflow.

## When to Use
- New project kickoff
- First session with TechLabs
- Project state unknown
- Need workflow recommendation

## Execution

### Step 1: Detect Project State
```
CHECK FOR:
- CLAUDE.md exists?
- docs/ directory has content?
- src/ directory has code?
- package.json or go.mod exists?
- .git initialized?
```

### Step 2: Ask User Context
```
QUESTIONS:
1. What type of project? (SaaS, API, CLI, Desktop, Mobile, AI/ML, Data, Messaging)
2. What's your tech stack? (If known)
3. What's your current stage? (Idea, Design, Implementation, Production)
4. Team size? (Solo, Small, Medium, Large)
```

### Step 3: Recommend Workflow
```
IF stage == "idea":
  RECOMMEND: /brainstorm → /choose-domain → /create-prd → /project-planning
  
IF stage == "design":
  RECOMMEND: /design-system → /create-architecture → /api-design
  
IF stage == "implementation":
  RECOMMEND: /sprint-plan → /sprint-orchestrator
  
IF stage == "production":
  RECOMMEND: /qa-plan → /release-checklist → /launch-checklist
```

### Step 4: Create Initial Docs
```
CREATE:
- docs/PRD.md (from template)
- docs/architecture.md (from template)
- production/session-state/active.md (session tracking)
```

### Step 5: Summary
```
SHOW:
- Project type detected
- Recommended workflow
- Next steps
- Files created
```

## Output
- Created docs/PRD.md
- Created docs/architecture.md
- Created production/session-state/active.md
- Recommended next steps
