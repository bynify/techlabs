# create-r2-bucket

Cloudflare R2 storage bucket with presigned URLs and lifecycle rules.

## When to Use
- File uploads/downloads
- Static asset storage
- Backup storage
- Media hosting

## Execution

### Step 1: Configure R2
```toml
# wrangler.toml
[[r2_buckets]]
binding = "R2"
bucket_name = "app-storage"
```

### Step 2: Upload Handler
```typescript
export async function handleUpload(request: Request, env: Env) {
  const formData = await request.formData();
  const file = formData.get('file') as File;
  
  await env.R2.put(`uploads/${file.name}`, file, {
    httpMetadata: { contentType: file.type },
  });

  return Response.json({ key: `uploads/${file.name}` });
}
```

### Step 3: Presigned URL
```typescript
export async function getPresignedUrl(key: string, env: Env) {
  const url = await env.R2.presign(key, {
    method: 'GET',
    expiresIn: 3600, // 1 hour
  });
  return Response.json({ url });
}
```

### Step 4: Lifecycle Rules
```toml
[[r2_buckets.lifecycle_rules]]
enabled = true
expiration = { days = 90 }
```

## Output
- R2 bucket config
- Upload/download handlers
- Presigned URLs
- Lifecycle rules
