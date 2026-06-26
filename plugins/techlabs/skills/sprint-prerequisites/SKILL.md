# sprint-prerequisites

Validate all prerequisites before starting a sprint.

## When to Use
- Before sprint planning
- Before sprint execution
- After major scope changes
- Quality gate before development

## Agents to Dispatch
- product-manager: Requirements check
- lead-engineer: Technical prerequisites
- technical-director: Architecture validation

## Prerequisites Matrix

```
REQUIRED DOCUMENTS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PHASE 1: PLANNING (Must Complete)
─────────────────────────────────────────────────────────────
Document                    │ File Path                    │ Status
────────────────────────────┼──────────────────────────────┼────────
PRD                         │ docs/PRD.md                  │ REQUIRED
Project Context             │ production/project-context.json │ REQUIRED
Session State               │ production/session-state/active.md │ REQUIRED
─────────────────────────────────────────────────────────────

PHASE 2: ARCHITECTURE (Must Complete)
─────────────────────────────────────────────────────────────
Architecture                │ docs/architecture.md         │ REQUIRED
API Design                  │ docs/api-design.md           │ REQUIRED
Database Design             │ docs/database-design.md      │ REQUIRED
─────────────────────────────────────────────────────────────

PHASE 3: SPRINT PLANNING (Must Complete)
─────────────────────────────────────────────────────────────
Epics                       │ production/epics/            │ REQUIRED
User Stories                │ production/stories/          │ REQUIRED
Sprint Plan                 │ production/sprint/current.json │ REQUIRED
─────────────────────────────────────────────────────────────

PHASE 4: INFRASTRUCTURE (Must Complete)
─────────────────────────────────────────────────────────────
Stack Configuration         │ docs/stack.md                │ REQUIRED
Frontend Configuration      │ docs/frontend.md             │ REQUIRED
Deployment Config           │ docs/deployment.md           │ REQUIRED
─────────────────────────────────────────────────────────────

OPTIONAL (Recommended)
─────────────────────────────────────────────────────────────
Security Requirements       │ docs/security.md             │ RECOMMENDED
Compliance Requirements     │ docs/compliance.md           │ RECOMMENDED
Cost Estimates              │ docs/cost.md                 │ RECOMMENDED
─────────────────────────────────────────────────────────────
```

## Execution

### Step 1: Check All Prerequisites
```javascript
// Production code
async function validatePrerequisites() {
  const results = {
    planning: await checkPlanningPhase(),
    architecture: await checkArchitecturePhase(),
    sprint: await checkSprintPhase(),
    infrastructure: await checkInfrastructurePhase()
  };
  
  const allPassed = Object.values(results).every(r => r.passed);
  
  if (!allPassed) {
    return {
      ready: false,
      results: results,
      missing: getMissingItems(results)
    };
  }
  
  return { ready: true, results: results };
}
```

### Step 2: Generate Prerequisite Report
```markdown
# Sprint Prerequisites Report

## Date: 2024-01-15
## Sprint: 2024-S1

## Overall Status: ❌ NOT READY

## Planning Phase
| Document | Status | Action |
|----------|--------|--------|
| PRD | ✅ Done | - |
| Project Context | ✅ Done | - |
| Session State | ✅ Done | - |

## Architecture Phase
| Document | Status | Action |
|----------|--------|--------|
| Architecture | ❌ Missing | Run /create-architecture |
| API Design | ❌ Missing | Run /api-design |
| Database Design | ⚠️ Partial | Complete /database-design |

## Sprint Phase
| Document | Status | Action |
|----------|--------|--------|
| Epics | ✅ Done | - |
| User Stories | ✅ Done | - |
| Sprint Plan | ❌ Missing | Run /sprint-plan |

## Infrastructure Phase
| Document | Status | Action |
|----------|--------|--------|
| Stack | ✅ Done | - |
| Frontend | ✅ Done | - |
| Deployment | ❌ Missing | Run /create-dockerfile |

## Missing Items Summary
1. /create-architecture (Critical)
2. /api-design (Critical)
3. /database-design (Critical)
4. /sprint-plan (Critical)
5. /create-dockerfile (Critical)

## Blockers
- Cannot start sprint without these documents
- Run missing skills before proceeding
```

### Step 3: Block Sprint If Not Ready
```javascript
async function checkSprintReadiness() {
  const prerequisites = await validatePrerequisites();
  
  if (!prerequisites.ready) {
    console.log("=== SPRINT BLOCKED ===");
    console.log("Missing prerequisites:");
    
    for (const item of prerequisites.missing) {
      console.log(`  ❌ ${item.skill}: ${item.reason}`);
    }
    
    console.log("\nRun these skills before starting sprint:");
    for (const item of prerequisites.missing) {
      console.log(`  → /${item.skill}`);
    }
    
    // Ask user what to do
    const action = await askUser({
      question: "Prerequisites not met. What to do?",
      options: [
        "Run missing skills now",
        "Skip prerequisites (risky)",
        "Cancel sprint"
      ]
    });
    
    if (action === "Run missing skills now") {
      await runMissingSkills(prerequisites.missing);
    } else if (action === "Cancel sprint") {
      throw new Error("Sprint cancelled by user");
    }
    // If skip, continue with warning
  }
  
  return prerequisites.ready;
}
```

### Step 4: Auto-Generate Missing Docs
```javascript
async function runMissingSkills(missingItems) {
  for (const item of missingItems) {
    console.log(`\n=== Running ${item.skill} ===`);
    
    // Check dependencies first
    const deps = await getDependencies(item.skill);
    for (const dep of deps) {
      if (!await isComplete(dep)) {
        console.log(`  First running dependency: ${dep}`);
        await runSkill(dep);
      }
    }
    
    // Run the skill
    await runSkill(item.skill);
  }
}
```

### Step 5: Generate Missing Docs
```markdown
# Auto-Generated Documents

## If Missing: Architecture
Run /create-architecture with:
- PRD context
- Stack configuration
- Team composition

## If Missing: API Design
Run /api-design with:
- Architecture context
- PRD requirements
- Database schema

## If Missing: Database Design
Run /database-design with:
- PRD requirements
- API endpoints
- Data flow

## If Missing: Sprint Plan
Run /sprint-plan with:
- User stories
- Team capacity
- Sprint goals
```

## Output
- Prerequisites validated
- Missing items identified
- Report generated
- Sprint blocked if not ready
- Missing skills can be auto-run
