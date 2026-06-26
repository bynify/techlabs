# deployment-strategy

Define deployment workflow and strategy during project planning.

## When to Use
- Project planning phase
- Architecture decisions
- CI/CD setup
- Release strategy

## Agents to Dispatch
- devops-lead: Deployment strategy
- lead-engineer: Technical feasibility
- product-manager: Business requirements

## Questions to Ask

```
DEPLOYMENT STRATEGY QUESTIONS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ENVIRONMENT STRATEGY:
1. How many environments?
   - Dev → Staging → Production
   - Dev → Production (direct)
   - Dev → Staging → Pre-prod → Production

2. Deployment frequency?
   - Every sprint (bi-weekly)
   - Weekly
   - Continuous (on merge to main)
   - On-demand

3. Deployment approach?
   - Blue-Green (zero downtime)
   - Rolling (gradual rollout)
   - Canary (10% → 50% → 100%)
   - Big Bang (all at once)

4. Rollback strategy?
   - Automatic rollback on failure
   - Manual rollback
   - Keep previous version running

5. Feature flags?
   - Use feature flags for gradual rollout
   - Use for A/B testing
   - Use for quick disable

6. Database migrations?
   - Zero-downtime migrations
   - Downtime allowed
   - Backward compatible

7. Monitoring during deployment?
   - Real-time metrics
   - Error rate monitoring
   - Performance monitoring
```

## Execution

### Step 1: Ask Deployment Questions
```markdown
# Deployment Strategy Questions

## Environment Setup
1. How many environments do you need?
   - [ ] Dev + Production
   - [ ] Dev + Staging + Production
   - [ ] Dev + Staging + Pre-prod + Production

## Deployment Frequency
2. When do you want to deploy?
   - [ ] Every sprint (bi-weekly)
   - [ ] Weekly
   - [ ] Continuous (on merge)
   - [ ] On-demand

## Deployment Approach
3. How do you want to deploy?
   - [ ] Blue-Green (zero downtime)
   - [ ] Rolling (gradual)
   - [ ] Canary (percentage-based)
   - [ ] Big Bang (all at once)

## Rollback Strategy
4. What's your rollback plan?
   - [ ] Automatic on error rate > 5%
   - [ ] Manual trigger
   - [ ] Keep previous version for 24h

## Feature Flags
5. Do you want feature flags?
   - [ ] Yes, for gradual rollout
   - [ ] Yes, for A/B testing
   - [ ] No, deploy all at once

## Database Migrations
6. How to handle migrations?
   - [ ] Zero-downtime (backward compatible)
   - [ ] Downtime allowed (maintenance window)
   - [ ] Blue-green database swap

## Monitoring
7. What to monitor during deployment?
   - [ ] Error rate
   - [ ] Response time
   - [ ] CPU/Memory
   - [ ] Custom metrics
```

### Step 2: Create Deployment Strategy
```markdown
# Deployment Strategy: {project}

## Environments

| Environment | Purpose | Branch | Auto-deploy |
|-------------|---------|--------|-------------|
| Development | Local dev | feature/* | No |
| Staging | Testing | develop | Yes |
| Production | Live | main | Manual |

## Deployment Flow

```
Developer → feature branch → PR → Review
    ↓
Merge to develop → Auto-deploy to Staging
    ↓
QA Testing → Approval
    ↓
Merge to main → Manual trigger → Deploy to Production
```

## Deployment Approach: Blue-Green

```
BLUE (current) → GREEN (new)
    ↓
Deploy to Green
    ↓
Test Green
    ↓
Switch traffic to Green
    ↓
Keep Blue for 24h (rollback)
    ↓
Decommission Blue
```

## Rollback Strategy

```
IF error_rate > 5%:
  → Automatic rollback to previous version
  → Alert team
  → Investigate

IF manual rollback:
  → Trigger rollback
  → Verify
  → Communicate
```

## Feature Flags

```typescript
// Feature flag configuration
const featureFlags = {
  'new-dashboard': {
    enabled: true,
    rollout: 50,  // 50% of users
    startDate: '2024-01-15',
    endDate: '2024-02-15'
  },
  'experimental-api': {
    enabled: false,
    allowedUsers: ['beta-testers']
  }
};
```

## Database Migrations

```
ZERO-DOWNTIME APPROACH:

1. Add new column (nullable)
2. Deploy code that writes to new column
3. Backfill existing data
4. Deploy code that reads from new column
5. Add NOT NULL constraint
6. Remove old column (next release)
```

## Monitoring During Deployment

```
CHECK:
- [ ] Error rate < 1%
- [ ] Response time < 500ms
- [ ] CPU < 80%
- [ ] Memory < 80%
- [ ] No new errors in logs

IF ANY CHECK FAILS:
  → Automatic rollback
  → Alert team
```
```

### Step 3: Create CI/CD Pipeline
```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm test
      - run: npm run lint

  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm run build

  deploy-staging:
    needs: build
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/checkout@v4
      - run: npm run deploy:staging

  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      - run: npm run deploy:production
```

## Output
- Deployment strategy defined
- Environments configured
- CI/CD pipeline created
- Rollback plan documented
- Monitoring configured
