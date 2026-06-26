# load-test

Performance and load testing with k6 or Artillery.

## When to Use
- Load testing
- Performance testing
- Capacity planning
- Stress testing

## Execution

### Step 1: Define Scenarios
```javascript
// load-test.js
import http from 'k6/http';
import { check } from 'k6';

export const options = {
  stages: [
    { duration: '1m', target: 50 },   // Ramp up
    { duration: '5m', target: 50 },   // Hold
    { duration: '1m', target: 100 },  // Spike
    { duration: '3m', target: 100 },  // Hold
    { duration: '1m', target: 0 },    // Ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'],
    http_req_failed: ['rate<0.01'],
  },
};
```

### Step 2: Test Scenarios
```javascript
export default function () {
  const res = http.get('http://api.example.com/users');
  check(res, {
    'status 200': (r) => r.status === 200,
    'response < 500ms': (r) => r.timings.duration < 500,
  });
}
```

### Step 3: Report
```
RESULTS:
- Total requests: 15,000
- Failed: 0.02%
- P50 latency: 120ms
- P95 latency: 380ms
- P99 latency: 890ms
- Throughput: 50 req/s
```

## Output
- Load test scripts
- Results report
- Bottleneck analysis
