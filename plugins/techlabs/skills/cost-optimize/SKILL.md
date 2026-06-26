# cost-optimize

Optimize cloud costs with resource right-sizing and cleanup.

## When to Use
- Monthly cost review
- Resource cleanup
- Performance optimization
- Budget reduction

## Execution

### Step 1: Analyze Costs
```bash
# Get cost breakdown
aws ce get-cost-and-usage \
  --time-period Start=2024-01-01,End=2024-01-31 \
  --granularity MONTHLY \
  --metrics "BlendedCost" \
  --group-by Type=DIMENSION,Key=SERVICE
```

### Step 2: Find Waste
```bash
# Unused resources
aws ec2 describe-volumes --filters "Name=status,Values=available"
aws ec2 describe-addresses --filters "Name=instance-id,Values=''"
aws ec2 describe-snapshots --owner-ids self
```

### Step 3: Right-Size Resources
```
RECOMMENDATIONS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EC2:
- Downsize underutilized instances
- Use Spot instances for batch jobs
- Purchase Reserved Instances

Database:
- Right-size RDS instances
- Enable auto-scaling
- Use Aurora Serverless

Storage:
- Delete old EBS volumes
- Enable S3 lifecycle policies
- Archive old data to Glacier
```

### Step 4: Generate Recommendations
```markdown
# Cost Optimization Report

## Savings Opportunities
| Opportunity | Monthly Savings | Effort |
|-------------|-----------------|--------|
| Delete unused volumes | $50 | Low |
| Reserved Instances | $200 | Medium |
| Right-size instances | $100 | Medium |
| S3 lifecycle | $30 | Low |
| **Total** | **$380** | |

## Action Items
1. [ ] Delete 5 unused EBS volumes
2. [ ] Purchase RI for t3.medium instances
3. [ ] Downsize r5.large to t3.large
4. [ ] Enable S3 Intelligent-Tiering
```

## Output
- Cost analysis
- Waste identified
- Recommendations generated
- Action items created
