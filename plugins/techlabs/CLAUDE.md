# TechLabs by Bynify

Technology studio framework for Claude Code. 98 agents, 199 skills, 17 rules.

## Quick Commands

### New Project
- `/start` — Guided onboarding
- `/brainstorm` — Explore ideas
- `/choose-domain` — Pick project domain
- `/choose-stack` — Configure stack
- `/choose-frontend` — Select frontend framework
- `/choose-messaging` — Select messaging system

### Existing Project Adoption
- `/adopt-existing` — Scan existing project, generate adoption plan
- `/remap-paths` — Override path conventions to match your structure
- `/restructure-plan` — Generate phased restructure blueprint
- `/integrity-audit` — Audit code against conventions

## Agent Hierarchy

```
Tier 1 — Directors (Opus)
  product-director    technical-director    operations-director

Tier 2 — Leads (Sonnet)
  product-manager        lead-engineer           design-lead
  data-lead              security-lead           devops-lead
  growth-lead            quality-lead            messaging-lead

Tier 3 — Specialists (Sonnet/Haiku)
  80+ specialists across platform, frontend, backend, AI, data, messaging, growth, quality, devops, desktop
```

## Collaboration Protocol

**User-driven, not autonomous.**

Every task: **Question → Options → Decision → Draft → Approval**

- Ask before Write/Edit
- Show drafts before approval
- Multi-file changes need explicit approval
- No commits without user instruction

## Skills (199 total)

### Existing Project Adoption (NEW)
- `/adopt-existing` — Scan existing project, generate adoption plan
- `/remap-paths` — Override path conventions to match your structure
- `/restructure-plan` — Generate phased restructure blueprint
- `/integrity-audit` — Audit code against conventions, generate compliance report

### Standard Phases
Phase 0: Discovery — `/brainstorm`, `/market-research`, `/competitive-analysis`
Phase 1: Product — `/create-prd`, `/user-stories`, `/data-model`
Phase 2: Design — `/design-system`, `/wireframe`, `/ux-flow`
Phase 3: Architecture — `/create-architecture`, `/api-design`, `/database-design`
Phase 4-9: Build — Serverless, Messaging, Frontend, Docker, AI, Cross-domain
Phase 10-16: Data, Growth, Quality, DevOps, Desktop, Sprints, Team

## Rules (17 path-scoped)

- `path-config.md` — Path convention overrides (NEW)
- `src/serverless/**` — Edge-compatible, Workers runtime
- `src/backend/**` — Go patterns, error wrapping
- `src/frontend/**` — React patterns, a11y
- `src/auth/**` — No hardcoded secrets
- `src/messaging/**` — Idempotency, dead letters
- ...and 11 more

## Hooks (22 automated)

- Pre-commit: secrets check, TODO format
- Pre-push: protected branch, PR check
- Post-write: validate workers, docker, migration, auth, messaging
- Session: start, stop, compact, agent logging
- Adoption: detect adoption status, suggest next steps
