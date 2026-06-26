# refactor-apply

Apply refactoring with safety checks and verification.

## When to Use
- After refactor-detect
- Technical debt reduction
- Code quality improvement

## Execution

### Step 1: Load Analysis
```typescript
// Read from refactor-detect output
const analysis = await readFile('.claude/refactor/analysis.yaml');
const smells = parseYaml(analysis);

// Prioritize by impact/effort ratio
const prioritized = smells.sort((a, b) => {
  const impactA = a.severity === 'high' ? 3 : a.severity === 'medium' ? 2 : 1;
  const impactB = b.severity === 'high' ? 3 : b.severity === 'medium' ? 2 : 1;
  const effortA = a.effort === 'low' ? 1 : a.effort === 'medium' ? 2 : 3;
  const effortB = b.effort === 'low' ? 1 : b.effort === 'medium' ? 2 : 3;
  return (impactB / effortB) - (impactA / effortA);
});
```

### Step 2: Refactoring Patterns
```typescript
// Extract Function
function extractFunction(code: string, startLine: number, endLine: number, name: string): string {
  const lines = code.split('\n');
  const extracted = lines.slice(startLine, endLine + 1);
  
  // Create new function
  const newFunction = `\nfunction ${name}() {\n${extracted.map(l => '  ' + l).join('\n')}\n}\n`;
  
  // Replace with call
  lines.splice(startLine, endLine - startLine + 1, `  ${name}();`);
  
  return lines.join('\n') + newFunction;
}

// Extract Constant
function extractConstant(code: string, value: string, name: string): string {
  const constant = `const ${name} = ${value};`;
  return constant + '\n' + code.replace(new RegExp(value, 'g'), name);
}

// Reduce Nesting (early returns)
function reduceNesting(code: string): string {
  // Convert:
  //   if (condition) {
  //     // deep code
  //   }
  // To:
  //   if (!condition) return;
  //   // code
  return code.replace(
    /if\s*\(([^)]+)\)\s*\{([\s\S]*?)\}/g,
    (match, condition, body) => {
      if (body.includes('return') || body.includes('else')) {
        return match; // Can't simplify
      }
      return `if (!${condition}) return;\n${body.trim()}`;
    }
  );
}
```

### Step 3: Apply with Safety
```typescript
interface RefactorResult {
  file: string;
  change: string;
  success: boolean;
  testsPass: boolean;
  backup: string;
}

async function applyRefactor(smell: CodeSmell): Promise<RefactorResult> {
  // 1. Create backup
  const backup = await readFile(smell.file);
  await writeFile(`${smell.file}.backup`, backup);

  // 2. Apply refactoring
  const content = await readFile(smell.file);
  let refactored: string;

  switch (smell.type) {
    case 'long-function':
      refactored = await refactorLongFunction(content, smell);
      break;
    case 'deep-nesting':
      refactored = reduceNesting(content);
      break;
    case 'magic-number':
      refactored = extractConstant(content, smell.magicValue, smell.constantName);
      break;
    case 'duplication':
      refactored = await extractCommonCode(content, smell);
      break;
    default:
      return { file: smell.file, change: 'none', success: false, testsPass: false, backup };
  }

  // 3. Write refactored code
  await writeFile(smell.file, refactored);

  // 4. Run tests
  const testsPass = await runTests(smell.file);

  // 5. Rollback if tests fail
  if (!testsPass) {
    await writeFile(smell.file, backup);
    return { file: smell.file, change: 'rolled back', success: false, testsPass: false, backup };
  }

  // 6. Remove backup
  await deleteFile(`${smell.file}.backup`);

  return {
    file: smell.file,
    change: smell.suggestion,
    success: true,
    testsPass: true,
    backup: '',
  };
}
```

### Step 4: Track Changes
```yaml
# .claude/refactor/applied.yaml
applied_at: "2024-03-15T11:00:00Z"

changes:
  - file: src/api/handlers.ts
    type: long-function
    before: "handleUserRequest: 120 lines"
    after: "handleUserRequest: 25 lines + 4 extracted functions"
    tests_pass: true

  - file: src/utils/helpers.ts
    type: magic-number
    before: "if (count > 100)"
    after: "if (count > MAX_BATCH_SIZE)"
    tests_pass: true

  - file: src/components/Form.tsx
    type: deep-nesting
    before: "6 levels of nesting"
    after: "Early returns, max 3 levels"
    tests_pass: true

summary:
  total_applied: 15
  tests_pass: 15
  tests_fail: 0
  rolled_back: 0
```

### Step 5: Verify Improvements
```bash
# Run linter
npm run lint

# Run tests
npm test

# Check type safety
npm run typecheck

# Measure improvement
# Before: 23 code smells
# After: 8 code smells (-65%)
```

### Step 6: Generate Report
```markdown
# Refactoring Report

## Summary
- Smells detected: 23
- Smells fixed: 15
- Rolled back: 0
- Success rate: 100%

## Changes Applied

### 1. src/api/handlers.ts
**Before:** handleUserRequest function (120 lines)
**After:** 5 focused functions (25 lines each)
**Impact:** Easier to test, understand, and maintain

### 2. src/utils/helpers.ts
**Before:** 6 magic numbers
**After:** Named constants (MAX_BATCH_SIZE, TIMEOUT_MS, etc.)
**Impact:** Self-documenting code

### 3. src/components/Form.tsx
**Before:** 6 levels of nesting
**After:** Early returns, max 3 levels
**Impact:** Improved readability

## Remaining Smells (8)
- 3 long functions (complex, need careful refactoring)
- 2 duplication blocks (cross-file, need shared module)
- 3 low-priority items

## Next Steps
1. Review remaining long functions
2. Create shared utility module for duplicated code
```

## Output
- .claude/refactor/applied.yaml
- Refactored code files
- Test results
- Improvement report
