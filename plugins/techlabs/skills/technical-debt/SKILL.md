# technical-debt

Track and manage technical debt.

## When to Use
- Code quality issues found
- Quick fixes needed
- Refactoring needed
- Debt accumulation

## Agents to Dispatch
- lead-engineer: Debt tracking
- All agents: Report debt

## Enforcement

```
⚠️ MANDATORY: Technical debt must be tracked

TECHNICAL DEBT ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST TRACK:
1. Code debt (quick fixes, workarounds)
2. Architecture debt (design issues)
3. Documentation debt (missing docs)
4. Test debt (missing tests)
5. Infrastructure debt (outdated tools)

MUST CATEGORIZE:
1. Critical debt (must fix now)
2. High debt (fix soon)
3. Medium debt (fix when possible)
4. Low debt (fix when convenient)

MUST ALLOCATE:
1. Time for debt reduction
2. Resources for debt reduction
3. Priority for debt reduction
```

## Execution

### Step 1: Identify Debt
```
FOR EACH STORY:

1. CHECK FOR DEBT
   - Quick fixes?
   - Workarounds?
   - Missing tests?
   - Missing docs?
   - Design issues?

2. DOCUMENT DEBT
   - Debt type
   - Debt description
   - Debt impact
   - Debt priority

3. ESTIMATE EFFORT
   - Effort to fix
   - Effort to maintain
   - Risk of not fixing
```

### Step 2: Categorize Debt
```javascript
async function categorizeDebt(debtItems) {
  const categorized = {
    critical: [],
    high: [],
    medium: [],
    low: []
  };
  
  for (const debt of debtItems) {
    const category = categorizeDebtItem(debt);
    categorized[category].push(debt);
  }
  
  return categorized;
}

function categorizeDebtItem(debt) {
  // Critical: Security issues, data loss risks
  if (debt.type === 'security' || debt.type === 'data-loss') {
    return 'critical';
  }
  
  // High: Performance issues, major design issues
  if (debt.type === 'performance' || debt.impact === 'high') {
    return 'high';
  }
  
  // Medium: Code quality, missing tests
  if (debt.type === 'quality' || debt.type === 'testing') {
    return 'medium';
  }
  
  // Low: Documentation, minor improvements
  return 'low';
}
```

### Step 3: Create Debt Report
```markdown
# Technical Debt Report

## Date
{date}

## Debt Summary
- Total Debt Items: {count}
- Critical: {count}
- High: {count}
- Medium: {count}
- Low: {count}

## Debt by Category

### Critical Debt
| Item | Description | Impact | Effort | Status |
|------|-------------|--------|--------|--------|
| {item 1} | {description} | {impact} | {effort} | {status} |

### High Debt
| Item | Description | Impact | Effort | Status |
|------|-------------|--------|--------|--------|
| {item 1} | {description} | {impact} | {effort} | {status} |

### Medium Debt
| Item | Description | Impact | Effort | Status |
|------|-------------|--------|--------|--------|
| {item 1} | {description} | {impact} | {effort} | {status} |

### Low Debt
| Item | Description | Impact | Effort | Status |
|------|-------------|--------|--------|--------|
| {item 1} | {description} | {impact} | {effort} | {status} |

## Debt Trends
- New Debt This Sprint: {count}
- Resolved Debt This Sprint: {count}
- Total Debt Change: {change}

## Allocation
- Time for Debt Reduction: {percentage}%
- Stories for Debt: {count}
- Resources for Debt: {resources}

## Recommendations
1. {recommendation 1}
2. {recommendation 2}
3. {recommendation 3}
```

### Step 4: Create Debt Stories
```
FOR EACH CRITICAL/HIGH DEBT:

1. CREATE USER STORY
   - Title: Fix {debt type}: {description}
   - Description: {debt details}
   - Priority: {P0/P1}
   - Effort: {estimate}

2. ADD TO SPRINT
   - Add to current sprint (if critical)
   - Add to next sprint (if high)
   - Add to backlog (if medium/low)

3. ASSIGN
   - Assign to appropriate agent
   - Set deadline
   - Define success criteria
```

### Step 5: Track Debt Reduction
```
IN EACH SPRINT:

1. ALLOCATE TIME FOR DEBT
   - 20% of sprint capacity for debt
   - Prioritize critical/high debt
   - Track debt reduction progress

2. TRACK DEBT RESOLUTION
   - Mark debt items as resolved
   - Update debt report
   - Celebrate progress

3. PREVENT NEW DEBT
   - Code review for debt
   - Quality gates
   - Refactoring time
```

### Step 6: Update Knowledge Base
```
AFTER DEBT RESOLUTION:

1. UPDATE DOCUMENTATION
   - Document what was fixed
   - Document why it was fixed
   - Document lessons learned

2. UPDATE BEST PRACTICES
   - Update patterns
   - Update guidelines
   - Update standards

3. SHARE LEARNINGS
   - Team discussion
   - Knowledge sharing
   - Process improvement
```

## Output
- Debt identified
- Debt categorized
- Debt tracked
- Debt stories created
- Debt reduction planned
