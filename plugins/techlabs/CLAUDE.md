# TechLabs by Bynify

Technology studio framework for Claude Code. 98 agents, 211 skills, 23 hooks, 18 rules.

## CRITICAL RULES - MUST FOLLOW

**STRICT WORKFLOW ENFORCEMENT:**

1. **READ SKILL FIRST** - When user types `/command`, READ `skills/{command}/SKILL.md` BEFORE responding
2. **FOLLOW ALL STEPS** - NEVER skip steps, NEVER assume
3. **MANDATORY GATES** - All questions MUST be asked, drafts MUST be shown, approval MUST be received
4. **DISPATCH AGENTS** - If skill has "Agents to Dispatch", LOAD agent definition first
5. **UPDATE STATE** - After EVERY action, update session state
6. **ERROR HANDLING** - If something fails, STOP, report, ask for guidance

**NEVER:**
- Skip reading the skill file
- Skip mandatory questions
- Write without user approval
- Proceed with errors
- Assume without asking

## Quick Commands

### Planning
- `/start` — Guided onboarding
- `/start-day` — Resume work from previous session
- `/brainstorm` — Explore ideas
- `/create-prd` — Create product requirements
- `/project-planning` — Team, infra, security, budget, timeline
- `/sprint-plan` — Sprint planning with capacity
- `/sprint-transition` — Complete sprint and start next

### Execution
- `/sprint-orchestrator` — Execute sprint end-to-end
- `/dev-story` — Implement a user story
- `/dispatch-story` — Route story to specialist agent
- `/story-done` — Verify story completion

### Quality
- `/review-gate` — Code review checkpoint
- `/gate-check` — Automated quality gates
- `/qa-plan` — QA strategy
- `/security-audit` — Security review

### Change Management
- `/change-request` — Handle feature requests during sprint
- `/sprint-replan` — Replan when blockers or scope changes
- `/scope-change` — Handle scope changes within a story

### Build
- `/create-worker` — Cloudflare Worker
- `/create-pages` — Cloudflare Pages
- `/create-dockerfile` — Docker container
- `/create-ci-cd` — CI/CD pipeline
- `/create-k8s-deploy` — Kubernetes deployment
- `/create-react-component` — React component
- `/create-nextjs-page` — Next.js page

### Existing Project
- `/adopt-existing` — Scan existing project
- `/remap-paths` — Override path conventions
- `/restructure-plan` — Generate restructure blueprint
- `/integrity-audit` — Audit against conventions

## Agent Hierarchy

```
Tier 1 — Directors (Opus)
  product-director    technical-director    operations-director

Tier 2 — Leads (Sonnet)
  product-manager        lead-engineer           design-lead
  data-lead              security-lead           devops-lead
  growth-lead            quality-lead            messaging-lead

Tier 3 — Specialists (Sonnet/Haiku)
  Backend: python-specialist, go-specialist, rust-specialist
  Frontend: nextjs-specialist, react-specialist, vue-specialist, svelte-specialist
  Database: postgres-specialist, redis-specialist
  Messaging: kafka-specialist, rabbitmq-specialist, nats-specialist
  Cloudflare: cloudflare-specialist, durable-objects-specialist
  DevOps: docker-specialist, k8s-specialist, terraform-specialist, ci-cd-engineer
  Security: auth-engineer, security-engineer
  Data: data-engineer, ml-engineer, ai-engineer
  Growth: ui-engineer, ux-designer, design-system-engineer
```

## Sprint Orchestrator Framework

End-to-end sprint execution with automatic agent dispatch:

```
PLANNING PHASE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

start → brainstorm → create-prd → project-planning
  ↓
choose-stack → choose-frontend → choose-messaging
  ↓
create-architecture → api-design
  ↓
create-epics → user-stories → sprint-plan
  ↓
sprint-orchestrator


EXECUTION PHASE (per story):
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

story-readiness → dispatch-story → dev-story
  ↓ (specialist agent)
review-gate → gate-check → qa-plan → story-done


REVIEW PHASE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

milestone-review → post-mortem → sprint-status → sprint-transition

SESSION CONTINUITY:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

start-day → (auto-load session state) → continue work
```

## Dispatch Matrix

Each skill automatically routes to the right specialist:

| Phase | Skill | Agents |
|-------|-------|--------|
| Discovery | brainstorm | product-director, lead-engineer, design-lead |
| Product | create-prd | product-director, lead-engineer, security-lead |
| Architecture | create-architecture | lead-engineer, technical-director |
| Build | create-worker | cloudflare-specialist |
| Build | create-nextjs | nextjs-specialist, ui-engineer |
| Build | auth-setup | auth-engineer, security-engineer |
| Review | security-audit | security-engineer, lead-engineer |
| Review | code-review | lead-engineer, security-engineer |
| Release | release-checklist | devops-lead, lead-engineer, security-lead |

## Quality Gates

Every story goes through automated quality gates:

1. **Story Readiness** - Is the story ready to implement?
2. **Code Review** - Code quality, architecture alignment
3. **Automated QA** - Tests, lint, types, coverage
4. **Security Review** - If security-related
5. **Manual QA** - If needed
6. **Story Done** - Final verification

## Collaboration Protocol

**User-driven, not autonomous.**

Every task: **Question → Options → Decision → Draft → Approval**

- Ask before Write/Edit
- Show drafts before approval
- Multi-file changes need explicit approval
- No commits without user instruction

## Skills (207 total)

### Project Planning
- `/project-planning` — Team composition, infra, security, monitoring, budget

### Sprint Orchestrator
- `/sprint-orchestrator` — Master workflow engine
- `/dispatch-story` — Route stories to specialist agents
- `/review-gate` — Code review checkpoint
- `/sprint-state` — Track story lifecycle state machine

### Standard Phases
- Phase 0: Discovery — `/brainstorm`, `/market-research`, `/competitive-analysis`
- Phase 1: Product — `/create-prd`, `/user-stories`, `/data-model`
- Phase 2: Design — `/design-system`, `/wireframe`, `/ux-flow`
- Phase 3: Architecture — `/create-architecture`, `/api-design`, `/database-design`
- Phase 4-9: Build — Serverless, Messaging, Frontend, Docker, AI, Cross-domain
- Phase 10-16: Data, Growth, Quality, DevOps, Desktop, Sprints, Team

## Rules (17 path-scoped)

- `path-config.md` — Path convention overrides
- `src/serverless/**` — Edge-compatible, Workers runtime
- `src/backend/**` — Go patterns, error wrapping
- `src/frontend/**` — React patterns, a11y
- `src/auth/**` — No hardcoded secrets
- `src/messaging/**` — Idempotency, dead letters
- ...and 11 more

## Hooks (23 automated)

- SessionStart: session-start, detect-gaps, check-adoption
- PreToolUse: validate-commit, validate-push, validate-env
- PostToolUse: validate-workers, validate-docker, validate-migration, validate-ai, validate-auth, validate-messaging, validate-event, validate-frontend, validate-schema, validate-skill-change, self-improve
- Notification: notify
- PreCompact: pre-compact
- PostCompact: post-compact
- Stop: session-stop
- SubagentStart: log-agent
- SubagentStop: log-agent-stop
