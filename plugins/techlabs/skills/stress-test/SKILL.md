# stress-test

Stress testing to find breaking points and failure modes.

## When to Use
- Capacity planning
- Failure testing
- Performance validation
- Pre-launch validation

## Execution

### Step 1: Define Stress Scenarios
```
SCENARIOS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Ramp until failure
2. Sustained high load
3. Sudden spike
4. Concurrent connections
```

### Step 2: Create Stress Test
```javascript
// k6/stress-test.js
import http from 'k6/http';
import { check } from 'k6';

export let options = {
  stages: [
    { duration: '2m', target: 100 },
    { duration: '2m', target: 200 },
    { duration: '2m', target: 400 },
    { duration: '2m', target: 800 },
    { duration: '2m', target: 1600 },
    { duration: '5m', target: 1600 },
    { duration: '2m', target: 0 },
  ],
};

export default function () {
  const res = http.get('https://api.example.com/users');
  check(res, {
    'status is 200': (r) => r.status === 200,
  });
}
```

### Step 3: Monitor During Test
```bash
# Watch system metrics
watch -n 1 'docker stats --no-stream'
watch -n 1 'ps aux | grep app'
tail -f /var/log/app/error.log
```

### Step 4: Analyze Results
```markdown
# Stress Test Results

## Breaking Points
| Resource | Threshold | Failure Point |
|----------|-----------|---------------|
| CPU | 80% | 800 VUs |
| Memory | 80% | 1000 VUs |
| Connections | 100 | 1200 VUs |
| Throughput | 500/s | 1000 VUs |

## Failure Modes
1. CPU exhaustion at 800 VUs
2. Memory leak after 30 min
3. Connection pool exhaustion

## Recommendations
1. Scale horizontally at 700 VUs
2. Increase connection pool
3. Add memory limits
```

## Output
- Stress test executed
- Breaking points identified
- Failure modes documented
- Recommendations provided
