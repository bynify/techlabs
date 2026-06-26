# consistency-check

Check codebase for naming, patterns, and style consistency.

## When to Use
- Code quality audits
- Onboarding new developers
- Refactoring prep

## Execution

### Step 1: Scan Patterns
```
CHECK:
- File naming conventions (camelCase, kebab-case)
- Component patterns (functional vs class)
- State management approach
- Error handling patterns
- API response format
```

### Step 2: Report Inconsistencies
```
FOUND:
1. Mixed naming: UserCard.tsx vs user-card.tsx
2. Inconsistent error handling: try/catch vs .catch()
3. Different state approaches: useState vs Zustand
```

### Step 3: Suggest Fixes
```
RECOMMENDATIONS:
- Standardize on kebab-case for files
- Use Zustand for global state
- Consistent error boundary pattern
```

## Output
- Consistency report
- Recommendations
- Migration plan
