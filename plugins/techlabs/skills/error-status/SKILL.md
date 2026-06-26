# error-status

Show current error status, recent errors, and recovery actions.

## When to Use
- Starting a session
- After fixing errors
- Monitoring ongoing issues

## Execution

### Step 1: Load Error Data
```bash
# Recent errors
cat .claude/errors/error-log.yaml | tail -20

# Error count by type
grep -o "type:.*" .claude/errors/error-log.yaml | sort | uniq -c | sort -rn

# Recovery status
cat .claude/errors/recovery-log.yaml 2>/dev/null | tail -10
```

### Step 2: Generate Status
```markdown
# Error Status Report

## Current Status: ✅ Stable / ⚠️ Warning / 🚨 Critical

## Last 24 Hours
- Errors encountered: 3
- Errors resolved: 2
- Still open: 1

## Recent Errors
| Time | Type | File | Status |
|------|------|------|--------|
| 10:30 | runtime | src/api/auth.ts | ✅ Fixed |
| 14:15 | logic | src/lib/utils.ts | ✅ Fixed |
| 16:45 | config | wrangler.toml | ⏳ Pending |

## Error Rate Trend
- Last hour: 0.2 errors/session
- Last 24h: 0.5 errors/session
- Last 7 days: 0.8 errors/session
```

### Step 3: Recommendations
```
IF error_rate > 1.0:
  RECOMMEND: Review recent changes, run tests

IF recurring_error:
  RECOMMEND: Fix root cause, add prevention

IF no_errors:
  RECOMMEND: Document what's working well
```

## Output
- Error status summary
- Recent error list
- Trend analysis
- Action recommendations
