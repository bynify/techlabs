# critical-thinking

Dev must think critically before implementing any task.

## When to Use
- Before implementing any story
- Before writing any code
- When task is ambiguous
- When task is incomplete
- When task is conflicting
- When agent wants to propose improvement
- When agent wants to challenge assumption
- When agent wants to suggest alternative
- When agent wants to raise concern

## Agents to Dispatch
- lead-agent: Clarification
- technical-director: Complex decisions

## Enforcement

```
⚠️ MANDATORY: Agents must think critically AND proactively

CRITICAL THINKING FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. REACTIVE (RECEIVING TASK)
   - Read task carefully
   - Identify issues
   - Ask questions
   - Wait for clarification
   - Implement

2. PROACTIVE (PROPOSING/CHALLENGING)
   - Analyze current approach
   - Identify improvements
   - Propose alternatives
   - Challenge assumptions
   - Raise concerns

AGENT PERSPECTIVES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

DEV:
- Implementation complexity
- Maintainability
- Code quality
- Technical debt

QA:
- Test coverage
- Edge cases
- Quality risks
- Regression potential

SECURITY:
- Vulnerabilities
- Compliance risks
- Data exposure
- Attack vectors

PERFORMANCE:
- Scalability
- Speed
- Resource usage
- Bottlenecks
```

## Execution

### Step 1: Read Task Carefully
```
READ:
- Story requirements
- Acceptance criteria
- Tech plan
- Architecture docs

EXTRACT:
- Goal: What are we building?
- Requirements: What must it do?
- Constraints: What limits do we have?
- Acceptance: How do we know it's done?
```

### Step 2: Identify Issues
```javascript
async function identifyIssues(task) {
  const issues = {
    ambiguous: [],
    incomplete: [],
    conflicting: [],
    missing: [],
    edgeCases: []
  };
  
  // Check for ambiguity
  issues.ambiguous = await checkAmbiguity(task);
  
  // Check for incompleteness
  issues.incomplete = await checkIncompleteness(task);
  
  // Check for conflicts
  issues.conflicting = await checkConflicts(task);
  
  // Check for missing info
  issues.missing = await checkMissingInfo(task);
  
  // Check for undefined edge cases
  issues.edgeCases = await checkEdgeCases(task);
  
  return issues;
}

async function checkAmbiguity(task) {
  const ambiguities = [];
  
  // Check vague words
  const vagueWords = ['should', 'might', 'could', 'maybe', 'possibly'];
  for (const word of vagueWords) {
    if (task.description.includes(word)) {
      ambiguities.push({
        type: 'vague_language',
        text: word,
        context: getContext(task.description, word)
      });
    }
  }
  
  // Check undefined terms
  const undefinedTerms = ['etc', 'and so on', 'and more'];
  for (const term of undefinedTerms) {
    if (task.description.includes(term)) {
      ambiguities.push({
        type: 'undefined_terms',
        text: term
      });
    }
  }
  
  return ambiguities;
}

async function checkIncompleteness(task) {
  const incomplete = [];
  
  // Missing acceptance criteria
  if (!task.acceptanceCriteria || task.acceptanceCriteria.length === 0) {
    incomplete.push({
      type: 'no_acceptance_criteria'
    });
  }
  
  // Missing error handling
  if (!task.description.includes('error')) {
    incomplete.push({
      type: 'no_error_handling'
    });
  }
  
  // Missing edge cases
  if (!task.description.includes('edge case')) {
    incomplete.push({
      type: 'no_edge_cases'
    });
  }
  
  return incomplete;
}

async function checkConflicts(task) {
  const conflicts = [];
  
  // Check for contradicting requirements
  const requirements = task.requirements || [];
  for (let i = 0; i < requirements.length; i++) {
    for (let j = i + 1; j < requirements.length; j++) {
      if (isConflicting(requirements[i], requirements[j])) {
        conflicts.push({
          type: 'conflicting_requirements',
          reqA: requirements[i],
          reqB: requirements[j]
        });
      }
    }
  }
  
  return conflicts;
}

async function checkMissingInfo(task) {
  const missing = [];
  
  // Missing data format
  if (task.description.includes('data') && !task.description.includes('format')) {
    missing.push({
      type: 'missing_data_format'
    });
  }
  
  // Missing API spec
  if (task.description.includes('API') && !task.description.includes('endpoint')) {
    missing.push({
      type: 'missing_api_spec'
    });
  }
  
  return missing;
}

async function checkEdgeCases(task) {
  const edgeCases = [];
  
  // Check for undefined scenarios
  if (!task.description.includes('null')) {
    edgeCases.push({
      type: 'no_null_handling'
    });
  }
  
  if (!task.description.includes('empty')) {
    edgeCases.push({
      type: 'no_empty_handling'
    });
  }
  
  return edgeCases;
}
```

