# disaster-recovery

Create disaster recovery plan with failover procedures.

## When to Use
- Production deployment
- Business continuity planning
- Compliance requirements
- Critical systems

## Agents to Dispatch
- devops-lead: Infrastructure DR
- lead-engineer: Application DR
- security-lead: Data protection

## Execution

### Step 1: Assess Critical Systems
```
IDENTIFY:
1. What systems are critical?
2. What's the maximum downtime?
3. What's the data loss tolerance?
4. What's the recovery priority?

CLASSIFY:
- Tier 1: Critical (< 1 hour RTO)
- Tier 2: Important (< 4 hours RTO)
- Tier 3: Standard (< 24 hours RTO)
```

### Step 2: Create DR Plan
```markdown
# Disaster Recovery Plan

## Tier 1: Critical Systems
| System | RTO | RPO | Strategy |
|--------|-----|-----|----------|
| API | 1h | 1h | Multi-region |
| Database | 1h | 0 | Multi-AZ, replication |
| Auth | 1h | 0 | Active-passive |

## Tier 2: Important Systems
| System | RTO | RPO | Strategy |
|--------|-----|-----|----------|
| Frontend | 4h | 1h | CDN, static |
| Cache | 4h | 0 | Redis Sentinel |
| Queue | 4h | 1h | Multi-broker |

## Tier 3: Standard Systems
| System | RTO | RPO | Strategy |
|--------|-----|-----|----------|
| Monitoring | 24h | 24h | Rebuild |
| Logging | 24h | 24h | Rebuild |
| Analytics | 24h | 24h | Rebuild |
```

### Step 3: Failover Procedures
```yaml
# Database Failover

## Automatic Failover (Multi-AZ)
```
Primary DB fails
    ↓
Automatic failover to standby
    ↓
DNS update (if needed)
    ↓
Application reconnects
    ↓
Verify data consistency
```

## Manual Failover
```bash
# Promote standby to primary
aws rds promote-read-replica \
  --db-instance-identifier mydb-standby

# Update application connection
export DATABASE_URL="postgresql://new-primary:5432/myapp"

# Verify connectivity
psql $DATABASE_URL -c "SELECT 1"
```
```

### Step 4: Failover Script
```bash
#!/bin/bash
# dr-failover.sh

echo "=== DISASTER RECOVERY FAILOVER ==="

# 1. Stop traffic to primary
echo "Stopping traffic to primary..."
# Update load balancer, DNS, etc.

# 2. Promote database
echo "Promoting database replica..."
aws rds promote-read-replica \
  --db-instance-identifier $DB_REPLICA

# 3. Wait for promotion
sleep 60

# 4. Update application
echo "Updating application config..."
# Update connection strings

# 5. Start application
echo "Starting application..."
# Deploy/start services

# 6. Verify
echo "Verifying..."
curl -f https://api.example.com/health

echo "Failover complete!"
```

### Step 5: DR Testing
```markdown
# DR Test Plan

## Test Schedule
- Monthly: Tabletop exercise
- Quarterly: Component failover
- Annual: Full DR drill

## Test Scenarios
1. Database failure
2. Region outage
3. Network partition
4. Application crash

## Success Criteria
- RTO met for each tier
- No data loss (RPO = 0)
- Application fully functional
- Monitoring restored
```

### Step 6: Documentation
```markdown
# DR Runbook

## Emergency Contacts
- DevOps Lead: [phone]
- DBA: [phone]
- Security: [phone]

## Escalation Path
1. On-call engineer
2. DevOps lead
3. CTO

## Communication
- Slack: #incident-response
- Status: status.example.com
- Email: alerts@example.com
```

## Output
- DR plan documented
- Failover procedures created
- Failover scripts tested
- DR test schedule defined
- Emergency contacts listed
