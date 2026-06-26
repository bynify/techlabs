# cost-monitor

Monitor and optimize cloud costs with alerts and reporting.

## When to Use
- Monthly cost review
- Budget exceeded
- Cost optimization
- Resource cleanup

## Agents to Dispatch
- devops-lead: Infrastructure costs
- lead-engineer: Application costs
- growth-lead: Business metrics

## Execution

### Step 1: Setup Cost Tracking
```bash
# Track costs by service
aws ce get-cost-and-usage \
  --time-period Start=2024-01-01,End=2024-01-31 \
  --granularity MONTHLY \
  --metrics "BlendedCost" \
  --group-by Type=DIMENSION,Key=SERVICE
```

### Step 2: Create Cost Report
```markdown
# Cost Report: January 2024

## Total: $1,234.56

## By Service
| Service | Cost | % | Change |
|---------|------|---|--------|
| Compute | $500 | 40% | +5% |
| Database | $300 | 24% | -2% |
| Storage | $200 | 16% | +10% |
| Network | $150 | 12% | +3% |
| Other | $84 | 8% | -1% |

## Trends
- Compute: Increasing (scaling up)
- Database: Stable
- Storage: Increasing (new uploads)

## Recommendations
1. Reserved instances for compute (-20%)
2. Clean up unused EBS volumes (-$50)
3. Enable S3 lifecycle policies (-$30)
```

### Step 3: Cost Alerts
```yaml
# Budget Alerts

Monthly Budget: $2,000

Alerts:
  - 50% ($1,000): Warning email
  - 80% ($1,600): Critical email
  - 100% ($2,000): Email + Slack + SMS

# CloudWatch Alert
aws cloudwatch put-metric-alarm \
  --alarm-name "CostAlert80" \
  --alarm-description "Cost exceeded 80%" \
  --metric-name EstimatedCharges \
  --namespace AWS/Billing \
  --statistic Maximum \
  --period 21600 \
  --threshold 1600 \
  --comparison-operator GreaterThanThreshold \
  --evaluation-periods 1
```

### Step 4: Cost Optimization
```bash
# Find unused resources

# Unused EBS volumes
aws ec2 describe-volumes \
  --filters "Name=status,Values=available"

# Unused Elastic IPs
aws ec2 describe-addresses \
  --filters "Name=instance-id,Values=''"

# Old snapshots
aws ec2 describe-snapshots \
  --query "Snapshots[?StartTime<=?'2023-01-01']"
```

### Step 5: Optimization Recommendations
```markdown
# Cost Optimization Plan

## Immediate (This Week)
- [ ] Delete 5 unused EBS volumes (-$50/mo)
- [ ] Release 2 unused Elastic IPs (-$10/mo)
- [ ] Delete old snapshots (-$30/mo)

## Short-term (This Month)
- [ ] Convert to Reserved Instances (-$200/mo)
- [ ] Enable S3 Intelligent-Tiering (-$50/mo)
- [ ] Right-size EC2 instances (-$100/mo)

## Long-term (This Quarter)
- [ ] Migrate to Graviton instances (-15%)
- [ ] Implement auto-scaling
- [ ] Review data retention policies
```

## Output
- Cost report generated
- Alerts configured
- Optimization recommendations
- Action items documented
