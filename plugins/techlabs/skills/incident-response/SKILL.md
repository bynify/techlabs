# incident-response

Structured incident response and post-mortem process.

## Execution

### Step 1: Severity Classification
```
SEV1: Service down, data loss
SEV2: Major feature broken
SEV3: Minor issue, workaround exists
```

### Step 2: Response Steps
```
1. Acknowledge incident
2. Communicate status (#incident channel)
3. Investigate root cause
4. Implement fix
5. Verify resolution
6. Update status page
```

### Step 3: Post-Mortem
```markdown
# Incident Report

## Summary
- Duration: 45 minutes
- Impact: 500 users affected
- Root cause: Database connection pool exhaustion

## Timeline
14:00 - Alert fired
14:05 - Team acknowledged
14:20 - Root cause identified
14:35 - Fix deployed
14:45 - Verified resolved

## Action Items
- [ ] Add connection pool monitoring
- [ ] Increase pool size
- [ ] Add circuit breaker
```

## Output
- Response process
- Communication templates
- Post-mortem template
