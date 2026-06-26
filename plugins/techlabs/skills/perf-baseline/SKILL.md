# perf-baseline

Establish performance baselines for monitoring and comparison.

## When to Use
- New project setup
- Performance monitoring
- Regression detection
- Before optimization

## Execution

### Step 1: Measure Current Performance
```bash
# Measure API response time
curl -o /dev/null -s -w "%{time_total}\n" https://api.example.com/users

# Measure with Apache Bench
ab -n 1000 -c 10 https://api.example.com/users

# Measure with wrk
wrk -t12 -c400 -d30s https://api.example.com/users
```

### Step 2: Create Baseline
```markdown
# Performance Baseline

## Date: 2024-01-15
## Environment: Production

## API Endpoints
| Endpoint | P50 | P95 | P99 | RPS |
|----------|-----|-----|-----|-----|
| GET /users | 50ms | 120ms | 200ms | 1000 |
| POST /users | 80ms | 200ms | 350ms | 500 |
| GET /products | 40ms | 100ms | 180ms | 2000 |

## Resources
| Metric | Value |
|--------|-------|
| CPU (avg) | 30% |
| Memory (avg) | 60% |
| Connections | 100 |
```

### Step 3: Store Baseline
```json
{
  "date": "2024-01-15",
  "environment": "production",
  "endpoints": {
    "GET /users": {
      "p50": 50,
      "p95": 120,
      "p99": 200,
      "rps": 1000
    }
  }
}
```

### Step 4: Compare Over Time
```bash
# Compare with previous baseline
diff baseline-2024-01-01.json baseline-2024-01-15.json

# Detect regressions
perf-compare --threshold 10%
```

## Output
- Baseline measured
- Baseline stored
- Comparison tools set
- Regression detection