### Step 3: Formulate Questions
```javascript
async function formulateQuestions(issues) {
  const questions = [];
  
  // Ambiguity questions
  for (const issue of issues.ambiguous) {
    questions.push({
      type: 'AMBIGUITY',
      question: `What does "${issue.text}" mean in this context?`,
      context: issue.context,
      severity: 'HIGH'
    });
  }
  
  // Incompleteness questions
  for (const issue of issues.incomplete) {
    questions.push({
      type: 'INCOMPLETE',
      question: `Missing: ${issue.type}. Please clarify.`,
      severity: 'HIGH'
    });
  }
  
  // Conflict questions
  for (const issue of issues.conflicting) {
    questions.push({
      type: 'CONFLICT',
      question: `Requirements conflict: ${issue.reqA} vs ${issue.reqB}. Which takes priority?`,
      severity: 'CRITICAL'
    });
  }
  
  // Missing info questions
  for (const issue of issues.missing) {
    questions.push({
      type: 'MISSING_INFO',
      question: `Missing information: ${issue.type}. Please provide.`,
      severity: 'MEDIUM'
    });
  }
  
  // Edge case questions
  for (const issue of issues.edgeCases) {
    questions.push({
      type: 'EDGE_CASE',
      question: `Edge case not defined: ${issue.type}. How should it be handled?`,
      severity: 'MEDIUM'
    });
  }
  
  return questions;
}
```

### Step 4: Ask Lead for Clarification
```
DEV ASKS LEAD:

"LEAD, I have questions before implementing:

AMBIGUITY:
1. What does "should be fast" mean? Specific ms target?
2. What does "etc" mean? Please list all items.

INCOMPLETE:
3. No acceptance criteria defined. What are they?
4. No error handling specified. What errors to handle?

CONFLICT:
5. Requirements conflict: "must be secure" vs "must be simple". Which priority?

MISSING INFO:
6. API endpoint not specified. What's the endpoint?
7. Data format not specified. What format?

EDGE CASES:
8. How to handle null input?
9. How to handle empty array?
10. How to handle large data (>10MB)?

Please clarify before I implement."
```

### Step 5: Wait for Lead Clarification
```
LEAD RESPONDS:

CLARIFICATION 1: "Fast means < 200ms response time"
CLARIFICATION 2: "Etc means: logging, monitoring, alerts"
CLARIFICATION 3: "Acceptance criteria: [list]"
CLARIFICATION 4: "Handle: invalid input, network error, timeout"
CLARIFICATION 5: "Security is priority, simplicity is nice-to-have"
CLARIFICATION 6: "API endpoint: /api/v1/users"
CLARIFICATION 7: "Data format: JSON"
CLARIFICATION 8: "Null input: return 400 error"
CLARIFICATION 9: "Empty array: return empty result"
CLARIFICATION 10: "Large data: paginate, max 100 per page"
```

### Step 6: Update Task with Clarity
```json
{
  "taskId": "AUTH-001",
  "originalTask": "Add user authentication",
  "clarifications": [
    {
      "question": "What does 'fast' mean?",
      "answer": "< 200ms response time",
      "type": "AMBIGUITY"
    },
    {
      "question": "No acceptance criteria",
      "answer": "1. Login works, 2. Logout works, 3. Token expires",
      "type": "INCOMPLETE"
    }
  ],
  "updatedRequirements": [
    "User can login with email/password",
    "User can logout",
    "Token expires after 24h",
    "Response time < 200ms",
    "Handle invalid credentials",
    "Handle network errors"
  ],
  "edgeCases": [
    "Null input → 400 error",
    "Empty password → 400 error",
    "Invalid email format → 400 error"
  ],
  "timestamp": "2026-06-26T10:00:00Z"
}
```

### Step 7: Now Implement
```
DEV IMPLEMENTS WITH CLARITY:

FOLLOW:
- Updated requirements (with clarifications)
- Edge cases (defined by lead)
- Error handling (specified by lead)
- Acceptance criteria (defined by lead)

NO GUESSING:
- If unclear → Ask again
- If changed → Ask again
- If new issue → Ask again
```

### Step 8: PROACTIVE THINKING (DURING IMPLEMENTATION)
```
⚠️ MANDATORY: Agent must think proactively during work

AGENT MUST:

1. IDENTIFY IMPROVEMENTS
   - Is there a better approach?
   - Can we simplify?
   - Can we optimize?
   - Can we reduce complexity?

2. CHALLENGE ASSUMPTIONS
   - Is this the right approach?
   - Are we solving the right problem?
   - Are we over-engineering?
   - Are we under-engineering?

3. RAISE CONCERNS
   - Will this scale?
   - Is this secure?
   - Will this break existing code?
   - Are we creating technical debt?

4. SUGGEST ALTERNATIVES
   - Better algorithm?
   - Better architecture?
   - Better design pattern?
   - Better tool?
```

### Step 9: Proactive Proposal
```
AGENT CAN PROPOSE:

DEV:
- "I think we should use X instead of Y because Z"
- "This approach will create tech debt, I suggest..."
- "We can simplify this by doing..."
- "This will be hard to maintain, better to..."

QA:
- "I suggest adding these test cases..."
- "This test approach won't cover edge cases"
- "We should test for X, Y, Z scenarios"
- "The acceptance criteria is missing..."

SECURITY:
- "This approach has security risk: ..."
- "We should encrypt X because..."
- "This violates compliance: ..."
- "Attack vector: ..."

PERFORMANCE:
- "This will not scale because..."
- "Memory usage will be high: ..."
- "Response time will exceed: ..."
- "We should cache X because..."
```

### Step 10: Lead Responds to Proposal
```
LEAD DECIDES:

IF PROPOSAL GOOD:
- Accept proposal
- Update task
- Implement proposal

IF PROPOSAL BAD:
- Reject proposal
- Explain why
- Continue current approach

IF NEEDS DISCUSSION:
- Discuss with other agents
- Make decision
- Update task
```

## Output
- Issues identified
- Questions formulated
- Clarifications received
- Task updated
- Proposals made
- Concerns raised
- Alternatives suggested
- Implementation ready
