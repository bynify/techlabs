# context-optimize

Optimize context loading for relevance and token efficiency.

## When to Use
- Large codebases
- Token-constrained tasks
- Focused work sessions

## Execution

### Step 1: Identify Relevant Files
```
BASED ON task:
- Read only related files
- Skip tests unless fixing tests
- Skip docs unless updating docs
- Use grep to find references
```

### Step 2: Load Strategically
```
PRIORITY:
1. Files being modified
2. Direct dependencies
3. Type definitions
4. Related tests
5. Documentation (if needed)
```

### Step 3: Cache Context
```
SAVE to session state:
- Key file contents
- Type definitions
- API schemas
```

## Output
- Optimized file loading
- Token usage reduced
- Relevant context preserved
