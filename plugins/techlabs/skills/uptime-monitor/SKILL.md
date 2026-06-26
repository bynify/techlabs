# uptime-monitor

Uptime monitoring with health checks and status pages.

## When to Use
- Production monitoring
- SLA tracking
- Incident detection
- Status reporting

## Execution

### Step 1: Define Health Checks
```typescript
// Health check endpoint
app.get('/health', async (req, res) => {
  const health = {
    status: 'ok',
    timestamp: new Date(),
    checks: {
      database: await checkDatabase(),
      redis: await checkRedis(),
      external: await checkExternal()
    }
  };
  
  const isHealthy = Object.values(health.checks)
    .every(c => c.status === 'ok');
  
  res.status(isHealthy ? 200 : 503).json(health);
});
```

### Step 2: External Monitoring
```yaml
# Uptime monitoring
services:
  - name: API
    url: https://api.example.com/health
    interval: 60
    timeout: 10
    
  - name: Website
    url: https://www.example.com
    interval: 300
    timeout: 30
```

### Step 3: Status Page
```markdown
# Status Page

## Current Status
| Service | Status | Uptime |
|---------|--------|--------|
| API | ✅ Operational | 99.95% |
| Website | ✅ Operational | 99.99% |
| Database | ✅ Operational | 99.98% |

## Recent Incidents
### 2024-01-15: API Slowdown
- Duration: 15 minutes
- Cause: Database connection pool
- Resolution: Increased pool size
```

### Step 4: Alerts
```yaml
# Uptime alerts
alerts:
  - name: Service Down
    condition: uptime < 99.9%
    channels: [slack, email, pagerduty]
    
  - name: High Latency
    condition: latency > 1000ms
    channels: [slack, email]
```

## Output
- Health checks configured
- External monitoring active
- Status page created
- Alerts configured
