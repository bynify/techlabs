# release-checklist

Pre-release verification checklist for safe deployments.

## When to Use

## Agents to Dispatch
- devops-lead: Deployment
- lead-engineer: Code readiness
- security-lead: Security check
- Before production releases
- After QA sign-off
- Sprint completion

## Execution

### Step 1: Code Quality
```bash
# Run all checks
npm test
npm run lint
npm run typecheck
npm run build
```
- [ ] All tests passing
- [ ] No lint errors
- [ ] TypeScript compiles
- [ ] Code reviewed and approved
- [ ] Changelog updated

### Step 2: Deployment Preparation
```
CHECK:
- [ ] Staging deployed and tested
- [ ] Database migrations tested
- [ ] Rollback plan documented
- [ ] Feature flags configured
- [ ] Environment variables set
```

### Step 3: Monitoring & Alerting
```
VERIFY:
- [ ] Health checks configured
- [ ] Error tracking active
- [ ] Performance monitoring enabled
- [ ] Alert routing configured
- [ ] On-call rotation set
```

### Step 4: Communication
```
NOTIFY:
- [ ] Team notified of release window
- [ ] Status page updated
- [ ] Customers informed (if breaking changes)
- [ ] Support team briefed
```

### Step 5: Post-Release
```
MONITOR:
- [ ] Error rate stable
- [ ] Performance metrics normal
- [ ] No user complaints
- [ ] Rollback if issues detected
```

## Output
- Checklist completed
- Sign-off obtained
- Release authorized
- Monitoring confirmed
