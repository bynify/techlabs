# cache-strategy

Implement caching strategy with Redis, CDN, and application-level caching.

## When to Use
- Performance optimization
- Database load reduction
- API response caching
- Static asset caching

## Agents to Dispatch
- lead-engineer: Cache architecture
- redis-specialist: Redis implementation
- devops-lead: CDN configuration

## Execution

### Step 1: Identify Cache Opportunities
```
ANALYZE:
1. What data is read frequently?
2. What data changes rarely?
3. What API endpoints are slow?
4. What database queries are expensive?

CACHE LEVELS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

L1: Browser Cache
  - Static assets (CSS, JS, images)
  - API responses (Cache-Control headers)
  - TTL: 1 hour - 7 days

L2: CDN Cache
  - Static assets
  - API responses
  - TTL: 1 hour - 24 hours

L3: Application Cache
  - In-memory (Node.js, Go)
  - TTL: 1 minute - 1 hour

L4: Database Cache
  - Redis/Memcached
  - Query results
  - TTL: 5 minutes - 24 hours
```

### Step 2: Implement Redis Cache
```typescript
// Redis caching pattern
import Redis from 'ioredis';

const redis = new Redis();

async function getCached<T>(
  key: string,
  fetcher: () => Promise<T>,
  ttl: number = 3600
): Promise<T> {
  // Try cache first
  const cached = await redis.get(key);
  if (cached) {
    return JSON.parse(cached);
  }
  
  // Fetch fresh data
  const data = await fetcher();
  
  // Cache for future requests
  await redis.setex(key, ttl, JSON.stringify(data));
  
  return data;
}

// Usage
const user = await getCached(
  `user:${userId}`,
  () => db.users.findById(userId),
  3600
);
```

### Step 3: Cache Invalidation
```typescript
// Cache invalidation patterns

// 1. Time-based (TTL)
await redis.setex(key, 3600, data);

// 2. Event-based
async function updateUser(userId: string, data: User) {
  await db.users.update(userId, data);
  await redis.del(`user:${userId}`);
  await redis.del(`user:${userId}:profile`);
}

// 3. Version-based
const key = `user:${userId}:v${user.version}`;

// 4. Tag-based
async function invalidateUser(userId: string) {
  const keys = await redis.keys(`user:${userId}:*`);
  if (keys.length > 0) {
    await redis.del(...keys);
  }
}
```

### Step 4: CDN Configuration
```nginx
# Nginx cache configuration
proxy_cache_path /var/cache/nginx levels=1:2 
  keys_zone=api_cache:10m max_size=10g 
  inactive=60m use_temp_path=off;

server {
  location /api/ {
    proxy_cache api_cache;
    proxy_cache_valid 200 10m;
    proxy_cache_valid 404 1m;
    proxy_cache_use_stale error timeout updating;
    add_header X-Cache-Status $upstream_cache_status;
  }
}
```

### Step 5: Cache Monitoring
```yaml
# Redis monitoring
redis-cli info stats | grep -E "keyspace_hits|keyspace_misses"

# Hit rate calculation
hit_rate = keyspace_hits / (keyspace_hits + keyspace_misses)
```

### Step 6: Cache Strategy Document
```markdown
# Cache Strategy

## L1: Browser
- Static assets: 7 days
- API: 5 minutes
- Invalidated by: Cache-Control headers

## L2: CDN
- Static assets: 24 hours
- API: 10 minutes
- Invalidated by: Purge on deploy

## L3: Application
- Session data: 1 hour
- User data: 15 minutes
- Invalidated by: Event-driven

## L4: Database (Redis)
- Query results: 5 minutes
- User sessions: 24 hours
- Invalidated by: Write-through
```

## Output
- Cache strategy defined
- Redis implementation
- CDN configuration
- Cache invalidation logic
- Monitoring setup
