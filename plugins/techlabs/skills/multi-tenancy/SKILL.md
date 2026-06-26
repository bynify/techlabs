# multi-tenancy

Implement multi-tenant architecture with data isolation.

## When to Use
- SaaS applications
- B2B platforms
- Shared infrastructure

## Execution

### Step 1: Tenant Schema
```sql
CREATE TABLE tenants (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(100) UNIQUE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add tenant_id to all tables
ALTER TABLE users ADD COLUMN tenant_id UUID REFERENCES tenants(id);
```

### Step 2: Tenant Context
```typescript
async function tenantMiddleware(req: Request) {
  const tenantId = req.headers.get('X-Tenant-ID');
  if (!tenantId) throw new Error('Tenant required');
  req.tenantId = tenantId;
}
```

### Step 3: Row Level Security
```sql
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON users 
  USING (tenant_id = current_setting('app.tenant_id')::uuid);
```

## Output
- Tenant schema
- Context middleware
- RLS policies
- Tenant-aware queries
