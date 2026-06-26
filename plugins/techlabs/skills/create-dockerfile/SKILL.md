# create-dockerfile

Create Dockerfile: Multi-stage Dockerfile.

## When to Use
- Production deployment
- Local development
- Incident response
- DevOps automation

## Execution

### Step 1: Detect Stack
```
SCAN:
- go.mod → Go
- package.json → Node.js
- Dockerfile → Docker
- wrangler.toml → Cloudflare Workers
```

### Step 2: Create Configuration
```bash
# Stack-specific commands
```

### Step 3: Validate
```
CHECK:
- Configuration syntax correct
- Secrets referenced, not hardcoded
- Health checks configured
- Rollback plan documented
```

## Output
- Configuration files
- Deployment scripts
- Validation checks
