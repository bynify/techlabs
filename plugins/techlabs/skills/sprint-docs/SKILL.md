# sprint-docs

Sprint documentation requirements and tracking.

## When to Use
- Sprint planning
- Sprint execution
- Sprint review
- Sprint retrospective

## Enforcement

```
⚠️ MANDATORY: All sprint activities must be documented

DOCUMENTATION FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SPRINT START:
  ├─ Sprint goal documented
  ├─ Story list documented
  └─ Capacity documented

PER STORY:
  ├─ tech-plan (engineer)
  ├─ review-doc (reviewer)
  ├─ qa-report (QA)
  └─ story-done (verification)

SPRINT END:
  ├─ Sprint summary
  ├─ Metrics report
  └─ Retrospective notes
```

## Execution

### Step 1: Sprint Start Documentation
```markdown
# Sprint {X} Documentation

## Sprint Goal
{What we want to achieve}

## Stories
| Story | Points | Assignee | Status |
|-------|--------|----------|--------|
| AUTH-001 | 8 | go-specialist | Ready |
| UI-001 | 5 | ui-engineer | Ready |

## Capacity
- Team size: {X}
- Velocity: {X} points
- Sprint length: {X} days

## Risks
| Risk | Mitigation |
|------|------------|
| {risk} | {action} |
```

### Step 2: Per-Story Documentation Checklist
```
FOR EACH STORY:

ENGINEER MUST CREATE:
  - [ ] tech-plan/{story-id}.md
  - Technical design
  - Implementation steps
  - Risks identified

REVIEWER MUST CREATE:
  - [ ] reviews/{story-id}.md
  - Code quality assessment
  - Issues documented
  - Feedback provided

QA MUST CREATE:
  - [ ] qa-reports/{story-id}.md
  - Test results
  - Bugs reported
  - Acceptance criteria verified

STORY DONE REQUIRES:
  - [ ] All above docs exist
  - [ ] All docs reviewed
  - [ ] All issues resolved
```

### Step 3: Sprint Progress Tracking
```markdown
# Sprint Progress: Day {X}

## Stories Status
| Story | Status | Tech Plan | Review | QA Report |
|-------|--------|-----------|--------|-----------|
| AUTH-001 | In Progress | ✅ | ⏳ | ⏳ |
| UI-001 | Done | ✅ | ✅ | ✅ |

## Documentation Status
- Tech plans created: {X}/{total}
- Review reports created: {X}/{total}
- QA reports created: {X}/{total}

## Metrics
- Points completed: {X}/{total}
- Stories completed: {X}/{total}
- Bugs found: {X}
- Technical debt: {X}
```

### Step 4: Sprint End Documentation
```markdown
# Sprint {X} Summary

## Goal Achievement
**Sprint Goal:** {goal}
**Status:** ✅ ACHIEVED / ⚠️ PARTIALLY / ❌ NOT ACHIEVED

## Stories Completed
| Story | Points | Status | Notes |
|-------|--------|--------|-------|
| AUTH-001 | 8 | ✅ Done | On time |
| UI-001 | 5 | ✅ Done | 1 day late |

## Metrics
- Planned: {X} points
- Completed: {X} points
- Velocity: {X} points/sprint
- Bugs found: {X}
- Bugs fixed: {X}

## Documentation
- Tech plans: {X} created
- Review reports: {X} created
- QA reports: {X} created

## Retrospective
### What went well
- {item 1}
- {item 2}

### What to improve
- {item 1}
- {item 2}

### Action items
- [ ] {action 1}
- [ ] {action 2}
```

### Step 5: Documentation Validation
```
AT SPRINT END:

CHECK ALL DOCUMENTATION:
- [ ] All tech plans exist
- [ ] All review reports exist
- [ ] All QA reports exist
- [ ] Sprint summary complete
- [ ] Retrospective documented

IF MISSING:
  → BLOCK sprint completion
  → Require documentation before closing
```

## Output
- Sprint documentation complete
- Per-story docs tracked
- Progress documented
- Metrics captured
- Retrospective documented
