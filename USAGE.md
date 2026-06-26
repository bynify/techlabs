# TechLabs Usage Guide

Complete guide for using TechLabs framework with case scenarios, workflows, and best practices.

## Table of Contents

- [Quick Start](#quick-start)
- [Shortcuts](#shortcuts)
- [Complete Workflow](#complete-workflow)
- [Case Scenarios](#case-scenarios)
- [Do's and Don'ts](#dos-and-donts)
- [Troubleshooting](#troubleshooting)
- [Advanced Usage](#advanced-usage)

---

## Quick Start

### New Project (One Command)

```bash
# Complete project setup in one command
/new-project

# This chains 11 skills:
# brainstorm → create-prd → project-planning
# → choose-stack → choose-frontend
# → create-architecture → api-design → database-design
# → create-epics → user-stories → sprint-plan
# → doc-validator
```

### Quick Sprint (One Command)

```bash
# Plan and execute sprint in one command
/quick-sprint

# This chains 2 skills:
# sprint-plan → sprint-orchestrator
```

### Resume Work

```bash
# Continue from yesterday
/start-day
```

### Existing Project (Adopt TechLabs)

```bash
# Step 1: Scan and adopt
/adopt-existing

# Step 2: Remap paths if needed
/remap-paths

# Step 3: Generate restructure plan
/restructure-plan

# Step 4: Validate adoption
/integrity-audit
```

### Resume Work (Next Day)

```bash
# Step 1: Start day
/start-day

# Step 2: Continue from where you left off
# (Framework will show current status and next steps)
```

---

## Shortcuts

| Shortcut | Description | Steps |
|----------|-------------|-------|
| `/new-project` | Complete project setup | 11 |
| `/quick-sprint` | Plan and execute sprint | 2 |
| `/full-cycle` | Complete sprint cycle | 5 |
| `/emergency-fix` | Fast-track bug fix | 4 |
| `/production-deploy` | Full production deployment | 5 |
| `/audit-all` | Comprehensive audit | 4 |
| `/monitoring-setup` | Complete monitoring stack | 4 |
| `/business-review` | Business analysis | 5 |

### How Shortcuts Work

1. **Auto-chain**: Skills run in sequence automatically
2. **Checkpoints**: Critical steps ask for approval
3. **Progress save**: Can stop and resume later
4. **Fast-track**: Emergency shortcuts skip non-essential steps

---

## Complete Workflow

### Phase 1: Planning (Day 1-3)

```
DAY 1: DISCOVERY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

/start
  → Onboarding questions
  → Detect project state
  → Recommend workflow

/brainstorm
  → 5 questions about problem space
  → Generate ideas
  → Save to session state

/create-prd
  → Define features
  → Write requirements
  → Acceptance criteria
  → Save to docs/PRD.md

/project-planning
  → Team composition
  → Infrastructure decisions
  → Security requirements
  → Monitoring setup
  → Budget estimation
  → Timeline planning
```

```
DAY 2: TECHNICAL DECISIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

/choose-stack
  → Backend framework selection
  → Database selection
  → Messaging selection
  → Save to docs/stack.md

/choose-frontend
  → Frontend framework selection
  → UI library selection
  → Deployment target
  → Save to docs/frontend.md

/create-architecture
  → System design
  → Component diagram
  → Data flow
  → Save to docs/architecture.md

/api-design
  → API endpoints
  → Request/response schemas
  → Error handling
  → Save to docs/api-design.md

/database-design
  → Schema design
  → Indexes
  → Constraints
  → Save to docs/database-design.md
```

```
DAY 3: SPRINT PREPARATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

/create-epics
  → Break features into epics
  → Estimate points
  → Save to production/epics/

/user-stories
  → Create user stories
  → Write acceptance criteria
  → Estimate each story
  → Save to production/stories/

/doc-validator
  → Validate all documents
  → Check quality scores
  → Fix any issues

/sprint-plan
  → Select stories for sprint
  → Calculate capacity
  → Create sprint plan
  → Save to production/sprint/
```

### Phase 2: Execution (Day 4-10)

```
DAY 4-10: SPRINT EXECUTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

/start-day
  → Load session state
  → Show current status
  → Continue from last point

/sprint-orchestrator
  → Execute sprint end-to-end
  → Per story loop:
    1. story-readiness
    2. dispatch-story → specialist agent
    3. dev-story → implementation
    4. review-gate → code review
    5. gate-check → quality gates
    6. qa-plan → testing
    7. story-done → verification
```

### Phase 3: Completion (Day 10+)

```
SPRINT COMPLETION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

/milestone-review
  → Sprint review
  → Demo completed work

/post-mortem
  → Retrospective
  → What went well
  → What to improve

/sprint-status
  → Final sprint report
  → Metrics and velocity

/sprint-transition
  → Complete sprint
  → Carry over incomplete stories
  → Start next sprint
```

---

## Case Scenarios

### Case 1: New SaaS Product

```bash
# Day 1: Planning
/start
/brainstorm "SaaS platform for team collaboration"
/create-prd
/project-planning

# Day 2: Technical
/choose-stack "Go + PostgreSQL + Redis"
/choose-frontend "Next.js + Tailwind + shadcn/ui"
/create-architecture
/api-design
/database-design

# Day 3: Sprint Prep
/create-epics
/user-stories
/sprint-plan
/sprint-prerequisites

# Day 4-10: Execution
/sprint-orchestrator

# Day 10+: Completion
/milestone-review
/post-mortem
/sprint-transition
```

### Case 2: Existing Project Adoption

```bash
# Scan existing project
/adopt-existing

# Remap paths to match your structure
/remap-paths

# Generate restructure plan
/restructure-plan

# Validate adoption
/integrity-audit

# Start using TechLabs
/start-day
```

### Case 3: Resume Work (Multiple Days)

```bash
# Day 1: Start project
/start
/brainstorm
/create-prd
/project-planning

# Day 2: Continue planning
/start-day
/choose-stack
/create-architecture

# Day 3: Start sprint
/start-day
/sprint-plan
/sprint-orchestrator

# Day 4: Continue sprint
/start-day
# → Shows: "Sprint Day 2/10, In Progress: AUTH-001 (60%)"
# → Continue with implementation
```

### Case 4: Change Request During Sprint

```bash
# Sprint is running
/sprint-orchestrator

# User: "Add dark mode feature"
/change-request
  → Classify: Feature request
  → Priority: P1
  → Impact: +5 points
  → Decision: Add to sprint (remove lowest priority)

# User: "API response time too slow"
/change-request
  → Classify: Bug/Performance
  → Priority: P0
  → Action: Pause sprint, fix immediately

# User: "Story AUTH-001 scope changed"
/scope-change
  → Update story
  → Re-estimate
  → Update sprint plan
```

### Case 5: Sprint Blocked by Missing Docs

```bash
# Try to start sprint
/sprint-orchestrator

# Framework detects missing docs
# → "BLOCKED: Architecture document missing"

# Fix missing docs
/create-architecture
/api-design

# Validate again
/sprint-prerequisites

# Now proceed with sprint
/sprint-orchestrator
```

### Case 6: Story Stuck in Revision Loop

```bash
# Story keeps failing review
/review-gate → FAIL
/dev-story → fix
/review-gate → FAIL
/dev-story → fix
/review-gate → FAIL

# Framework detects MAX_REVISION = 3
# → "ESCALATE: Story exceeded max revisions"

# Options presented:
1. Split story into smaller pieces
2. Reject story (move to backlog)
3. Reassign to different specialist
4. Escalate to technical-director
```

### Case 7: Sprint Carryover Limit

```bash
# Sprint 1: Story AUTH-003 fails → carryover to Sprint 2
# Sprint 2: Story AUTH-003 fails again → carryover to Sprint 3
# Sprint 3: Story AUTH-003 fails again

# Framework detects MAX_CARRYOVER = 2
# → "ESCALATE: Story exceeded max carryovers"

# Options presented:
1. Split story into smaller pieces
2. Reject story (remove from backlog)
3. Mark as technical debt
```

### Case 8: Document Recovery

```bash
# User skips planning, goes to sprint
/sprint-orchestrator

# Framework: "BLOCKED: PRD missing"

# User: "Just generate it"
/doc-recovery

# Framework generates auto-PRD
# → WARNING: "AUTO-GENERATED - Quality: 60%"
# → "Review recommended before sprint"

# User confirms
/sprint-orchestrator
```

### Case 9: Multi-Agent Story

```bash
# Story needs both frontend and backend
/dispatch-story

# Framework detects multi-agent requirement
# → "DISPATCH: go-specialist (PRIMARY)"
# → "SUPPORT: ui-engineer (SECONDARY)"

# Both agents work on different parts
# Story completed with both components
```

### Case 10: Batch Change Requests

```bash
# Multiple changes pending
/change-request
/change-request
/change-request

# Framework detects batch
# → "Found 3 pending changes"
# → "Process all at once?"

# User: "Yes"
# Framework processes batch
# → Shows combined impact report
```

---

## Do's and Don'ts

### DO's ✅

```
PLANNING:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ DO: Complete all planning phases before sprint
  /brainstorm → /create-prd → /project-planning
  → /choose-stack → /create-architecture
  → /create-epics → /user-stories → /sprint-plan

✅ DO: Validate documents before sprint
  /sprint-prerequisites
  /doc-validator

✅ DO: Use /start-day to resume work
  → Loads session state automatically
  → Shows current progress

✅ DO: Review auto-generated documents
  → /doc-recovery generates docs at 60% quality
  → Always review and refine before sprint

EXECUTION:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ DO: Use /sprint-orchestrator for sprint execution
  → Handles entire workflow
  → Dispatches to specialist agents

✅ DO: Let framework dispatch to specialists
  → /dispatch-story routes to correct agent
  → Agent follows their code standards

✅ DO: Follow quality gates
  → /review-gate → /gate-check → /qa-plan
  → Don't skip gates

✅ DO: Update session state
  → Framework saves automatically
  → Use /start-day to resume

CHANGE MANAGEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ DO: Use /change-request for feature requests
  → Classifies change type
  → Shows impact analysis

✅ DO: Use /sprint-replan when major changes
  → Reduces scope or extends sprint

✅ DO: Use /scope-change for story modifications
  → Updates story and re-estimates
```

### DON'Ts ❌

```
PLANNING:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ DON'T: Skip planning phases
  → /brainstorm is REQUIRED
  → /create-prd is REQUIRED
  → /project-planning is REQUIRED

❌ DON'T: Start sprint without validation
  → /sprint-prerequisites will block you
  → All docs must pass 70% quality

❌ DON'T: Ignore auto-generated doc warnings
  → /doc-recovery marks docs as "AUTO-GENERATED"
  → Quality is 60% - always review

❌ DON'T: Manually edit state files
  → Use framework skills to update state
  → Manual edits can cause inconsistencies

EXECUTION:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ DON'T: Skip /start-day when resuming
  → Framework won't know current state
  → May duplicate work

❌ DON'T: Implement without agent dispatch
  → Always use /dispatch-story
  → Agent ensures code standards

❌ DON'T: Skip quality gates
  → /review-gate is REQUIRED
  → /gate-check is REQUIRED
  → Skipping = technical debt

❌ DON'T: Ignore MAX_REVISION (3)
  → Story will be escalated
  → Must fix or reject story

CHANGE MANAGEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ DON'T: Add changes without /change-request
  → Framework won't track changes
  → Sprint plan becomes inconsistent

❌ DON'T: Ignore MAX_CARRYOVER (2)
  → Story will be escalated
  → Must split, reject, or mark as debt

❌ DON'T: Overwrite existing docs without backup
  → /doc-recovery auto-backups
  → Manual overwrite = work lost
```

### Summary Table

| Action | DO | DON'T |
|--------|-----|-------|
| Planning | Complete all phases | Skip phases |
| Validation | Run /sprint-prerequisites | Start without validation |
| Resume | Use /start-day | Manually track state |
| Implementation | Use /dispatch-story | Implement without agent |
| Quality | Follow quality gates | Skip gates |
| Changes | Use /change-request | Add changes directly |
| Carryover | Monitor carryover count | Ignore carryover limit |
| Documents | Review auto-generated | Trust auto-generated |

---

## Troubleshooting

### Common Issues

```
ISSUE: Sprint blocked - missing documents
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SOLUTION:
1. Run /sprint-prerequisites to see what's missing
2. Run missing skills (e.g., /create-architecture)
3. Run /doc-validator to check quality
4. Run /sprint-prerequisites again

ISSUE: Story stuck in revision loop
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SOLUTION:
1. Framework will escalate after MAX_REVISION (3)
2. Options: Split story, reject, or reassign
3. If splitting: /scope-change to create smaller stories

ISSUE: Story keeps carryover
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SOLUTION:
1. Framework will escalate after MAX_CARRYOVER (2)
2. Options: Split story, reject, or mark as debt
3. If technical: Create spike story first

ISSUE: Change request affects multiple stories
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SOLUTION:
1. Use /change-request
2. Framework detects batch changes
3. Process all at once with combined impact

ISSUE: Document overwrite warning
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SOLUTION:
1. /doc-recovery will ask before overwrite
2. Choose: backup, merge, skip, or show diff
3. Always backup before overwrite

ISSUE: Agent dispatch conflict
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SOLUTION:
1. /dispatch-story detects multi-agent stories
2. Dispatches primary + secondary agents
3. Or splits story for separate agents
```

### Debug Commands

```bash
# Check current state
/start-day

# Validate all documents
/doc-validator

# Check sprint prerequisites
/sprint-prerequisites

# Check story status
/story-readiness

# View sprint state
/sprint-state
```

---

## Advanced Usage

### Custom Workflows

```bash
# Skip to specific phase (not recommended)
/create-architecture  # Skip planning
/sprint-orchestrator  # Skip validation

# Parallel stories (if supported)
/sprint-orchestrator --parallel

# Force override validation
/sprint-prerequisites --force
```

### Integration with Other Tools

```bash
# Export sprint data
/export-sprint --format json

# Import from Jira
/import-jira --project PROJ

# Generate reports
/generate-report --type sprint
```

### Performance Optimization

```bash
# Cache frequent queries
/cache-strategy

# Optimize slow queries
/query-optimize

# Set performance baseline
/perf-baseline
```

---

## Reference

### Skill Categories

| Category | Skills | Purpose |
|----------|--------|---------|
| Planning | /brainstorm, /create-prd, /project-planning | Project setup |
| Architecture | /create-architecture, /api-design, /database-design | System design |
| Sprint | /sprint-plan, /sprint-orchestrator | Execution |
| Quality | /review-gate, /gate-check, /qa-plan | Quality assurance |
| Change | /change-request, /sprint-replan, /scope-change | Change management |
| Operations | /backup-plan, /disaster-recovery, /monitoring | Operations |
| Compliance | /compliance-audit, /audit-trail | Compliance |

### Agent Hierarchy

```
Tier 1: Directors
  product-director, technical-director, operations-director

Tier 2: Leads
  product-manager, lead-engineer, design-lead
  data-lead, security-lead, devops-lead
  growth-lead, quality-lead, messaging-lead

Tier 3: Specialists
  Backend: go-specialist, python-specialist, rust-specialist
  Frontend: nextjs-specialist, react-specialist, vue-specialist
  Database: postgres-specialist, redis-specialist
  Messaging: kafka-specialist, rabbitmq-specialist, nats-specialist
  Cloudflare: cloudflare-specialist
  DevOps: docker-specialist, k8s-specialist, terraform-specialist
  Security: auth-engineer, security-engineer
  Data: data-engineer, ml-engineer, ai-engineer
```

### State Files

```
production/
├── session-state/
│   └── active.md          # Current session state
├── sprint/
│   ├── current.json       # Current sprint config
│   ├── state.json         # Sprint state machine
│   └── history.json       # Sprint history
├── epics/                 # Epic definitions
├── stories/               # User stories
└── project-context.json   # Project configuration
```

---

## Getting Help

```bash
# Show all available commands
/help

# Show skill details
/help /skill-name

# Show agent details
/agents/agent-name

# Check framework status
/status
```
