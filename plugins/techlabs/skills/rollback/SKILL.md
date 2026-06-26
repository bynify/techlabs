# rollback

Deployment rollback procedure.

## When to Use
- Production incidents
- Failed deployments
- Critical bugs
- Performance degradation

## Execution

### Step 1: Identify Issue
```
DETECT:
- Error rate spike
- Latency increase
- User reports
```

### Step 2: Rollback
```bash
# Git rollback
git revert HEAD
git push

# Container rollback
kubectl rollout undo deployment/api

# Feature flag
await featureFlags.disable('new_feature')
```

### Step 3: Verify
```bash
# Check health
curl -f https://api.example.com/health

# Check error rate
# Monitor for 15 minutes
```

## Output
- Rollback executed
- Issue documented
- Prevention plan
