# error-history

View error history and patterns for learning and prevention.

## When to Use
- Debugging recurring issues
- Understanding error patterns
- Post-mortem preparation

## Execution

### Step 1: Load History
```bash
# Check error logs
cat .claude/errors/error-log.yaml | tail -100

# Check git history for errors
git log --oneline --grep="fix:" -20
git log --oneline --grep="error" -20
```

### Step 2: Analyze Patterns
```
CATEGORIZE ERRORS:
- By type (runtime, logic, network, config)
- By frequency (one-time vs recurring)
- By impact (blocking vs non-blocking)
- By domain (auth, db, api, frontend)

PATTERN DETECTION:
- Same error in different files → shared issue
- Error after specific change → regression
- Time-based pattern → resource issue
```

### Step 3: Generate Report
```markdown
# Error History Report

## Summary
- Total errors (last 7 days): 23
- Unique error types: 5
- Resolved: 20
- Still open: 3

## Top Patterns

### 1. Database connection timeout (8 occurrences)
- First seen: 2024-03-10
- Last seen: 2024-03-14
- Cause: Connection pool exhaustion under load
- Fix: Increased pool size from 10 to 25

### 2. Auth token expired (5 occurrences)
- Pattern: Occurs after 24h inactivity
- Fix: Implement refresh token rotation

## Recommendations
1. Add connection pool monitoring
2. Implement token refresh before expiry
3. Add retry logic for transient failures
```

### Step 4: Update Prevention Rules
```
FOR EACH pattern:
- Add to rules if preventable
- Create test if reproducible
- Add monitoring if detectable
```

## Output
- Error history report
- Pattern analysis
- Prevention recommendations
- Rules updated
