# error-recovery

Automatic error recovery system.

## When to Use
- Error recovery
- Graceful degradation
- Fallback logic
- Circuit breakers

## Execution

### Step 1: Detect Error
```
DETECT:
- Error type (code/build/test/deploy)
- Error severity (low/medium/high/critical)
- Error context (what was being done)
- Error details (specific error message)
```

### Step 2: Analyze
```
ANALYZE:
- Root cause
- Affected files
- Recovery options
- Risk assessment
```

### Step 3: Recover
```
RECOVERY OPTIONS:
1. Revert to last working state
2. Fix error directly
3. Skip and continue
4. Manual intervention

EXECUTE:
- Apply recovery strategy
- Verify recovery
- Update error log
```

### Step 4: Learn
```
LEARN:
- Log error pattern
- Update recovery strategies
- Improve error detection
```

## Output
- Recovery applied
- Error log updated
- Lessons learned
