# hotfix

Emergency production fix workflow.

## When to Use
- Hotfix process
- Critical bugs
- Production issues
- Emergency patches

## Execution

### Step 1: Create Hotfix Branch
```bash
git checkout -b hotfix/critical-bug main
```

### Step 2: Fix & Test
```
1. Identify root cause
2. Create minimal fix
3. Write regression test
4. Verify fix
```

### Step 3: Deploy
```bash
git commit -m "fix: critical bug description"
git push origin hotfix/critical-bug
# Deploy immediately
```

### Step 4: Merge & Tag
```bash
git checkout main
git merge hotfix/critical-bug
git tag v1.2.1
git push origin main --tags
```

## Output
- Fix deployed
- Tests added
- Release tagged
