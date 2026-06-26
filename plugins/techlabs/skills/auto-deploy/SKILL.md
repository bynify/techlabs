# auto-deploy

Automate deployment to cloud platforms.

## When to Use
- Setting up deployments
- Multi-environment deploys
- Blue-green deployments

## Execution

### Step 1: Detect Platform
```
SCAN:
- wrangler.toml → Cloudflare Workers/Pages
- Dockerfile → Docker/K8s
- vercel.json → Vercel
- netlify.toml → Netlify
```

### Step 2: Create Deploy Script
```bash
#!/bin/bash
set -e

echo "Running tests..."
npm test

echo "Building..."
npm run build

echo "Deploying..."
npx wrangler deploy --env production

echo "Verifying..."
curl -f https://api.example.com/health || exit 1

echo "Deploy complete!"
```

### Step 3: Add Environment Support
```toml
# wrangler.toml
[env.staging]
name = "app-staging"
vars = { ENVIRONMENT = "staging" }

[env.production]
name = "app-production"
vars = { ENVIRONMENT = "production" }
```

## Output
- Deploy script
- Environment configuration
- Health check verification
