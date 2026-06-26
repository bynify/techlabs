# Chunk Writes Rule

## Rule: Write/Edit Operations MUST Use Small Chunks

### Problem
Large file writes cause:
- LLM timeouts
- High token usage
- Slow response time
- Provider rate limits

### Solution
Split all writes into small, atomic chunks.

## Chunk Size Limits

```
WRITE LIMITS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

edit operations:
- MAX: 20 lines per edit call
- PREFERRED: 10-15 lines per edit call
- NEVER: 50+ lines in single edit

write operations:
- MAX: 50 lines per write call
- PREFERRED: 30-40 lines per write call
- NEVER: 100+ lines in single write

split strategy:
- File < 50 lines → 1 write call
- File 50-100 lines → 2 write calls
- File 100-200 lines → 3-4 write calls
- File 200+ lines → 5+ write calls
```

## Examples

### ❌ BAD: Single Large Write
```javascript
// This causes timeout
write({
  path: "skills/new-skill/SKILL.md",
  content: `# skill-name
  
## When to Use
... (100+ lines) ...
## Execution
... (100+ lines) ...
## Output
... (50+ lines) ...`
})
```

### ✅ GOOD: Chunked Writes
```javascript
// Step 1: Write header + When to Use
write({
  path: "skills/new-skill/SKILL.md",
  content: `# skill-name

## When to Use
- Use case 1
- Use case 2

## Execution`
})

// Step 2: Add execution steps
edit({
  path: "skills/new-skill/SKILL.md",
  edits: [{
    oldText: "## Execution",
    newText: `## Execution

### Step 1: First Step
\`\`\`
CODE HERE
\`\`\`

### Step 2: Second Step
\`\`\`
CODE HERE
\`\`\``
  }]
})

// Step 3: Add output section
edit({
  path: "skills/new-skill/SKILL.md",
  edits: [{
    oldText: "## Execution\n\n### Step 2: Second Step",
    newText: `### Step 2: Second Step
\`\`\`
CODE HERE
\`\`\`

## Output
- Output 1
- Output 2`
  }]
})
```

## Implementation Pattern

### For New Files
```
1. write() → Create file with header (20-30 lines)
2. edit() → Add section 1 (15-20 lines)
3. edit() → Add section 2 (15-20 lines)
4. edit() → Add section 3 (15-20 lines)
5. edit() → Add final section (10-15 lines)
```

### For Existing Files
```
1. read() → Understand current structure
2. edit() → Change 1 (small chunk)
3. edit() → Change 2 (small chunk)
4. edit() → Change 3 (small chunk)
```

## Enforcement

### Pre-Write Check
```
BEFORE any write/edit:
1. Count lines to write
2. If > 20 lines for edit → SPLIT
3. If > 50 lines for write → SPLIT
4. Execute in chunks
```

### Post-Write Verification
```
AFTER write/edit:
1. Verify file saved correctly
2. Check for truncation
3. Continue to next chunk
```

## Benefits

1. **No Timeouts**: Small operations complete quickly
2. **Lower Tokens**: Less context needed per operation
3. **Better UX**: Progress visible after each chunk
4. **Error Recovery**: If error, less to redo
5. **Streaming**: User sees progress in real-time

## Summary

| Operation | Max Lines | Preferred |
|-----------|-----------|-----------|
| edit | 20 | 10-15 |
| write | 50 | 30-40 |
| New file | 50 | 30-40 |
| Large file | 5 chunks | 3-4 chunks |
