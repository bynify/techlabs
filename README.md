# TechLabs by Bynify

> 98 agents. 207 skills. One coordinated AI team for every tech domain.

A Claude Code marketplace plugin that turns your session into a full technology studio.

## What's Included

| Category | Count | Description |
|----------|-------|-------------|
| **Agents** | 98 | Specialized subagents across 15 domains |
| **Skills** | 207 | Slash commands for every workflow phase |
| **Hooks** | 23 | Automated validation on commits, pushes, writes |
| **Rules** | 17 | Path-scoped coding standards |

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
create-architecture → api-design
  ↓
sprint-plan → sprint-orchestrator


EXECUTION PHASE (per story):
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

story-readiness → dispatch-story → dev-story
  ↓ (specialist agent)
review-gate → gate-check → qa-plan → story-done


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
| Build | create-worker | cloudflare-specialist |
| Build | create-nextjs | nextjs-specialist, ui-engineer |
| Security | auth-setup | auth-engineer, security-engineer |
| Review | security-audit | security-engineer, lead-engineer |
| Review | code-review | lead-engineer, security-engineer |
| Release | release-checklist | devops-lead, lead-engineer, security-lead |

### Quality Gates

Every story goes through automated quality gates:

1. **Story Readiness** - Is the story ready to implement?
2. **Code Review** - Code quality, architecture alignment
3. **Automated QA** - Tests, lint, types, coverage
4. **Security Review** - If security-related
5. **Manual QA** - If needed
6. **Story Done** - Final verification

## Existing Project Support

Bring your existing project into TechLabs without restructuring:

```bash
# Scan existing project, generate adoption plan
/adopt-existing

# Override path conventions to match your structure
/remap-paths

# Generate phased restructure blueprint
/restructure-plan

# Audit code against conventions
/integrity-audit
```

Works with Next.js app router, Go monoliths, Express + React, and any structure.

## Quick Commands

### Planning
```bash
/start                    # Guided onboarding
/brainstorm               # Explore ideas
/create-prd               # Create product requirements
/project-planning         # Team, infra, security, budget
/sprint-plan              # Sprint planning
```

### Execution
```bash
/sprint-orchestrator      # Execute sprint end-to-end
/dev-story                # Implement a story
/dispatch-story           # Route to specialist agent
```

### Quality
```bash
/review-gate              # Code review checkpoint
/gate-check               # Quality gate checks
/qa-plan                  # QA strategy
/story-done               # Final verification
```

### Infrastructure
```bash
/create-worker            # Cloudflare Worker
/create-pages             # Cloudflare Pages
/create-dockerfile        # Docker container
/create-ci-cd             # CI/CD pipeline
/create-k8s-deploy        # Kubernetes deployment
```

## Installation

```bash
# Add this marketplace
claude plugin marketplace add bynify/techlabs

# Install the plugin
claude plugin install techlabs@techlabs-marketplace --scope user

# Or install for specific project only
claude plugin install techlabs@techlabs-marketplace --scope project
```

## Update

```bash
claude plugin marketplace update techlabs-marketplace
claude plugin update techlabs
```

## License

MIT
