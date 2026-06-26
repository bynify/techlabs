# create-monitoring

Setup monitoring with metrics, dashboards, and alerting.

## When to Use
- Production deployment
- Incident prevention
- Performance tracking
- SLA compliance

## Execution

### Step 1: Define Metrics
```typescript
// Core metrics to track
interface Metrics {
  // Availability
  uptime: number;              // Target: 99.9%
  errorRate: number;           // Target: <0.1%
  
  // Performance
  latencyP50: number;          // Target: <100ms
  latencyP95: number;          // Target: <500ms
  latencyP99: number;          // Target: <1000ms
  
  // Business
  requestsPerSecond: number;
  activeUsers: number;
  conversionRate: number;
}
```

### Step 2: Application Metrics
```typescript
// Node.js with prom-client
import { Counter, Histogram, Gauge } from 'prom-client';

// Request counter
const httpRequests = new Counter({
  name: 'http_requests_total',
  help: 'Total HTTP requests',
  labelNames: ['method', 'path', 'status'],
});

// Latency histogram
const httpDuration = new Histogram({
  name: 'http_request_duration_seconds',
  help: 'HTTP request duration',
  labelNames: ['method', 'path'],
  buckets: [0.01, 0.05, 0.1, 0.5, 1, 5],
});

// Active connections
const activeConnections = new Gauge({
  name: 'active_connections',
  help: 'Active connections',
});

// Middleware
app.use((req, res, next) => {
  const end = httpDuration.startTimer({ method: req.method, path: req.path });
  res.on('finish', () => {
    httpRequests.inc({ method: req.method, path: req.path, status: res.statusCode });
    end();
  });
  next();
});

// Metrics endpoint
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', 'text/plain');
  res.send(await register.metrics());
});
```

### Step 3: Prometheus Config
```yaml
# prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'app'
    static_configs:
      - targets: ['app:3000']
    metrics_path: '/metrics'

  - job_name: 'node'
    static_configs:
      - targets: ['node-exporter:9100']

alerting:
  alertmanagers:
    - static_configs:
        - targets: ['alertmanager:9093']

rule_files:
  - 'alerts/*.yml'
```

### Step 4: Alert Rules
```yaml
# alerts/app.yml
groups:
  - name: app
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.01
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High error rate: {{ $value }}%"
          
      - alert: HighLatency
        expr: histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) > 0.5
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "P95 latency > 500ms"
          
      - alert: ServiceDown
        expr: up == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Service {{ $labels.instance }} is down"
```

### Step 5: Grafana Dashboard
```json
{
  "dashboard": {
    "title": "App Monitoring",
    "panels": [
      {
        "title": "Request Rate",
        "type": "graph",
        "targets": [
          {
            "expr": "rate(http_requests_total[5m])",
            "legendFormat": "{{method}} {{path}}"
          }
        ]
      },
      {
        "title": "Error Rate",
        "type": "stat",
        "targets": [
          {
            "expr": "rate(http_requests_total{status=~\"5..\"}[5m]) / rate(http_requests_total[5m]) * 100"
          }
        ]
      },
      {
        "title": "Latency P95",
        "type": "stat",
        "targets": [
          {
            "expr": "histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) * 1000"
          }
        ]
      }
    ]
  }
}
```

### Step 6: Health Check
```typescript
app.get('/health', (req, res) => {
  const health = {
    status: 'ok',
    timestamp: new Date().toISOString(),
    checks: {
      database: checkDatabase(),
      redis: checkRedis(),
      memory: process.memoryUsage(),
    },
  };
  
  const isHealthy = Object.values(health.checks).every(c => c.status === 'ok');
  res.status(isHealthy ? 200 : 503).json(health);
});
```

### Step 7: Docker Compose
```yaml
# docker-compose.monitoring.yml
version: '3.8'

services:
  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - ./alerts:/etc/prometheus/alerts
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'

  grafana:
    image: grafana/grafana
    ports:
      - "3001:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
    volumes:
      - grafana_data:/var/lib/grafana

  alertmanager:
    image: prom/alertmanager
    ports:
      - "9093:9093"
    volumes:
      - ./alertmanager.yml:/etc/alertmanager/alertmanager.yml

volumes:
  grafana_data:
```

## Output
- Application metrics code
- Prometheus configuration
- Alert rules
- Grafana dashboard
- Health check endpoint
- Docker Compose for monitoring stack
