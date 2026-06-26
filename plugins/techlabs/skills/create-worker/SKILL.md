# create-worker

Cloudflare Worker scaffolding with proper structure, bindings, and types.

## When to Use
- Creating new API endpoints
- Building edge functions
- Setting up webhooks
- Implementing middleware

## Execution

### Step 1: Gather Requirements
```
ASK USER:
1. Worker purpose? (API, webhook, middleware, scheduled)
2. Bindings needed? (KV, D1, R2, Durable Objects)
3. Routes? (/api/*, webhooks/*)
4. External services?
```

### Step 2: Create Worker
```typescript
// src/worker.ts
export interface Env {
  DB: D1Database;
  KV: KVNamespace;
  R2: R2Bucket;
}

export default {
  async fetch(request: Request, env: Env, ctx: ExecutionContext): Promise<Response> {
    const url = new URL(request.url);

    if (url.pathname === '/health') {
      return Response.json({ status: 'ok', timestamp: Date.now() });
    }

    if (url.pathname.startsWith('/api/')) {
      return handleApi(request, env, ctx);
    }

    return new Response('Not Found', { status: 404 });
  },

  async scheduled(event: ScheduledEvent, env: Env, ctx: ExecutionContext) {
    ctx.waitUntil(runScheduledTask(env));
  },
};
```

### Step 3: Create wrangler.toml
```toml
name = "api-worker"
main = "src/worker.ts"
compatibility_date = "2024-01-01"

[vars]
ENVIRONMENT = "production"

[[d1_databases]]
binding = "DB"
database_name = "app-db"
database_id = "xxx"

[[kv_namespaces]]
binding = "KV"
id = "xxx"

[[r2_buckets]]
binding = "R2"
bucket_name = "app-storage"

[triggers]
crons = ["0 2 * * *"]
```

### Step 4: Add Type Definitions
```typescript
// src/types.ts
export interface User {
  id: string;
  name: string;
  email: string;
  created_at: string;
}

export interface ApiResponse<T> {
  data: T;
  meta?: {
    page: number;
    limit: number;
    total: number;
  };
}
```

### Step 5: Create Tests
```typescript
import { describe, it, expect } from 'vitest';
import worker from '../src/worker';

describe('Worker', () => {
  it('should return health check', async () => {
    const req = new Request('http://localhost/health');
    const res = await worker.fetch(req, {} as any, {} as any);
    const data = await res.json();
    expect(data.status).toBe('ok');
  });
});
```

## Output
- Worker source code
- wrangler.toml configuration
- Type definitions
- Test file
