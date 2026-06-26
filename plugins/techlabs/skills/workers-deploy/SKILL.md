# workers-deploy

Deploy Cloudflare Workers with wrangler.

## When to Use
- Deploying Workers
- Environment management
- Secret management

## Execution

### Step 1: Configure wrangler.toml
```toml
name = "api-worker"
main = "src/worker.ts"
compatibility_date = "2024-01-01"

[env.production]
name = "api-production"
routes = [{ pattern = "api.example.com/*", zone_name = "example.com" }]

[env.staging]
name = "api-staging"
routes = [{ pattern = "staging.example.com/*", zone_name = "example.com" }]
```

### Step 2: Deploy
```bash
# Deploy to staging
npx wrangler deploy --env staging

# Deploy to production
npx wrangler deploy --env production

# Deploy with secrets
npx wrangler secret put API_KEY --env production
```

### Step 3: Verify
```bash
curl -f https://api.example.com/health
```

## Output
- wrangler.toml configuration
- Deploy script
- Secret management
