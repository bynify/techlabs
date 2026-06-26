# scope-approval

Approve out-of-scope changes during development.

## When to Use
- Dev finds additional changes needed
- Scope creep detection
- Tech debt discovery
- Unexpected issues

## Agents to Dispatch
- lead-engineer: Approve scope changes
- technical-director: Major scope changes

## Enforcement

```
⚠️ MANDATORY: Out-of-scope changes require lead approval

SCOPE RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WITHIN SCOPE (no approval needed):
  - Task items from story
  - Direct implementation of acceptance criteria
  - Bug fixes within the feature
  - Refactoring within same file

OUT OF SCOPE (approval required):
  - New files not in task
  - Changes to other modules
  - API signature changes
  - Database schema changes
  - New dependencies
  - Architecture changes
  - Performance optimizations
  - Refactoring beyond task

FLOW:
  dev-story → finds out-of-scope change
       ↓
  scope-approval (THIS SKILL) ← MANDATORY
       ↓
  IF approved → lead-docs-update
       ↓
  Continue implementation
       ↓
  IF rejected → revert change, stay within scope
```

## Execution

### Step 1: Detect Scope Change
```
WHEN dev finds additional work:

CHECKLIST:
- [ ] Is this in the story/task?
- [ ] Is this in acceptance criteria?
- [ ] Is this directly required for the feature?
- [ ] Is this a bug fix within the feature?

IF ALL YES → Continue (no approval needed)
IF ANY NO → Requires approval
```

### Step 2: Document Scope Change
```markdown
# Scope Change Request

## Story: {story-id}
## Developer: {dev-name}
## Date: {date}

## Original Task
{description of original task}

## Discovered Change
{description of what was found}

## Why Needed
{reason this change is necessary}

## Impact Analysis
| Impact | Description |
|--------|-------------|
| Files affected | {list files} |
| Risk level | {low/medium/high} |
| Effort | {hours} |
| Dependencies | {what else needs change} |

## Options
1. **Include in current story** - Add scope
2. **Create follow-up story** - Backlog
3. **Skip** - Not needed now
4. **Reject** - Not needed ever

## Recommendation
{what dev thinks is best}
```

### Step 3: Request Lead Approval
```
SHOW scope change to lead-engineer

ASK:
"Out-of-scope change detected. Options:
1. Approve - Include in current story
2. Approve - Create follow-up story
3. Reject - Skip this change
4. Need more info"

LEAD DECISION:
- Review impact
- Check dependencies
- Assess risk
- Make decision
```

### Step 4: Lead Decision
```
IF APPROVED (include in story):
  → Update story scope
  → Update task list
  → Dev continues implementation
  → Lead will update docs

IF APPROVED (follow-up story):
  → Create new story
  → Link to current story
  → Dev continues within original scope

IF REJECTED:
  → Dev reverts change
  → Dev continues within original scope
  → No impact on timeline

IF NEED MORE INFO:
  → Lead asks questions
  → Dev provides details
  → Lead makes decision
```

### Step 5: Update Story State
```
UPDATE:
- story.changes = []
- story.changes.push({
    type: 'scope-change',
    description: change.description,
    approvedBy: lead.name,
    decision: decision,
    timestamp: new Date()
  })
```

## Output
- Scope change documented
- Lead approval obtained
- Decision recorded
- Story updated
