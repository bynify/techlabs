# TechLabs by Bynify

> 98 agents. 199 skills. One coordinated AI team for every tech domain.

A Claude Code marketplace plugin that turns your session into a full technology studio.

## What's Included

| Category | Count | Description |
|----------|-------|-------------|
| **Agents** | 98 | Specialized subagents across 15 domains |
| **Skills** | 199 | Slash commands for every workflow phase |
| **Hooks** | 21 | Automated validation on commits, pushes, writes |
| **Rules** | 17 | Path-scoped coding standards |

## Supported Domains

- SaaS Web (Next.js, React, Vue, Svelte)
- API & Microservices (Go, gRPC, REST, GraphQL)
- Event-Driven (Kafka, RabbitMQ, NATS, NSQ)
- CLI Tools (Go, Rust)
- Desktop (Tauri, Electron)
- Mobile (React Native, Expo)
- AI/ML (Python, LLMs, RAG)
- Data Platform (Python, dbt, Airflow)
- Infrastructure (Docker, K8s, Terraform)

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
