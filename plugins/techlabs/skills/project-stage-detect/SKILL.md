# project-stage-detect

Detect current project stage and recommend next steps.

## Execution

### Step 1: Scan Project
```
CHECK:
- docs/PRD.md exists?
- src/ has code?
- tests/ exists?
- CI/CD configured?
- Production deployed?
```

### Step 2: Determine Stage
```
IF no_prd AND no_code: IDEA
IF prd AND no_code: PLANNING
IF code AND no_tests: DEVELOPMENT
IF code AND tests AND no_deploy: TESTING
IF deployed: PRODUCTION
```

### Step 3: Recommend
```
STAGE: DEVELOPMENT
NEXT:
1. /create-tests
2. /create-ci-cd
3. /security-audit
```

## Output
- Stage detection
- Recommendations
- Next steps
