# TechLabs by Bynify

> 98 agents. 294 skills. One coordinated AI team for every tech domain.

A Claude Code marketplace plugin that turns your session into a full technology studio with end-to-end sprint orchestration.

## What's Included

| Category | Count | Description |
|----------|-------|-------------|
| **Agents** | 98 | Specialized subagents across 15 domains |
| **Skills** | 294 | Slash commands for every workflow phase |
| **Hooks** | 46 | Automated validation on commits, pushes, writes |
| **Rules** | 19 | Path-scoped coding standards |
| **Stack Docs** | 3 | Backend, frontend, deployment references |

## Key Features

- **Sprint Orchestrator** - End-to-end sprint execution with automatic agent dispatch
- **Document Validation** - Content quality checks before sprint starts
- **Change Management** - Handle feature requests, scope changes, replanning
- **Session Continuity** - Resume work exactly where you left off
- **Agent Dispatch** - Automatic routing to specialist agents
- **Quality Gates** - 6 checkpoints per story
- **State Machine** - Track story lifecycle from backlog to done

## Supported Domains

- SaaS Web (Next.js, React, Vue, Svelte, Angular, Astro)
- API & Microservices (Go, gRPC, REST, GraphQL)
- Event-Driven (Kafka, RabbitMQ, NATS, NSQ, SQS, Pub/Sub)
- CLI Tools (Go, Rust)
- Desktop (Tauri, Electron)
- Mobile (React Native, Expo)
- AI/ML (Python, LLMs, RAG, Embeddings)
- Data Platform (Python, dbt, Airflow, ETL)
- Infrastructure (Docker, K8s, Terraform)
- Serverless (Cloudflare Workers, Pages, D1, R2, KV)

## Sprint Orchestrator Framework

End-to-end sprint execution with automatic agent dispatch:

```
PLANNING PHASE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

start → brainstorm → create-prd → project-planning
  ↓
choose-stack → choose-frontend → choose-messaging
  ↓
create-architecture → api-design → database-design
  ↓
create-epics → user-stories → sprint-plan
  ↓
doc-validator (validate quality) → sprint-prerequisites
  ↓
sprint-orchestrator

EXECUTION PHASE (per story):
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

story-readiness → dispatch-story → dev-story
  ↓ (specialist agent)
review-gate → gate-check → qa-plan → story-done

CHANGE MANAGEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

/change-request → sprint-replan → scope-change
  ↓
sprint-transition → next sprint

REVIEW PHASE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

milestone-review → post-mortem → sprint-status
```

### Agent Dispatch

Each skill automatically routes to the right specialist:

| Phase | Skill | Agents |
|-------|-------|--------|
| Discovery | brainstorm | product-director, lead-engineer, design-lead |
| Product | create-prd | product-director, lead-engineer, security-lead |
| Architecture | create-architecture | lead-engineer, technical-director |
| Database | database-design | postgres-specialist, data-engineer |
| Build | create-worker | cloudflare-specialist |
| Build | create-nextjs | nextjs-specialist, ui-engineer |
| Security | auth-setup | auth-engineer, security-engineer |
| Review | security-audit | security-engineer, lead-engineer |
| Review | code-review | lead-engineer, security-engineer |
| Testing | api-test | api-engineer, quality-lead |
| Release | release-checklist | devops-lead, lead-engineer, security-lead |

### Quality Gates

Every story goes through automated quality gates:

1. **Story Readiness** - Is the story ready to implement?
2. **Code Review** - Code quality, architecture alignment
3. **Automated QA** - Tests, lint, types, coverage
4. **Security Review** - If security-related
5. **Manual QA** - If needed
6. **Story Done** - Final verification

### Change Management

Handle changes during sprint:

- **Feature Request** - Add to sprint or backlog
- **Bug Fix** - Fix and update scope
- **Scope Change** - Update story, re-estimate
- **Sprint Replan** - Reduce scope or extend sprint
- **Sprint Transition** - Carry over to next sprint

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

## Installation

```bash
# Add this marketplace
claude plugin marketplace add bynify/techlabs

# Install the plugin
claude plugin install techlabs@techlabs-marketplace --scope user

# Or install for specific project only
claude plugin install techlabs@techlabs-marketplace --scope project
```

## Quick Start

```bash
# New project (one command)
/new-project

# Quick sprint (one command)
/quick-sprint

# Resume work
/start-day

# Existing project
/adopt-existing
```

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

## Documentation

- **[USAGE.md](USAGE.md)** - Complete usage guide with case scenarios, workflows, and best practices
- **[plugins/techlabs/CLAUDE.md](plugins/techlabs/CLAUDE.md)** - Framework configuration and rules

## Update

```bash
claude plugin marketplace update techlabs-marketplace
claude plugin update techlabs
```

## License

MIT
