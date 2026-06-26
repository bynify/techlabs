# project-planning

Comprehensive project planning that covers team, infrastructure, security, monitoring, and budget before sprint execution.

## When to Use
- New project kickoff
- Pre-sprint planning
- Infrastructure decisions
- Team assembly
- Budget planning

## Planning Phases

```
PLANNING FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  PHASE 1: PROJECT DEFINITION
  ┌──────────┐ ┌──────────┐ ┌──────────┐
  │start     │→│brainstorm│→│create-prd│
  └──────────┘ └──────────┘ └──────────┘
       ↓
  PHASE 2: STACK DECISIONS
  ┌──────────┐ ┌──────────┐ ┌──────────┐
  │choose-   │→│choose-   │→│choose-   │
  │domain    │ │stack     │ │frontend  │
  └──────────┘ └──────────┘ └──────────┘
       ↓
  PHASE 3: PROJECT PLANNING (NEW - THIS SKILL)
  ┌──────────────────────────────────────────┐
  │         project-planning                 │
  │  - Team composition                      │
  │  - Infrastructure planning               │
  │  - Security requirements                 │
  │  - Monitoring setup                      │
  │  - Budget estimation                     │
  │  - Timeline planning                     │
  └──────────────────────────────────────────┘
       ↓
  PHASE 4: ARCHITECTURE
  ┌──────────┐ ┌──────────┐
  │create-   │→│api-design│
  │architecture│ └──────────┘
  └──────────┘
       ↓
  PHASE 5: SPRINT EXECUTION
  ┌──────────┐ ┌──────────┐ ┌──────────┐
  │sprint-   │→│sprint-   │→│milestone-│
  │plan      │ │orchestrator│ │review   │
  └──────────┘ └──────────┘ └──────────┘
```

## Execution

### Step 1: Gather Project Context
```
READ:
- docs/PRD.md (requirements)
- docs/stack-reference/ (selected stack)
- production/session-state/active.md

EXTRACT:
- Project type (SaaS, API, CLI, Mobile, etc.)
- Selected stack (language, framework, database)
- Selected frontend (if applicable)
- Selected messaging (if applicable)
- Current stage (idea, design, implementation)
```

### Step 1b: Create Project Lead (MANDATORY)
```
⚠️ ENFORCEMENT: Project lead required for all projects

RUN: /create-project-lead

WITH:
- project: {project-name}
- domain: {domain}
- stack: {tech-stack}

RESULT:
- agents/{project-name}-lead.md created
- Lead can coordinate all work
- Lead approves scope changes
- Lead updates docs

LEAD RESPONSIBILITIES:
- Scope management
- Documentation updates
- Timeline monitoring
- Agent coordination
- Stakeholder communication
```

### Step 2: Team Composition Planning
```
QUESTIONS:

1. Current team size?
   - Solo (just you)
   - Small (2-3 people)
   - Medium (4-6 people)
   - Large (7+ people)

2. Team roles needed? (suggest based on stack)

   PROJECT LEAD (CREATED):
   - [ ] {project-name}-lead

   BACKEND:
   - [ ] Go specialist (if Go)
   - [ ] Python specialist (if Python)
   - [ ] Rust specialist (if Rust)
   - [ ] API engineer (always)

   FRONTEND (if applicable):
   - [ ] Next.js specialist (if Next.js)
   - [ ] React specialist (if React)
   - [ ] Vue specialist (if Vue)
   - [ ] Svelte specialist (if Svelte)
   - [ ] Mobile specialist (if mobile app)

   DATABASE:
   - [ ] PostgreSQL specialist (if PostgreSQL)
   - [ ] Redis specialist (if Redis)

   MESSAGING (if applicable):
   - [ ] Kafka specialist (if Kafka)
   - [ ] RabbitMQ specialist (if RabbitMQ)
   - [ ] NATS specialist (if NATS)

   INFRASTRUCTURE:
   - [ ] Docker specialist
   - [ ] Kubernetes specialist (if k8s)
   - [ ] Terraform specialist (if IaC)
   - [ ] CI/CD engineer

   SECURITY:
   - [ ] Auth engineer (if auth features)
   - [ ] Security engineer (if sensitive data)

   DATA (if applicable):
   - [ ] Data engineer (if ETL/analytics)
   - [ ] ML engineer (if AI features)

3. Skill gaps?
   - What skills are missing?
   - Need to hire/contract?
   - Training needed?
```

