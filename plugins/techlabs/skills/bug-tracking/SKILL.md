# bug-tracking

Track and manage bugs found during sprint.

## When to Use
- Bug found in QA
- Bug found in production
- Bug reported by user
- Bug in integration

## Agents to Dispatch
- qa-engineer: Bug reporting
- lead-engineer: Bug prioritization
- All agents: Fix bugs

## Enforcement

```
⚠️ MANDATORY: All bugs must be tracked

BUG TRACKING ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST TRACK:
1. Bug description
2. Bug severity
3. Bug priority
4. Bug status
5. Bug owner

MUST CATEGORIZE:
1. Critical (system down, data loss)
2. High (major feature broken)
3. Medium (feature partially broken)
4. Low (minor issue)

MUST PRIORITIZE:
1. Fix critical bugs immediately
2. Fix high bugs in current sprint
3. Fix medium bugs in next sprint
4. Fix low bugs when possible
```

## Execution

### Step 1: Report Bug
```
BUG REPORT:

Title: {bug title}

Description:
- What happened: {description}
- Expected behavior: {expected}
- Actual behavior: {actual}

Steps to Reproduce:
1. {step 1}
2. {step 2}
3. {step 3}

Environment:
- Browser: {browser}
- OS: {os}
- Version: {version}

Severity: {Critical/High/Medium/Low}
Priority: {P0/P1/P2/P3}
Found By: {name}
Found Date: {date}
```

### Step 2: Categorize Bug
```javascript
async function categorizeBug(bug) {
  return {
    severity: calculateSeverity(bug),
    priority: calculatePriority(bug),
    category: calculateCategory(bug)
  };
}

function calculateSeverity(bug) {
  // Critical: System down, data loss, security breach
  if (bug.type === 'system-down' || bug.type === 'data-loss' || bug.type === 'security') {
    return 'Critical';
  }
  
  // High: Major feature broken, no workaround
  if (bug.type === 'major-feature' && !bug.workaround) {
    return 'High';
  }
  
  // Medium: Feature partially broken, workaround exists
  if (bug.type === 'partial-feature' || bug.workaround) {
    return 'Medium';
  }
  
  // Low: Minor issue, cosmetic
  return 'Low';
}

function calculatePriority(bug) {
  const severity = calculateSeverity(bug);
  
  if (severity === 'Critical') return 'P0';
  if (severity === 'High') return 'P1';
  if (severity === 'Medium') return 'P2';
  return 'P3';
}
```

### Step 3: Create Bug Report
```markdown
# Bug Report

## Bug ID
BUG-{id}

## Title
{bug title}

## Description
{description}

## Steps to Reproduce
1. {step 1}
2. {step 2}
3. {step 3}

## Expected Behavior
{expected behavior}

## Actual Behavior
{actual behavior}

## Environment
- Browser: {browser}
- OS: {os}
- Version: {version}

## Screenshots
{screenshots}

## Severity
{Critical/High/Medium/Low}

## Priority
{P0/P1/P2/P3}

## Status
{Open/In Progress/Resolved/Closed}

## Assigned To
{name}

## Found By
{name}

## Found Date
{date}

## Resolution
{resolution}

## Resolution Date
{date}

## Notes
{notes}
```

### Step 4: Track Bug Status
```
BUG STATUS:

1. OPEN
   - Bug reported
   - Bug triaged
   - Bug assigned

2. IN PROGRESS
   - Bug being investigated
   - Bug being fixed
   - Bug being tested

3. RESOLVED
   - Bug fixed
   - Fix verified
   - Ready for QA

4. CLOSED
   - Bug verified in QA
   - Bug deployed
   - Bug confirmed fixed

5. REOPENED
   - Bug not fixed
   - Bug reintroduced
   - New information found
```

### Step 5: Create Bug Dashboard
```markdown
# Bug Dashboard

## Date
{date}

## Bug Summary
- Total Bugs: {count}
- Open: {count}
- In Progress: {count}
- Resolved: {count}
- Closed: {count}

## Bugs by Priority
| Priority | Count | Status |
|----------|-------|--------|
| P0 | {count} | {status} |
| P1 | {count} | {status} |
| P2 | {count} | {status} |
| P3 | {count} | {status} |

## Bugs by Component
| Component | Count | Status |
|-----------|-------|--------|
| {component 1} | {count} | {status} |
| {component 2} | {count} | {status} |

## Open Bugs

### P0 (Critical)
| Bug | Description | Assigned To | Status |
|-----|-------------|-------------|--------|
| BUG-{id} | {description} | {name} | {status} |

### P1 (High)
| Bug | Description | Assigned To | Status |
|-----|-------------|-------------|--------|
| BUG-{id} | {description} | {name} | {status} |

### P2 (Medium)
| Bug | Description | Assigned To | Status |
|-----|-------------|-------------|--------|
| BUG-{id} | {description} | {name} | {status} |

### P3 (Low)
| Bug | Description | Assigned To | Status |
|-----|-------------|-------------|--------|
| BUG-{id} | {description} | {name} | {status} |

## Bug Trends
- New Bugs This Sprint: {count}
- Resolved Bugs This Sprint: {count}
- Bug Resolution Rate: {rate}%
```

### Step 6: Assign Bugs to Sprint
```
FOR EACH BUG:

1. DETERMINE SPRINT ASSIGNMENT
   - P0 bugs → Current sprint (immediate)
   - P1 bugs → Current sprint (priority)
   - P2 bugs → Next sprint
   - P3 bugs → Backlog

2. CREATE BUG STORY
   - Title: Fix {bug title}
   - Description: {bug details}
   - Priority: {priority}
   - Effort: {estimate}

3. ASSIGN TO SPRINT
   - Add to sprint backlog
   - Assign to agent
   - Track progress
```

### Step 7: Prevent Future Bugs
```
FROM BUG ANALYSIS:

1. ROOT CAUSE ANALYSIS
   - Why did bug occur?
   - What allowed bug to slip through?
   - How to prevent similar bugs?

2. PROCESS IMPROVEMENT
   - Add test coverage
   - Add code review checks
   - Add quality gates

3. DOCUMENTATION
   - Document bug pattern
   - Update best practices
   - Share learnings
```

## Output
- Bugs tracked
- Bugs prioritized
- Bugs assigned to sprints
- Bug dashboard created
- Bug prevention measures added
