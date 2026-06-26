# rate-limiting

Implement rate limiting for APIs.

## When to Use
- Rate limiting
- API protection
- Abuse prevention
- Throttling strategy

## Execution

### Step 1: Strategy
```
OPTIONS:
- Token bucket
- Sliding window
- Fixed window
```

### Step 2: Implementation
```typescript
import rateLimit from 'express-rate-limit';

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
  standardHeaders: true,
  legacyHeaders: false,
  handler: (req, res) => {
    res.status(429).json({ error: 'Too many requests' });
  },
});

app.use('/api/', limiter);
```

### Step 3: Redis-based
```typescript
async function checkRateLimit(key: string, limit: number, window: number) {
  const current = await redis.incr(key);
  if (current === 1) await redis.expire(key, window);
  return current <= limit;
}
```

## Output
- Rate limiter middleware
- Configuration
- Response headers