### Step 3: Infrastructure Planning
```
QUESTIONS:

1. Hosting provider?
   - [ ] AWS (Amazon Web Services)
   - [ ] GCP (Google Cloud Platform)
   - [ ] Azure (Microsoft Azure)
   - [ ] Cloudflare (Workers, Pages)
   - [ ] DigitalOcean
   - [ ] Vercel (frontend only)
   - [ ] Self-hosted

2. Deployment target?
   - [ ] Serverless (Cloudflare Workers, AWS Lambda)
   - [ ] Containers (Docker, Kubernetes)
   - [ ] VMs (EC2, Droplets)
   - [ ] Managed (Heroku, Railway)

3. Database hosting?
   - [ ] Managed (AWS RDS, GCP Cloud SQL, PlanetScale)
   - [ ] Self-hosted (Docker, VM)
   - [ ] Serverless (D1, Neon, Turso)

4. CDN?
   - [ ] Cloudflare
   - [ ] AWS CloudFront
   - [ ] Fastly
   - [ ] None (static only)

5. Region?
   - [ ] US East (Virginia)
   - [ ] US West (Oregon)
   - [ ] EU (Frankfurt, Ireland)
   - [ ] Asia (Singapore, Tokyo)
   - [ ] Multi-region

6. Environment strategy?
   - [ ] Development (local)
   - [ ] Staging (pre-production)
   - [ ] Production (live)
   - [ ] Preview deployments
```

### Step 4: Security Requirements
```
QUESTIONS:

1. Authentication?
   - [ ] Email/password
   - [ ] OAuth (Google, GitHub, etc.)
   - [ ] SAML/SSO (enterprise)
   - [ ] Magic links
   - [ ] Passkeys/WebAuthn

2. Authorization?
   - [ ] Role-based (RBAC)
   - [ ] Attribute-based (ABAC)
   - [ ] Resource-based
   - [ ] Multi-tenant

3. Data sensitivity?
   - [ ] PII (names, emails, addresses)
   - [ ] Financial (payments, billing)
   - [ ] Health (HIPAA)
   - [ ] Education (FERPA)
   - [ ] None (public data)

4. Compliance requirements?
   - [ ] GDPR (EU users)
   - [ ] CCPA (California users)
   - [ ] SOC 2 (enterprise)
   - [ ] PCI DSS (payments)
   - [ ] HIPAA (health)
   - [ ] None

5. Security features?
   - [ ] Rate limiting
   - [ ] Input validation
   - [ ] SQL injection prevention
   - [ ] XSS prevention
   - [ ] CSRF protection
   - [ ] Secrets management
   - [ ] Encryption at rest
   - [ ] Encryption in transit
   - [ ] Audit logging
```

### Step 5: Monitoring & Observability
```
QUESTIONS:

1. Monitoring stack?
   - [ ] Cloudflare Analytics (if Workers)
   - [ ] AWS CloudWatch (if AWS)
   - [ ] GCP Cloud Monitoring (if GCP)
   - [ ] Prometheus + Grafana (self-hosted)
   - [ ] Datadog (premium)
   - [ ] New Relic (premium)
   - [ ] Sentry (error tracking)

2. Logging?
   - [ ] Cloudflare Logs (if Workers)
   - [ ] AWS CloudWatch Logs (if AWS)
   - [ ] GCP Cloud Logging (if GCP)
   - [ ] ELK Stack (self-hosted)
   - [ ] Loki (self-hosted)
   - [ ] Papertrail (managed)

3. Alerting?
   - [ ] PagerDuty
   - [ ] OpsGenie
   - [ ] Slack notifications
   - [ ] Email alerts
   - [ ] SMS alerts

4. Metrics to track?
   - [ ] Uptime (target: 99.9%)
   - [ ] Error rate (target: <0.1%)
   - [ ] Latency P50/P95/P99
   - [ ] Request rate
   - [ ] Database queries
   - [ ] Memory usage
   - [ ] CPU usage

5. SLOs (Service Level Objectives)?
   - [ ] Availability: ___%
   - [ ] Latency P95: ___ms
   - [ ] Error rate: <___%
   - [ ] Throughput: ___ req/s
```

