# monitoring-setup

Setup complete monitoring stack: metrics, alerts, logs, uptime.

## When to Use
- Production deployment
- Monitoring setup
- Alert configuration
- Observability stack

## What This Does

Chains 4 monitoring skills:

```
FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STEP 1: /create-monitoring
  → Prometheus metrics
  → Grafana dashboards
  → Alert rules

STEP 2: /alert-config
  → Alert rules
  → Escalation policy
  → On-call rotation

STEP 3: /log-aggregation
  → Centralized logging
  → Log queries
  → Log alerts

STEP 4: /uptime-monitor
  → Health checks
  → Status page
  → Uptime alerts
```

## Execution

### Step 1: Metrics & Dashboards
```
RUN /create-monitoring

SETUP:
- Prometheus for metrics
- Grafana for dashboards
- Core metrics: uptime, errors, latency, throughput

CHECKPOINT:
"Metrics configured. Continue to alerts?"
```

### Step 2: Alert Configuration
```
RUN /alert-config

SETUP:
- Error rate alerts
- Latency alerts
- Resource alerts
- Escalation policy
- On-call rotation

CHECKPOINT:
"Alerts configured. Continue to logging?"
```

### Step 3: Log Aggregation
```
RUN /log-aggregation

SETUP:
- Structured logging
- Log collection (Promtail/Loki)
- Log queries
- Log alerts

CHECKPOINT:
"Logging configured. Continue to uptime?"
```

### Step 4: Uptime Monitoring
```
RUN /uptime-monitor

SETUP:
- Health check endpoints
- External uptime monitoring
- Status page
- Uptime alerts

CHECKPOINT:
"Monitoring setup complete. Show summary?"
```

### Step 5: Show Summary
```markdown
# Monitoring Setup Complete

## Metrics
- Prometheus: ✅ Running
- Grafana: http://localhost:3001
- Dashboard: http://localhost:3001/d/app

## Alerts
- Error rate > 1%: Critical
- Latency > 1s: Warning
- Service down: Critical
- CPU > 80%: Warning

## Logging
- Loki: Running
- Promtail: Collecting logs
- Query: http://localhost:3100

## Uptime
- Health checks: /health
- Status page: http://localhost:3001/status

## On-Call
- Rotation: Weekly
- Escalation: 15min → 30min → 1hr
```

## Output
- Metrics collection running
- Dashboards created
- Alerts configured
- Logging active
- Uptime monitoring active
- Status page live
