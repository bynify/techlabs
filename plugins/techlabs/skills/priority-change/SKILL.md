# priority-change

Handle mid-sprint priority changes.

## When to Use
- Emergency priority change
- Business needs changed
- Critical bug found
- Stakeholder request

## Agents to Dispatch
- product-manager: Priority decision
- lead-engineer: Implementation impact
- All agents: Affected by change

## Enforcement

```
⚠️ MANDATORY: Priority changes require approval

PRIORITY CHANGE ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST DOCUMENT:
1. Reason for change
2. Impact on sprint
3. Impact on timeline
4. Approval status

MUST APPROVE:
1. Product owner approval
2. Lead engineer approval
3. Team notification

MUST UPDATE:
1. Sprint plan
2. Story assignments
3. Timeline
4. Stakeholder communication
```

## Execution

### Step 1: Request Priority Change
```
REASON FOR CHANGE:
- {emergency/business need/critical bug/stakeholder request}

DESCRIPTION:
- {what needs to change}

IMPACT:
- {what will be affected}

URGENCY:
- {high/medium/low}
```

### Step 2: Analyze Impact
```
IMPACT ANALYSIS:

CURRENT SPRINT:
- Stories in progress: {count}
- Stories completed: {count}
- Stories pending: {count}

CHANGE IMPACT:
- Stories to be added: {count}
- Stories to be removed: {count}
- Stories to be re-prioritized: {count}

TIMELINE IMPACT:
- Current timeline: {timeline}
- New timeline: {timeline}
- Delay: {days}

RESOURCE IMPACT:
- Current resources: {resources}
- Additional resources: {resources}
- Resource shortage: {resources}
```

### Step 3: Create Change Proposal
```markdown
# Priority Change Proposal

## Request Date
{date}

## Requested By
{name}

## Reason for Change
{description}

## Change Details

### Current Priority
| Story | Priority | Status |
|-------|----------|--------|
| {story 1} | {priority} | {status} |
| {story 2} | {priority} | {status} |

### Proposed Change
| Story | New Priority | Impact |
|-------|--------------|--------|
| {story 1} | {priority} | {impact} |
| {story 2} | {priority} | {impact} |

## Impact Analysis

### Sprint Impact
- Stories Affected: {count}
- Sprint Goal: {affected/not affected}

### Timeline Impact
- Original Timeline: {timeline}
- New Timeline: {timeline}
- Delay: {days}

### Resource Impact
- Additional Resources: {count}
- Resource Reallocation: {description}

### Risk Impact
- Risk Level: {high/medium/low}
- Risks: {description}

## Approval

| Role | Name | Status | Date |
|------|------|--------|------|
| Product Owner | {name} | {status} | {date} |
| Lead Engineer | {name} | {status} | {date} |
| Team | {name} | {status} | {date} |
```

### Step 4: Get Approval
```
APPROVAL REQUIRED:

1. PRODUCT OWNER
   - Approves business justification
   - Approves priority change
   - Approves timeline impact

2. LEAD ENGINEER
   - Approves technical feasibility
   - Approves resource allocation
   - Approves risk mitigation

3. TEAM NOTIFICATION
   - Notify affected agents
   - Explain change
   - Update assignments

ALL MUST AGREE
```

### Step 5: Implement Change
```
AFTER APPROVAL:

1. UPDATE SPRINT PLAN
   - Add new stories
   - Remove stories
   - Re-prioritize stories

2. UPDATE STORY ASSIGNMENTS
   - Reassign stories
   - Update deadlines
   - Notify agents

3. UPDATE TIMELINE
   - Adjust timeline
   - Update milestones
   - Communicate changes

4. UPDATE STAKEHOLDERS
   - Notify stakeholders
   - Explain changes
   - Set new expectations
```

### Step 6: Track Impact
```
AFTER CHANGE:

1. MONITOR IMPACT
   - Track story completion
   - Track timeline adherence
   - Track quality metrics

2. ADJUST IF NEEDED
   - If timeline slips → adjust
   - If quality drops → adjust
   - If scope increases → adjust

3. REPORT STATUS
   - Daily status updates
   - Weekly progress reports
   - End of sprint report
```

## Output
- Priority change requested
- Impact analyzed
- Approval obtained
- Sprint plan updated
- Timeline adjusted
