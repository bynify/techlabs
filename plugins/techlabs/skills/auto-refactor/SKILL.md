# auto-refactor

Automatic code refactoring.

## Execution

### Step 1: Detect Code Smells
```
SCAN:
- Long functions (> 50 lines)
- Deep nesting (> 3 levels)
- Code duplication
- Complex conditionals
- God classes/objects
```

### Step 2: Suggest Refactoring
```
FOR EACH code smell:
1. Identify pattern
2. Suggest refactoring technique
3. Estimate impact
4. Show before/after
```

### Step 3: Apply (with approval)
```
APPLY:
1. Backup current code
2. Apply refactoring
3. Run tests
4. Verify no regression
```

### Step 4: Document
```
DOCUMENT:
- Refactoring applied
- Impact on code quality
- Test results
```

## Output
- Refactored code
- Quality improvement report