### Step 6: Budget Planning
```
QUESTIONS:

1. Monthly budget range?
   - [ ] Free tier only ($0)
   - [ ] Starter ($1-50/month)
   - [ ] Growth ($50-500/month)
   - [ ] Scale ($500-2000/month)
   - [ ] Enterprise ($2000+/month)

2. Cost allocation?
   - Hosting: $___/month
   - Database: $___/month
   - CDN: $___/month
   - Monitoring: $___/month
   - Third-party APIs: $___/month
   - Total: $___/month

3. Cost optimization?
   - [ ] Use free tiers where possible
   - [ ] Reserved instances for predictable loads
   - [ ] Spot instances for non-critical
   - [ ] Auto-scaling for variable loads

4. Billing alerts?
   - [ ] 50% of budget
   - [ ] 80% of budget
   - [ ] 100% of budget
   - [ ] Unusual spike detection
```

### Step 6b: Deployment Strategy (MANDATORY)
```
⚠️ ASK ABOUT DEPLOYMENT WORKFLOW

QUESTIONS:

1. Environment setup?
   - [ ] Dev + Production
   - [ ] Dev + Staging + Production
   - [ ] Dev + Staging + Pre-prod + Production

2. Deployment frequency?
   - [ ] Every sprint (bi-weekly)
   - [ ] Weekly
   - [ ] Continuous (on merge)
   - [ ] On-demand

3. Deployment approach?
   - [ ] Blue-Green (zero downtime)
   - [ ] Rolling (gradual)
   - [ ] Canary (percentage-based)
   - [ ] Big Bang (all at once)

4. Staging strategy?
   - [ ] Every sprint → staging
   - [ ] Weekly → staging
   - [ ] On merge → staging

5. Production deployment?
   - [ ] Manual approval required
   - [ ] Automated after QA
   - [ ] Scheduled releases

6. Rollback strategy?
   - [ ] Automatic on error
   - [ ] Manual trigger
   - [ ] Keep previous version 24h

RUN: /deployment-strategy
```

### Step 7: Timeline Planning
```
QUESTIONS:

1. Launch deadline?
   - [ ] Soft launch (beta)
   - [ ] Public launch (GA)
   - [ ] Enterprise launch

2. Milestones?
   | Milestone | Date | Deliverable |
   |-----------|------|-------------|
   | MVP | YYYY-MM-DD | Core features |
   | Beta | YYYY-MM-DD | Feature complete |
   | GA | YYYY-MM-DD | Production ready |

3. Sprint cadence?
   - [ ] 1 week sprints
   - [ ] 2 week sprints (recommended)
   - [ ] 3 week sprints
   - [ ] Custom: ___

4. Release strategy?
   - [ ] Continuous deployment
   - [ ] Weekly releases
   - [ ] Bi-weekly releases
   - [ ] Feature flags
```

