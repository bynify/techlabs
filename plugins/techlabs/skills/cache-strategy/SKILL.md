# cache-strategy

Implement caching at multiple layers: browser, CDN, application, and database.

## When to Use
- Performance optimization
- Reducing database load
- Improving page load times
- API response caching

## Execution

### Step 1: Identify Cache Targets
```
ANALYZE for caching:
- Static assets (images, CSS, JS)
- API responses (GET endpoints)
- Database queries (repeated reads)
- Computed values (aggregations)

FOR EACH target:
- TTL? (how long before stale)
- Invalidation? (time-based, event-based)
- Scope? (per-user, global)
```

### Step 2: Browser/CDN Cache
```typescript
// Next.js
export async function GET(request: Request) {
  const data = await fetchData();
  
  return Response.json(data, {
    headers: {
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400',
      'CDN-Cache-Control': 'max-age=3600',
    },
  });
}
```

### Step 3: Application Cache (Redis)
```typescript
import Redis from 'ioredis';

const redis = new Redis(process.env.REDIS_URL);

async function getCached<T>(key: string, ttl: number, fetcher: () => Promise<T>): Promise<T> {
  const cached = await redis.get(key);
  if (cached) return JSON.parse(cached);

  const data = await fetcher();
  await redis.setex(key, ttl, JSON.stringify(data));
  return data;
}

// Usage
const users = await getCached('users:all', 300, () => db.users.findMany());
```

### Step 4: Cache Invalidation
```typescript
// Event-based invalidation
async function updateUser(id: string, data: UpdateUserInput) {
  const user = await db.users.update(id, data);
  
  // Invalidate caches
  await redis.del(`user:${id}`);
  await redis.del('users:all');
  
  // Or use pattern-based invalidation
  const keys = await redis.keys('users:*');
  if (keys.length) await redis.del(...keys);
  
  return user;
}
```

### Step 5: Database Query Cache
```typescript
// Materialized views for complex aggregations
await db.query(`
  CREATE MATERIALIZED VIEW user_order_summary AS
  SELECT user_id, COUNT(*) as order_count, SUM(total) as total_spent
  FROM orders
  GROUP BY user_id
`);

// Refresh periodically
await db.query('REFRESH MATERIALIZED VIEW CONCURRENTLY user_order_summary');
```

## Output
- Browser/CDN cache headers
- Redis cache layer
- Invalidation strategy
- Monitoring setup
