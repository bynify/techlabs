# TechLabs by Bynify

> 98 agents. 195 skills. One coordinated AI team for every tech domain.

A Claude Code marketplace plugin that turns your session into a full technology studio.

## What's Included

| Category | Count | Description |
|----------|-------|-------------|
| **Agents** | 98 | Specialized subagents across 15 domains |
| **Skills** | 195 | Slash commands for every workflow phase |
| **Hooks** | 21 | Automated validation on commits, pushes, writes |
| **Rules** | 16 | Path-scoped coding standards |

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

## Installation

```bash
# Add this marketplace
claude plugin marketplace add bynify/techlabs

# Install the plugin
claude plugin install techlabs@techlabs --scope user

# Or install for specific project only
claude plugin install techlabs@techlabs --scope project
```

## Update

```bash
claude plugin marketplace update techlabs
claude plugin update techlabs
```

## License

MIT
