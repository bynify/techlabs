# create-rollback

Implement deployment rollback for safe releases.

## When to Use
- Failed deployments
- Bug detection post-release
- Quick recovery needed

## Execution

### Step 1: Version Tracking
```bash
# Tag releases
git tag v1.2.0
git push origin v1.2.0
```

### Step 2: Rollback Script
```bash
#!/bin/bash
# rollback.sh
VERSION=$1

echo "Rolling back to $VERSION..."
git checkout $VERSION
npm ci
npm run build
npx wrangler deploy

echo "Verifying..."
curl -f https://api.example.com/health
```

### Step 3: Feature Flag Rollback
```typescript
// Disable feature without deploying
await featureFlags.disable('new_checkout');
```

## Output
- Rollback procedure
- Feature flag integration
- Verification steps
