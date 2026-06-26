# auto-monitoring

Automatically set up monitoring and alerting for services.

## When to Use
- New service deployment
- Missing observability
- Incident prevention

## Execution

### Step 1: Add Metrics Collection
```typescript
import { Counter, Histogram } from 'prom-client';

const httpRequests = new Counter({
  name: 'http_requests_total',
  help: 'Total HTTP requests',
  labelNames: ['method', 'path', 'status'],
});

const httpDuration = new Histogram({
  name: 'http_request_duration_seconds',
  help: 'HTTP request duration',
  buckets: [0.01, 0.05, 0.1, 0.5, 1],
});
```

### Step 2: Create Health Endpoint
```typescript
app.get('/health', async (req, res) => {
  const checks = {
    database: await checkDatabase(),
    redis: await checkRedis(),
    external: await checkExternalAPIs(),
  };
  
  const healthy = Object.values(checks).every(c => c.status === 'ok');
  res.status(healthy ? 200 : 503).json({ status: healthy ? 'ok' : 'degraded', checks });
});
```

### Step 3: Add Alerts
```yaml
groups:
  - name: service
    rules:
      - alert: ServiceDown
        expr: up{job="api"} == 0
        for: 1m
      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.05
        for: 5m
```

## Output
- Metrics middleware
- Health endpoint
- Alert rules
- Dashboard config
