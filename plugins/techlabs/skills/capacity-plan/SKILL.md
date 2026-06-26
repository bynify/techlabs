# capacity-plan

Capacity planning for infrastructure scaling.

## When to Use
- Pre-launch planning
- Growth forecasting
- Infrastructure sizing
- Cost estimation

## Execution

### Step 1: Estimate Load
```
QUESTIONS:
1. Expected daily active users (DAU)?
2. Expected requests per second (RPS)?
3. Expected data storage growth?
4. Expected peak traffic times?
```

### Step 2: Calculate Resources
```
FORMULAS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Web Servers:
- 1 server per 1000 concurrent users
- 1 server per 500 RPS

Database:
- 1 connection per 50 concurrent users
- 100MB storage per 1000 users

Cache:
- 1GB RAM per 10,000 sessions
- 100MB per 100,000 items

Storage:
- 1GB per 100,000 users (profile data)
- 10GB per 100,000 users (uploads)
```

### Step 3: Create Capacity Plan
```markdown
# Capacity Plan

## Current Capacity
| Resource | Current | Usage | % |
|----------|---------|-------|---|
| Web servers | 2 | 1.2 | 60% |
| Database | 1 | 0.8 | 80% |
| Cache | 1GB | 0.6GB | 60% |

## Growth Projection (6 months)
| Metric | Current | Projected | Growth |
|--------|---------|-----------|--------|
| DAU | 10,000 | 50,000 | 400% |
| RPS | 100 | 500 | 400% |
| Storage | 100GB | 500GB | 400% |

## Scaling Recommendations
| Resource | Current | Required | Action |
|----------|---------|----------|--------|
| Web servers | 2 | 4 | Scale horizontally |
| Database | 1 | 2 | Add read replica |
| Cache | 1GB | 4GB | Scale up |
| Storage | 100GB | 500GB | Add capacity |

## Timeline
- Month 1-2: Current capacity OK
- Month 3: Scale web servers
- Month 4: Scale database
- Month 5-6: Full scale
```

### Step 4: Auto-Scaling Rules
```yaml
# Auto-scaling configuration
autoscaling:
  web:
    min: 2
    max: 10
    scale_up:
      cpu: 70%
      memory: 75%
    scale_down:
      cpu: 30%
      memory: 40%
    
  database:
    min: 1
    max: 5
    scale_up:
      connections: 80%
      cpu: 70%
```

## Output
- Load estimated
- Resources calculated
- Capacity plan created
- Auto-scaling configured
- Timeline defined
