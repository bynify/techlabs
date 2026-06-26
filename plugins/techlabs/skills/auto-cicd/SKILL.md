# auto-cicd

Automate CI/CD pipeline creation based on detected stack.

## When to Use
- New project setup
- Missing CI/CD
- Standardizing pipelines

## Execution

### Step 1: Detect Stack and Create Pipeline
```yaml
# .github/workflows/ci.yml
name: CI
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-go@v5
        with:
          go-version: '1.22'
      - run: go test ./... -race -coverprofile=coverage.out
```

### Step 2: Add CD Pipeline
```yaml
# .github/workflows/deploy.yml
name: CD
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    needs: test
    steps:
      - uses: actions/checkout@v4
      - run: npm ci && npm run build
      - run: npx wrangler deploy
```

## Output
- CI pipeline
- CD pipeline
- Secret documentation
