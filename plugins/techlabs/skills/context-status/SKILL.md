# context-status

Show current context state, files loaded, and token usage.

## When to Use
- Session management
- Debugging context issues
- Token monitoring

## Execution

### Step 1: Display Status
```
CONTEXT STATUS:
- Session duration: 45 min
- Files loaded: 12
- Tokens used: ~15,000
- Current task: Implementing auth
```

### Step 2: Show Active Files
```
ACTIVE FILES:
1. src/auth/middleware.ts (modified)
2. src/auth/types.ts (referenced)
3. src/api/users.ts (dependent)
```

### Step 3: Recommendations
```
SUGGESTIONS:
- Compress context (saves ~5,000 tokens)
- Focus on current task files
- Archive completed work
```

## Output
- Context status report
- Token usage
- Optimization suggestions
