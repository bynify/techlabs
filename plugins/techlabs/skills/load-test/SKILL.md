# load-test

Performance testing with load, stress, and spike scenarios.

## When to Use
- Pre-launch validation
- Capacity planning
- Performance baseline
- Before major changes

## Agents to Dispatch
- lead-engineer: Test design
- devops-lead: Infrastructure scaling
- quality-lead: Test execution

## Execution

### Step 1: Define Test Scenarios
```
ASK USER:
1. What endpoints to test?
2. Expected concurrent users?
3. Expected response time?
4. What's the success criteria?
```

### Step 2: Create Test Script
```javascript
// k6/load-test.js
import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '2m', target: 100 },  // Ramp up
    { duration: '5m', target: 100 },  // Stay at 100
    { duration: '2m', target: 200 },  // Ramp to 200
    { duration: '5m', target: 200 },  // Stay at 200
    { duration: '2m', target: 0 },    // Ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'],  // 95% < 500ms
    http_req_failed: ['rate<0.01'],     // < 1% failures
  },
};

export default function () {
  let res = http.get('https://api.example.com/users');
  check(res, {
    'status is 200': (r) => r.status === 200,
    'response time < 500ms': (r) => r.timings.duration < 500,
  });
  sleep(1);
}
```

### Step 3: Run Load Test
```bash
# Run load test
k6 run k6/load-test.js

# Run with output
k6 run --out json=results.json k6/load-test.js

# Run in cloud
k6 cloud k6/load-test.js
```

### Step 4: Analyze Results
```markdown
# Load Test Results

## Test Configuration
- Duration: 16 minutes
- Max VUs: 200
- Target: api.example.com

## Results Summary
| Metric | Result | Threshold | Status |
|--------|--------|-----------|--------|
| Requests | 45,000 | - | ✅ |
| Avg Response | 120ms | <500ms | ✅ |
| P95 Response | 380ms | <500ms | ✅ |
| P99 Response | 450ms | <500ms | ✅ |
| Error Rate | 0.3% | <1% | ✅ |
| Throughput | 500 req/s | - | ✅ |

## Performance by Endpoint
| Endpoint | Avg | P95 | Errors |
|----------|-----|-----|--------|
| GET /users | 80ms | 200ms | 0.1% |
| POST /orders | 150ms | 400ms | 0.5% |
| GET /products | 100ms | 300ms | 0.2% |

## Issues Found
1. POST /orders: High latency at 200 VUs
   - Cause: Database connection pool exhaustion
   - Fix: Increase pool size

## Recommendations
1. Increase connection pool to 50
2. Add caching for GET /products
3. Optimize database queries
```

### Step 5: Stress Test
```javascript
// k6/stress-test.js
export let options = {
  stages: [
    { duration: '1m', target: 100 },
    { duration: '1m', target: 200 },
    { duration: '1m', target: 400 },  // Stress
    { duration: '1m', target: 800 },  // Peak
    { duration: '1m', target: 1600 }, // Beyond capacity
    { duration: '2m', target: 0 },
  ],
};
```

### Step 6: Spike Test
```javascript
// k6/spike-test.js
export let options = {
  stages: [
    { duration: '1m', target: 100 },
    { duration: '10s', target: 1000 }, // Spike
    { duration: '1m', target: 100 },  // Recovery
    { duration: '10s', target: 1000 }, // Another spike
    { duration: '2m', target: 0 },
  ],
};
```

## Output
- Test scripts created
- Results analyzed
- Performance baseline established
- Bottlenecks identified
- Optimization recommendations
