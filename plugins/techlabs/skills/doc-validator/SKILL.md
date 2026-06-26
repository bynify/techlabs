# doc-validator

Validate document content quality, not just file existence.

## When to Use
- Before sprint planning
- Before sprint execution
- After document updates
- Quality gate for documents

## Agents to Dispatch
- product-manager: Requirements validation
- lead-engineer: Technical validation
- quality-lead: Quality standards

## Validation Levels

```
VALIDATION LEVELS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

LEVEL 1: EXISTENCE CHECK
  - File exists?
  - File not empty?
  → Basic validation

LEVEL 2: STRUCTURE CHECK
  - Required sections present?
  - Format correct?
  → Medium validation

LEVEL 3: CONTENT QUALITY CHECK
  - Minimum word count?
  - Key concepts covered?
  - No placeholders?
  → High validation

LEVEL 4: DEPTH CHECK
  - Detailed requirements?
  - Edge cases covered?
  - Security considered?
  → Full validation
```

## Execution

### Step 1: Validate PRD
```javascript
async function validatePRD() {
  const file = 'docs/PRD.md';
  const content = await readFile(file);
  
  const checks = [
    // Level 1: Existence
    { name: 'File exists', pass: await fileExists(file) },
    { name: 'Not empty', pass: content.length > 100 },
    
    // Level 2: Structure
    { name: 'Has title', pass: /^# .+/m.test(content) },
    { name: 'Has overview', pass: /## Overview|## Introduction/i.test(content) },
    { name: 'Has features', pass: /## Features|## User Stories/i.test(content) },
    { name: 'Has requirements', pass: /## Requirements|## Acceptance/i.test(content) },
    
    // Level 3: Content Quality
    { name: 'Min word count', pass: content.split(' ').length > 200 },
    { name: 'No TODO placeholders', pass: !/TODO|PLACEHOLDER|TBD/i.test(content) },
    { name: 'Has user stories', pass: /story|user.*want|as a/i.test(content) },
    { name: 'Has acceptance criteria', pass: /acceptance|criteria|given.*when.*then/i.test(content) },
    
    // Level 4: Depth
    { name: 'Edge cases', pass: /edge case|error|exception|handle/i.test(content) },
    { name: 'Security mentioned', pass: /security|auth|permission|encrypt/i.test(content) },
    { name: 'Performance', pass: /performance|latency|scale|cache/i.test(content) },
  ];
  
  const passed = checks.filter(c => c.pass).length;
  const total = checks.length;
  const score = Math.round((passed / total) * 100);
  
  return {
    score,
    passed,
    total,
    checks,
    ready: score >= 70  // 70% threshold
  };
}
```

### Step 2: Validate Architecture
```javascript
async function validateArchitecture() {
  const file = 'docs/architecture.md';
  const content = await readFile(file);
  
  const checks = [
    // Level 1: Existence
    { name: 'File exists', pass: await fileExists(file) },
    { name: 'Not empty', pass: content.length > 100 },
    
    // Level 2: Structure
    { name: 'Has title', pass: /^# .+/m.test(content) },
    { name: 'Has overview', pass: /## Overview|## System Design/i.test(content) },
    { name: 'Has components', pass: /## Components|## Services/i.test(content) },
    { name: 'Has data flow', pass: /## Data Flow|## Flow/i.test(content) },
    
    // Level 3: Content Quality
    { name: 'Min word count', pass: content.split(' ').length > 300 },
    { name: 'No TODO placeholders', pass: !/TODO|PLACEHOLDER|TBD/i.test(content) },
    { name: 'Has diagrams', pass: /diagram|mermaid|flowchart|```/i.test(content) },
    { name: 'API documented', pass: /api|endpoint|rest|graphql/i.test(content) },
    { name: 'Database mentioned', pass: /database|schema|table|model/i.test(content) },
    
    // Level 4: Depth
    { name: 'Security', pass: /security|auth|encrypt|protect/i.test(content) },
    { name: 'Scalability', pass: /scale|horizontal|vertical|load.?balanc/i.test(content) },
    { name: 'Monitoring', pass: /monitor|log|metric|alert/i.test(content) },
  ];
  
  const passed = checks.filter(c => c.pass).length;
  const total = checks.length;
  const score = Math.round((passed / total) * 100);
  
  return { score, passed, total, checks, ready: score >= 70 };
}
```

### Step 3: Validate All Documents
```javascript
async function validateAllDocuments() {
  const results = {
    prd: await validatePRD(),
    architecture: await validateArchitecture(),
    apiDesign: await validateAPIDesign(),
    databaseDesign: await validateDatabaseDesign(),
    stack: await validateStack(),
    epics: await validateEpics(),
    userStories: await validateUserStories(),
  };
  
  // Calculate overall score
  const totalScore = Object.values(results)
    .reduce((sum, r) => sum + r.score, 0) / Object.keys(results).length;
  
  const allReady = Object.values(results).every(r => r.ready);
  
  return {
    results,
    totalScore: Math.round(totalScore),
    allReady,
    failedDocs: Object.entries(results)
      .filter(([_, r]) => !r.ready)
      .map(([name, _]) => name)
  };
}
```

### Step 4: Generate Validation Report
```markdown
# Document Validation Report

## Date: 2024-01-15
## Sprint: 2024-S1

## Overall Score: 75/100 ✅

## Document Scores

| Document | Score | Status | Issues |
|----------|-------|--------|--------|
| PRD | 85/100 | ✅ PASS | - |
| Architecture | 70/100 | ✅ PASS | - |
| API Design | 65/100 | ❌ FAIL | Missing edge cases |
| Database Design | 80/100 | ✅ PASS | - |
| Stack | 90/100 | ✅ PASS | - |
| Epics | 75/100 | ✅ PASS | - |
| User Stories | 60/100 | ❌ FAIL | Missing acceptance criteria |

## Failed Checks

### API Design (65/100)
- ❌ Missing error handling documentation
- ❌ Missing rate limiting details
- ⚠️ No security considerations

### User Stories (60/100)
- ❌ Missing acceptance criteria for 3 stories
- ❌ No edge cases defined
- ⚠️ Estimates missing

## Required Actions
1. Complete API Design - Add error handling
2. Complete User Stories - Add acceptance criteria
3. Review Architecture - Add monitoring section

## Blockers
- Cannot start sprint until score >= 70
- Cannot start sprint until all critical docs pass
```

### Step 5: Block Sprint If Validation Fails
```javascript
async function checkSprintReadiness() {
  const validation = await validateAllDocuments();
  
  if (!validation.allReady) {
    console.log("=== SPRINT BLOCKED - VALIDATION FAILED ===");
    console.log(`Overall Score: ${validation.totalScore}/100`);
    console.log(`Required: 70/100`);
    console.log("\nFailed Documents:");
    for (const doc of validation.failedDocs) {
      console.log(`  ❌ ${doc}`);
    }
    
    const action = await askUser({
      question: "Validation failed. What to do?",
      options: [
        "Fix failed documents",
        "Retry validation",
        "Cancel sprint"
      ]
    });
    
    if (action === "Fix failed documents") {
      await fixFailedDocuments(validation.failedDocs);
    }
  }
  
  return validation.allReady;
}
```

## Output
- Document quality validated
- Scores calculated
- Failed documents identified
- Actions required
- Sprint blocked if validation fails
