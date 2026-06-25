# create-ci-cd

Create CI/CD pipeline with GitHub Actions.

## Execution

### Step 1: Detect Stack
```
SCAN:
- go.mod → Go
- package.json → Node.js/TypeScript
- requirements.txt → Python
- Dockerfile → Docker
```

### Step 2: Create GitHub Actions Workflow
```
CREATE .github/workflows/ci.yml:
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
      
      - name: Set up Go
        uses: actions/setup-go@v5
        with:
          go-version: '1.22'
      
      - name: Run linter
        run: golangci-lint run
      
      - name: Run tests
        run: go test ./...
      
      - name: Build
        run: go build ./...
```

### Step 3: Create CD Pipeline
```
CREATE .github/workflows/cd.yml:
name: CD

on:
  push:
    branches: [main]
    tags: ['v*']

jobs:
  deploy:
    runs-on: ubuntu-latest
    needs: test
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Build Docker image
        run: docker build -t app:${{ github.sha }} .
      
      - name: Push to registry
        run: |
          echo ${{ secrets.DOCKER_PASSWORD }} | docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin
          docker push app:${{ github.sha }}
      
      - name: Deploy to production
        if: startsWith(github.ref, 'refs/tags/v')
        run: |
          kubectl set image deployment/app app=app:${{ github.sha }}
```

### Step 4: Add Environment Secrets
```
DOCUMENT required secrets:
- DOCKER_USERNAME
- DOCKER_PASSWORD
- KUBECONFIG
- DATABASE_URL
- API_KEYS
```

### Step 5: Test Pipeline
```
PUSH to trigger pipeline
MONITOR workflow runs
FIX any failures
```

## Output
- Created CI pipeline
- Created CD pipeline
- Documented secrets
- Pipeline tested
