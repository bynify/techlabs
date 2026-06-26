# create-ci-cd

Create CI/CD pipeline with GitHub Actions for build, test, and deploy.

## When to Use
- New project setup
- Missing CI/CD
- Pipeline optimization
- Multi-environment deployment

## Execution

### Step 1: Detect Stack
```
SCAN:
- go.mod → Go
- package.json → Node.js/TypeScript
- requirements.txt → Python
- Cargo.toml → Rust
- Dockerfile → Docker
```

### Step 2: Create CI Pipeline
```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Lint
        run: npm run lint
      
      - name: Type check
        run: npm run typecheck
      
      - name: Test
        run: npm test -- --coverage
      
      - name: Upload coverage
        uses: codecov/codecov-action@v4
        with:
          file: ./coverage/lcov.info
```

### Step 3: Create CD Pipeline
```yaml
# .github/workflows/deploy.yml
name: CD

on:
  push:
    branches: [main]

jobs:
  deploy-staging:
    runs-on: ubuntu-latest
    needs: test
    if: github.ref == 'refs/heads/main'
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Deploy to staging
        run: |
          echo "Deploying to staging..."
          # Add your deploy commands here
      
      - name: Run smoke tests
        run: |
          curl -f https://staging.example.com/health
      
  deploy-production:
    runs-on: ubuntu-latest
    needs: deploy-staging
    environment: production
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Deploy to production
        run: |
          echo "Deploying to production..."
```

### Step 4: Add Cloudflare Workers Deploy
```yaml
# .github/workflows/deploy-workers.yml
name: Deploy Workers

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build
        run: npm run build
      
      - name: Deploy to Cloudflare
        uses: cloudflare/wrangler-action@v3
        with:
          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          command: pages deploy ./dist
```

### Step 5: Document Secrets
```markdown
# Required GitHub Secrets

## Deployment
- CLOUDFLARE_API_TOKEN: Cloudflare API token
- STAGING_URL: Staging environment URL
- PRODUCTION_URL: Production environment URL

## Optional
- CODECOV_TOKEN: Code coverage reporting
- SLACK_WEBHOOK: Deployment notifications
```

### Step 6: Validate
```bash
# Test workflow locally
act -j test

# Check workflow syntax
actionlint .github/workflows/*.yml
```

## Output
- CI pipeline (test, lint, typecheck)
- CD pipeline (staging, production)
- Deployment workflow
- Secret documentation
