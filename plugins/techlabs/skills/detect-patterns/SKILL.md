# detect-patterns

Detect recurring patterns in codebase for standardization and reuse.

## When to Use
- Code quality review
- Finding inconsistencies
- Identifying reusable patterns
- Pre-refactoring analysis

## Execution

### Step 1: Scan Codebase
```bash
# Find common patterns
grep -rn "function\|const.*=.*=>" src/ | head -50
grep -rn "try.*catch" src/ | head -50
grep -rn "fetch\|axios\|http" src/ | head -50
```

### Step 2: Pattern Categories
```typescript
// .claude/patterns/detected.json
interface DetectedPattern {
  id: string;
  type: 'naming' | 'error-handling' | 'api-call' | 'state' | 'component' | 'test';
  pattern: string;
  occurrences: number;
  files: string[];
  recommendation?: string;
}

// Storage
const patterns: DetectedPattern[] = [];
```

### Step 3: Naming Patterns
```typescript
// Detect naming conventions
async function detectNamingPatterns(files: string[]) {
  const patterns = {
    functions: { camelCase: 0, snake_case: 0, PascalCase: 0 },
    files: { kebabCase: 0, camelCase: 0, PascalCase: 0 },
    constants: { UPPER_SNAKE: 0, camelCase: 0 },
  };

  for (const file of files) {
    const basename = path.basename(file, path.extname(file));
    if (basename.includes('-')) patterns.files.kebabCase++;
    else if (basename[0] === basename[0].toUpperCase()) patterns.files.PascalCase++;
    else patterns.files.camelCase++;
  }

  return patterns;
}
```

### Step 4: Error Handling Patterns
```typescript
// Detect error handling approaches
async function detectErrorPatterns(files: string[]) {
  const patterns = {
    tryCatch: 0,
    resultType: 0,
    errorBoundary: 0,
    noHandling: 0,
  };

  for (const file of files) {
    const content = await fs.readFile(file, 'utf-8');
    if (content.includes('try {')) patterns.tryCatch++;
    if (content.includes('Result<') || content.includes('.isOk()')) patterns.resultType++;
    if (content.includes('ErrorBoundary')) patterns.errorBoundary++;
  }

  return patterns;
}
```

### Step 5: API Call Patterns
```typescript
// Detect API call approaches
async function detectApiPatterns(files: string[]) {
  const patterns = {
    fetch: 0,
    axios: 0,
    reactQuery: 0,
    swr: 0,
    customClient: 0,
  };

  for (const file of files) {
    const content = await fs.readFile(file, 'utf-8');
    if (content.includes('fetch(')) patterns.fetch++;
    if (content.includes('axios')) patterns.axios++;
    if (content.includes('useQuery') || content.includes('useMutation')) patterns.reactQuery++;
    if (content.includes('useSWR')) patterns.swr++;
  }

  return patterns;
}
```

### Step 6: Save Results
```yaml
# .claude/patterns/report.yaml
detected_at: "2024-03-15T10:30:00Z"
patterns:
  naming:
    functions: { camelCase: 45, snake_case: 5 }
    files: { kebabCase: 38, PascalCase: 12 }
    recommendation: "Use camelCase for functions, kebab-case for files"
  
  error_handling:
    tryCatch: 35
    errorBoundary: 8
    noHandling: 12
    recommendation: "Add error boundaries, handle remaining 12 unhandled errors"
  
  api_calls:
    fetch: 25
    reactQuery: 15
    recommendation: "Standardize on fetch + reactQuery"
```

### Step 7: Generate Recommendations
```
PATTERN ANALYSIS:

1. NAMING: Mixed conventions detected
   - Functions: 90% camelCase, 10% snake_case
   - RECOMMENDATION: Standardize on camelCase
   - FILES: src/utils/helper_func.ts, src/lib/user_service.ts

2. ERROR HANDLING: 12 files with no error handling
   - RECOMMENDATION: Add try/catch or error boundaries
   - FILES: src/api/users.ts, src/components/Form.tsx

3. STATE MANAGEMENT: Mixed approaches
   - useState: 25, Zustand: 8, Context: 5
   - RECOMMENDATION: Global state → Zustand, local → useState
```

## Output
- .claude/patterns/detected.json
- .claude/patterns/report.yaml
- Recommendations list
- Files to update
