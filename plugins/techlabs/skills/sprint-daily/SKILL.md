# sprint-daily

Daily standup during sprint to track progress and blockers.

## When to Use
- Every day during sprint
- Track daily progress
- Identify blockers
- Update status

## Agents to Dispatch
- lead-engineer: Coordinate standup
- All agents: Report status

## Enforcement

```
⚠️ MANDATORY: Daily standup required during sprint

DAILY STANDUP ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EACH AGENT MUST REPORT:
1. Yesterday's progress (what was completed)
2. Today's plan (what will be done)
3. Blockers (what's blocking progress)

LEAD MUST:
1. Track overall progress
2. Identify blockers
3. Assign help
4. Update status
5. Adjust plan if needed

REPORT FORMAT:
- Story ID: {id}
- Status: {In Progress/Blocked/Done}
- Yesterday: {what was completed}
- Today: {what will be done}
- Blockers: {what's blocking}
- ETA: {estimated completion}
```

## Execution

### Step 1: Load Sprint State
```
READ:
- production/sprint/{sprint-id}/state.json
- production/sprint/{sprint-id}/stories.json

EXTRACT:
- All stories in sprint
- Current status of each story
- Assigned agents
- Blockers
```

### Step 2: Collect Agent Reports
```
FOR EACH AGENT IN SPRINT:

REQUEST:
1. What did you complete yesterday?
2. What will you work on today?
3. Any blockers?

COLLECT:
- Story progress
- Blockers identified
- Help needed
```

### Step 3: Create Daily Report
```markdown
# Daily Standup Report

## Sprint
{sprint_name}

## Date
{date}

## Summary
- Stories In Progress: {count}
- Stories Completed: {count}
- Stories Blocked: {count}
- Overall Progress: {percentage}%

## Agent Reports

### {agent_name}
**Yesterday:**
- {completed task 1}
- {completed task 2}

**Today:**
- {planned task 1}
- {planned task 2}

**Blockers:**
- {blocker 1}
- {blocker 2}

**ETA:** {date}

### {agent_name}
**Yesterday:**
- {completed task 1}

**Today:**
- {planned task 1}

**Blockers:**
- None

**ETA:** {date}

## Blockers Identified

### Blocker 1: {description}
- Affected Stories: {stories}
- Impact: {High/Medium/Low}
- Action: {what needs to happen}
- Owner: {who will fix}

### Blocker 2: {description}
- Affected Stories: {stories}
- Impact: {High/Medium/Low}
- Action: {what needs to happen}
- Owner: {who will fix}

## Risks

### Risk 1: {description}
- Likelihood: {High/Medium/Low}
- Impact: {High/Medium/Low}
- Mitigation: {what to do}

## Plan Adjustments

### Adjustment 1: {description}
- Reason: {reason}
- Action: {what to change}
- Impact: {what's affected}

## Action Items

| Action | Owner | Due | Status |
|--------|-------|-----|--------|
| {action 1} | {owner} | {date} | {status} |
| {action 2} | {owner} | {date} | {status} |

## Next Standup
{date}
```

### Step 4: Update Sprint State
```
UPDATE:
- production/sprint/{sprint-id}/state.json
  - dailyReports: [{date: {date}, report: {report}}]
  - blockers: [{blocker}]
  - risks: [{risk}]

SAVE TO:
- production/sprint/{sprint-id}/daily/{date}.md
```

### Step 5: Handle Blockers
```
IF BLOCKER IDENTIFIED:

1. IDENTIFY BLOCKER TYPE
   - Technical blocker → lead-engineer
   - Resource blocker → project-manager
   - Dependency blocker → dependency-tracking
   - Knowledge blocker → knowledge-base

2. ASSIGN BLOCKER OWNER
   - Lead assigns owner
   - Owner creates action plan
   - Owner reports progress

3. ESCALATE IF NEEDED
   - If blocker not resolved in 24h → escalate
   - If blocker affects critical path → escalate
   - If blocker affects multiple stories → escalate

4. TRACK BLOCKER RESOLUTION
   - Daily check on blocker status
   - Update sprint state
   - Report to team
```

### Step 6: Adjust Sprint Plan (IF NEEDED)
```
IF SPRINT AT RISK:

1. IDENTIFY RISK
   - Stories behind schedule?
   - Blockers unresolved?
   - Scope increased?

2. PROPOSE ADJUSTMENTS
   - Re-prioritize stories
   - Add resources
   - Remove scope
   - Extend timeline

3. GET APPROVAL
   - Product owner approves
   - Lead approves
   - Team agrees

4. UPDATE PLAN
   - Update sprint state
   - Update story assignments
   - Update timeline
```

## Output
- Daily standup completed
- Progress tracked
- Blockers identified
- Risks identified
- Plan adjusted if needed
