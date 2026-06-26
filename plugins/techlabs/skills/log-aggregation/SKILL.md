# log-aggregation

Centralized logging with aggregation and analysis.

## When to Use
- Debugging issues
- Performance analysis
- Security monitoring
- Compliance logging

## Execution

### Step 1: Setup Log Collection
```yaml
# Promtail/Loki configuration
server:
  http_listen_port: 9080
  grpc_listen_port: 0

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://loki:3100/loki/api/v1/push

scrape_configs:
  - job_name: system
    static_configs:
    - targets:
        - localhost
      labels:
        job: varlogs
        __path__: /var/log/*.log
```

### Step 2: Structured Logging
```typescript
// Structured logging
import winston from 'winston';

const logger = winston.createLogger({
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
  ),
  transports: [
    new winston.transports.Console(),
    new winston.transports.File({ filename: 'app.log' })
  ]
});

// Usage
logger.info('User login', {
  userId: user.id,
  email: user.email,
  ip: req.ip,
  timestamp: new Date()
});
```

### Step 3: Log Queries
```logql
# Loki queries
{job="app"} |= "error"
{job="app"} | json | level="error"
{job="app"} | json | userId="123"
```

### Step 4: Log Dashboard
```markdown
# Log Dashboard

## Key Queries
- Error rate: `{job="app"} | json | level="error"`
- Slow queries: `{job="app"} | json | duration > 1000`
- Failed logins: `{job="app"} | json | action="login.failure"`
```

## Output
- Log collection configured
- Structured logging implemented
- Queries defined
- Dashboard created
