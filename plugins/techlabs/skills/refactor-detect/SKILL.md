# refactor-detect

Detect code smells and refactoring opportunities with concrete analysis.

## When to Use
- Code quality review
- Pre-refactoring analysis
- Technical debt assessment
- Sprint planning

## Execution

### Step 1: Scan Codebase
```bash
# Find long functions
awk '/^function|^func|^def |^async function/ {start=NR; name=$0} /^}/ {if(NR-start>50) print FILENAME":"start": "name}' src/**/*.ts src/**/*.go

# Find deep nesting
grep -rn "^\s\{24,\}" src/ | head -20

# Find TODO/FIXME
grep -rn "TODO\|FIXME\|HACK\|XXX" src/ | wc -l
```

### Step 2: Code Smell Detection
```typescript
// .claude/refactor/smells.json
interface CodeSmell {
  id: string;
  type: 'long-function' | 'deep-nesting' | 'duplication' | 'god-class' | 'magic-number' | 'dead-code';
  file: string;
  line: number;
  severity: 'high' | 'medium' | 'low';
  description: string;
  suggestion: string;
  effort: 'low' | 'medium' | 'high';
}

async function detectSmells(files: string[]): Promise<CodeSmell[]> {
  const smells: CodeSmell[] = [];

  for (const file of files) {
    const content = await readFile(file);
    const lines = content.split('\n');

    // Long functions
    smells.push(...detectLongFunctions(file, lines));

    // Deep nesting
    smells.push(...detectDeepNesting(file, lines));

    // Magic numbers
    smells.push(...detectMagicNumbers(file, lines));

    // Duplication
    smells.push(...detectDuplication(file, lines));
  }

  return smells;
}
```

### Step 3: Specific Detectors
```typescript
function detectLongFunctions(file: string, lines: string[]): CodeSmell[] {
  const smells: CodeSmell[] = [];
  let funcStart = -1;
  let funcName = '';
  let braceCount = 0;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    
    if (line.match(/^(export\s+)?(async\s+)?function\s+(\w+)/)) {
      funcStart = i;
      funcName = RegExp.$3;
      braceCount = 0;
    }

    braceCount += (line.match(/{/g) || []).length;
    braceCount -= (line.match(/}/g) || []).length;

    if (braceCount === 0 && funcStart >= 0) {
      const length = i - funcStart;
      if (length > 50) {
        smells.push({
          id: `long-func-${file}-${funcStart}`,
          type: 'long-function',
          file,
          line: funcStart + 1,
          severity: length > 100 ? 'high' : 'medium',
          description: `Function '${funcName}' is ${length} lines long`,
          suggestion: 'Break into smaller functions',
          effort: length > 100 ? 'high' : 'medium',
        });
      }
      funcStart = -1;
    }
  }

  return smells;
}

function detectDeepNesting(file: string, lines: string[]): CodeSmell[] {
  const smells: CodeSmell[] = [];

  for (let i = 0; i < lines.length; i++) {
    const indent = lines[i].search(/\S/);
    const nestingLevel = Math.floor(indent / 2);

    if (nestingLevel > 4) {
      smells.push({
        id: `deep-nest-${file}-${i}`,
        type: 'deep-nesting',
        file,
        line: i + 1,
        severity: nestingLevel > 6 ? 'high' : 'medium',
        description: `Deep nesting (${nestingLevel} levels) at line ${i + 1}`,
        suggestion: 'Extract inner logic to separate function',
        effort: 'medium',
      });
    }
  }

  return smells;
}

function detectMagicNumbers(file: string, lines: string[]): CodeSmell[] {
  const smells: CodeSmell[] = [];
  const magicNumberRegex = /(?<![.\w])\d{2,}(?!\w)/g;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    if (line.includes('//') || line.includes('const') || line.includes('let')) continue;

    const matches = line.match(magicNumberRegex);
    if (matches) {
      for (const match of matches) {
        if (!['100', '200', '201', '204', '400', '401', '403', '404', '500'].includes(match)) {
          smells.push({
            id: `magic-num-${file}-${i}`,
            type: 'magic-number',
            file,
            line: i + 1,
            severity: 'low',
            description: `Magic number ${match} at line ${i + 1}`,
            suggestion: `Extract to named constant: const TIMEOUT_MS = ${match}`,
            effort: 'low',
          });
        }
      }
    }
  }

  return smells;
}
```

### Step 4: Duplication Detection
```typescript
async function detectDuplication(file: string, lines: string[]): Promise<CodeSmell[]> {
  const smells: CodeSmell[] = [];
  const blockSize = 5;
  const blocks: Map<string, number[]> = new Map();

  for (let i = 0; i <= lines.length - blockSize; i++) {
    const block = lines.slice(i, i + blockSize)
      .map(l => l.trim())
      .filter(l => l.length > 0)
      .join('\n');

    if (block.length > 50) {
      const existing = blocks.get(block);
      if (existing) {
        existing.push(i);
      } else {
        blocks.set(block, [i]);
      }
    }
  }

  for (const [block, locations] of blocks) {
    if (locations.length > 1) {
      smells.push({
        id: `dup-${file}-${locations[0]}`,
        type: 'duplication',
        file,
        line: locations[0] + 1,
        severity: locations.length > 3 ? 'high' : 'medium',
        description: `Duplicated code at lines ${locations.map(l => l + 1).join(', ')}`,
        suggestion: 'Extract to shared function',
        effort: 'medium',
      });
    }
  }

  return smells;
}
```

### Step 5: Generate Report
```yaml
# .claude/refactor/analysis.yaml
analyzed_at: "2024-03-15T10:30:00Z"
files_scanned: 156
total_smells: 23

by_type:
  long-function: 8
  deep-nesting: 5
  duplication: 4
  magic-number: 6

by_severity:
  high: 5
  medium: 12
  low: 6

top_files:
  - file: src/api/handlers.ts
    smells: 4
    severity: high
  - file: src/utils/helpers.ts
    smells: 3
    severity: medium

recommendations:
  - priority: 1
    action: "Refactor src/api/handlers.ts - extract handler functions"
    effort: "4 hours"
    impact: "high"
  - priority: 2
    action: "Extract common patterns to shared utils"
    effort: "2 hours"
    impact: "medium"
```

### Step 6: Prioritize Refactoring
```
REFACTORING PRIORITY:

HIGH IMPACT, LOW EFFORT:
1. Extract magic numbers to constants (6 instances, 30min)
2. Remove code duplication (4 blocks, 1hr)

HIGH IMPACT, MEDIUM EFFORT:
3. Break long functions (8 functions, 3hr)
4. Reduce nesting depth (5 locations, 2hr)

MEDIUM IMPACT, LOW EFFORT:
5. Add error handling (3 locations, 30min)

TOTAL ESTIMATED EFFORT: 7 hours
EXPECTED IMPACT: -23 code smells
```

## Output
- .claude/refactor/smells.json
- .claude/refactor/analysis.yaml
- Prioritized refactoring list
- Effort estimates
