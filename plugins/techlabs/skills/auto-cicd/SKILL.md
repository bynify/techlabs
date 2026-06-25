# auto-cicd

Auto-generate CI/CD pipeline.

## Execution

### Step 1: Detect Project Type
```
SCAN:
- go.mod → Go
- package.json → Node.js
- requirements.txt → Python
- Dockerfile → Docker
```

### Step 2: Generate Pipeline
```
CREATE .github/workflows/ci.yml:
- Linting
- Testing
- Building
- Security scanning
- Deployment
```

### Step 3: Configure
```
SETUP:
- Environment variables
- Secrets
- Deployment targets
- Notifications
```

### Step 4: Validate
```
CHECK:
- Pipeline syntax
- Required secrets
- Deployment targets
```

## Output
- CI/CD configuration
- Documentation