### Step 8: Generate Project Plan
```markdown
# Project Plan: [Project Name]

## Overview
- **Type:** SaaS
- **Stack:** Go + Next.js + PostgreSQL
- **Team:** 4 developers
- **Timeline:** 12 weeks
- **Budget:** $500/month

## Team Composition

| Role | Agent | Responsibilities |
|------|-------|-----------------|
| Backend Lead | go-specialist | API, services, database |
| Frontend Lead | nextjs-specialist | UI, components, pages |
| DevOps | docker-specialist | CI/CD, deployment |
| Security | auth-engineer | Auth, security |

## Infrastructure

| Component | Service | Region | Cost |
|-----------|---------|--------|------|
| API | Cloudflare Workers | Global | $5/mo |
| Frontend | Cloudflare Pages | Global | Free |
| Database | Cloudflare D1 | Global | $5/mo |
| Cache | Cloudflare KV | Global | Free |
| Monitoring | Cloudflare Analytics | Global | Free |

## Security

- **Auth:** OAuth (Google, GitHub) + Email/Password
- **Authorization:** RBAC with roles
- **Data:** PII encrypted at rest
- **Compliance:** GDPR compliant

## Monitoring

| Metric | Target | Alert |
|--------|--------|-------|
| Uptime | 99.9% | <99.5% |
| Error Rate | <0.1% | >1% |
| Latency P95 | <500ms | >1s |

## Budget

| Category | Monthly | Annual |
|----------|---------|--------|
| Hosting | $10 | $120 |
| Database | $5 | $60 |
| Monitoring | $0 | $0 |
| Total | $15 | $180 |

## Milestones

| Milestone | Date | Stories |
|-----------|------|---------|
| Sprint 1 | Jan 29 | Auth, API setup |
| Sprint 2 | Feb 12 | Dashboard, CRUD |
| Sprint 3 | Feb 26 | Features complete |
| Beta | Mar 10 | Feature freeze |
| GA | Mar 24 | Production launch |

## Next Steps
1. Review and approve plan
2. Run `/sprint-plan` to create first sprint
3. Execute with `/sprint-orchestrator`
```

### Step 9: Save Project Context
```javascript
// production/session-state/active.md
{
  "sessionId": "session-2024-01-15",
  "detectedPhase": "planning",
  "lastStep": "project-planning",
  "nextStep": "choose-stack",
  "progress": {
    "brainstorm": "done",
    "create-prd": "done",
    "project-planning": "done",
    "choose-stack": "pending",
    "choose-frontend": "pending",
    "create-architecture": "pending",
    "create-epics": "pending",
    "user-stories": "pending",
    "sprint-plan": "pending"
  }
}

// production/project-context.json
{
  "project": {
    "name": "My SaaS",
    "type": "saas",
    "stage": "idea",
    "createdAt": "2024-01-15"
  },
  "team": {
    "size": 4,
    "roles": [
      { "role": "backend", "agent": "go-specialist", "assigned": true },
      { "role": "frontend", "agent": "nextjs-specialist", "assigned": true },
      { "role": "devops", "agent": "docker-specialist", "assigned": true },
      { "role": "security", "agent": "auth-engineer", "assigned": false }
    ]
  },
  "infrastructure": {
    "provider": "cloudflare",
    "services": {
      "compute": "workers",
      "frontend": "pages",
      "database": "d1",
      "cache": "kv",
      "storage": "r2"
    },
    "regions": ["global"],
    "environments": ["dev", "staging", "production"]
  },
  "security": {
    "auth": ["oauth", "email"],
    "authorization": "rbac",
    "dataSensitivity": "pii",
    "compliance": ["gdpr"]
  },
  "monitoring": {
    "stack": "cloudflare",
    "metrics": ["uptime", "errors", "latency"],
    "alerts": ["slack", "email"],
    "slo": {
      "availability": 99.9,
      "latencyP95": 500,
      "errorRate": 0.1
    }
  },
  "budget": {
    "monthly": 500,
    "allocation": {
      "hosting": 10,
      "database": 5,
      "monitoring": 0,
      "total": 15
    },
    "alerts": [50, 80, 100]
  },
  "timeline": {
    "sprintLength": 14,
    "milestones": [
      { "name": "Sprint 1", "date": "2024-01-29" },
      { "name": "Sprint 2", "date": "2024-02-12" },
      { "name": "Beta", "date": "2024-03-10" },
      { "name": "GA", "date": "2024-03-24" }
    ]
  }
}
```

## Output
- Team composition defined
- Infrastructure planned
- Security requirements documented
- Monitoring setup planned
- Budget estimated
- Timeline created
- Project context saved for sprint planning
