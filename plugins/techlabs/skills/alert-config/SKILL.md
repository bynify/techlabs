# alert-config

Configure monitoring alerts with escalation and notification channels.

## When to Use
- Production monitoring setup
- Alert rule creation
- Incident escalation
- On-call configuration

## Agents to Dispatch
- devops-lead: Alert infrastructure
- lead-engineer: Application alerts
- security-lead: Security alerts

## Execution

### Step 1: Define Alert Rules
```yaml
# Alert Categories

Application:
  - High error rate (> 1%)
  - High latency (P95 > 1s)
  - Memory usage (> 80%)
  - CPU usage (> 80%)

Infrastructure:
  - Service down
  - Database connection pool exhausted
  - Disk space low (< 10%)
  - High network latency

Security:
  - Failed login attempts (> 10/min)
  - Unauthorized access
  - Suspicious activity
  - Certificate expiration (< 30 days)

Business:
  - Conversion rate drop
  - Revenue anomaly
  - User signup drop
```

### Step 2: Create Alert Rules
```yaml
# prometheus/alerts/app.yml
groups:
  - name: application
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.01
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High error rate: {{ $value }}%"
          
      - alert: HighLatency
        expr: histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) > 1
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "P95 latency > 1s"
          
      - alert: ServiceDown
        expr: up == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Service {{ $labels.instance }} is down"
```

### Step 3: Configure Notification Channels
```yaml
# alertmanager/config.yml
global:
  resolve_timeout: 5m

route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 10s
  repeat_interval: 1h
  receiver: 'webhook'
  
  routes:
    - match:
        severity: critical
      receiver: 'pagerduty'
      
    - match:
        severity: warning
      receiver: 'slack'

receivers:
  - name: 'slack'
    slack_configs:
      - api_url: 'https://hooks.slack.com/services/xxx'
        channel: '#alerts'
        title: '{{ .GroupLabels.alertname }}'
        text: '{{ .CommonAnnotations.summary }}'
        
  - name: 'pagerduty'
    pagerduty_configs:
      - service_key: 'xxx'
        
  - name: 'email'
    email_configs:
      - to: 'team@example.com'
        from: 'alerts@example.com'
        smarthost: 'smtp.example.com:587'
```

### Step 4: Escalation Policy
```markdown
# Escalation Policy

## Severity Levels
| Level | Response Time | Escalation |
|-------|---------------|------------|
| P0 | 15 min | Immediate page |
| P1 | 1 hour | Slack + email |
| P2 | 4 hours | Email |
| P3 | 24 hours | Ticket |

## On-Call Rotation
- Week 1: Engineer A
- Week 2: Engineer B
- Week 3: Engineer C

## Escalation Path
1. On-call engineer (15 min)
2. Team lead (30 min)
3. DevOps lead (1 hour)
4. CTO (2 hours)
```

### Step 5: Test Alerts
```bash
# Test alert rule
curl -X POST http://localhost:9093/api/v1/alerts \
  -H "Content-Type: application/json" \
  -d '[{
    "labels": {
      "alertname": "TestAlert",
      "severity": "warning"
    },
    "annotations": {
      "summary": "Test alert"
    }
  }]'
```

## Output
- Alert rules created
- Notification channels configured
- Escalation policy defined
- On-call rotation set
- Alerts tested
