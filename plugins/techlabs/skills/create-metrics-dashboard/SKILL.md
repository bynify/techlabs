# create-metrics-dashboard

Build operational dashboards with key metrics, alerts, and health checks.

## When to Use
- Monitoring system health
- Tracking business metrics
- Operational visibility
- On-call support

## Execution

### Step 1: Define Metrics
```
BUSINESS METRICS:
- DAU/MAU
- Revenue
- Conversion rate
- Feature adoption

TECHNICAL METRICS:
- Request rate
- Error rate (5xx/total)
- P50/P95/P99 latency
- CPU/Memory usage

DATABASE METRICS:
- Query latency
- Connection pool usage
- Replication lag
```

### Step 2: Create Metrics Collection
```typescript
// src/metrics/index.ts
import { Counter, Histogram, Gauge } from 'prom-client';

export const httpRequests = new Counter({
  name: 'http_requests_total',
  help: 'Total HTTP requests',
  labelNames: ['method', 'path', 'status'],
});

export const httpDuration = new Histogram({
  name: 'http_request_duration_seconds',
  help: 'HTTP request duration',
  labelNames: ['method', 'path'],
  buckets: [0.01, 0.05, 0.1, 0.5, 1, 2, 5],
});

export const dbConnections = new Gauge({
  name: 'db_connections_active',
  help: 'Active database connections',
});
```

### Step 3: Create Dashboard
```json
{
  "title": "API Dashboard",
  "panels": [
    {
      "title": "Request Rate",
      "type": "graph",
      "query": "rate(http_requests_total[5m])",
      "targets": [
        { "expr": "sum(rate(http_requests_total[5m])) by (status)" }
      ]
    },
    {
      "title": "P95 Latency",
      "type": "graph",
      "query": "histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))"
    },
    {
      "title": "Error Rate",
      "type": "stat",
      "query": "sum(rate(http_requests_total{status=~'5..'}[5m])) / sum(rate(http_requests_total[5m]))"
    }
  ]
}
```

### Step 4: Configure Alerts
```yaml
groups:
  - name: api
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.05
        for: 5m
        labels:
          severity: critical

      - alert: HighLatency
        expr: histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) > 1
        for: 5m
        labels:
          severity: warning
```

## Output
- Metrics collection
- Dashboard definition
- Alert rules
- Health check endpoints
