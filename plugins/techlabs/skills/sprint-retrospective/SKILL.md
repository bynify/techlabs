# sprint-retrospective

Sprint retrospective to learn and improve for next sprint.

## When to Use
- After sprint done
- Before next sprint
- Learn from experience
- Improve process

## Agents to Dispatch
- quality-lead: Facilitate retro
- All agents: Provide feedback

## Enforcement

```
⚠️ MANDATORY: Sprint retrospective required after each sprint

SPRINT RETROSPECTIVE ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST COLLECT:
1. What went well? (positive)
2. What went wrong? (negative)
3. What to improve? (actionable)

MUST ANALYZE:
1. Root causes of issues
2. Patterns across sprints
3. Team dynamics
4. Process effectiveness

MUST CREATE:
1. Action items for improvement
2. Assign owners
3. Set deadlines
4. Track progress

RETROSPECTIVE RULES:
- Blameless (focus on process, not people)
- Actionable (clear next steps)
- Specific (not vague)
- Measurable (can track improvement)
```

## Execution

### Step 1: Load Sprint Data
```
READ:
- production/sprint/{sprint-id}/state.json
- production/sprint/{sprint-id}/stories.json
- production/sprint/{sprint-id}/daily/*.md
- production/sprint/{sprint-id}/metrics.json

EXTRACT:
- Stories completed
- Stories not completed
- Blockers encountered
- Timeline adherence
- Quality metrics
```

### Step 2: Collect Feedback
```
FROM EACH AGENT:

1. What went well this sprint?
2. What went wrong this sprint?
3. What should we improve next sprint?

COLLECT:
- Individual feedback
- Team feedback
- Process feedback
- Technical feedback
```

### Step 3: Analyze Sprint
```javascript
async function analyzeSprint(sprintData) {
  return {
    velocity: {
      planned: sprintData.plannedStories,
      completed: sprintData.completedStories,
      carryover: sprintData.carryoverStories
    },
    timeline: {
      plannedDays: sprintData.plannedDays,
      actualDays: sprintData.actualDays,
      onTime: sprintData.actualDays <= sprintData.plannedDays
    },
    quality: {
      bugsFound: sprintData.bugsFound,
      bugsFixed: sprintData.bugsFixed,
      reviewCycles: sprintData.reviewCycles
    },
    blockers: {
      total: sprintData.blockers.length,
      resolved: sprintData.blockers.filter(b => b.resolved).length,
      unresolved: sprintData.blockers.filter(b => !b.resolved).length
    }
  };
}
```

### Step 4: Create Retrospective Report
```markdown
# Sprint Retrospective

## Sprint
{sprint_name}

## Date
{date}

## Participants
- {agent 1}
- {agent 2}
- {agent 3}

## Sprint Summary

### Velocity
- Planned: {planned} stories
- Completed: {completed} stories
- Carryover: {carryover} stories
- Velocity: {velocity}%

### Timeline
- Planned: {planned} days
- Actual: {actual} days
- On Time: {yes/no}

### Quality
- Bugs Found: {count}
- Bugs Fixed: {count}
- Review Cycles: {count}

### Blockers
- Total: {count}
- Resolved: {count}
- Unresolved: {count}

## What Went Well ✅

1. {positive 1}
2. {positive 2}
3. {positive 3}

## What Went Wrong ❌

1. {negative 1}
   - Root Cause: {cause}
   - Impact: {impact}

2. {negative 2}
   - Root Cause: {cause}
   - Impact: {impact}

3. {negative 3}
   - Root Cause: {cause}
   - Impact: {impact}

## What to Improve 🔄

1. {improvement 1}
   - Current: {current state}
   - Desired: {desired state}
   - Action: {what to do}

2. {improvement 2}
   - Current: {current state}
   - Desired: {desired state}
   - Action: {what to do}

3. {improvement 3}
   - Current: {current state}
   - Desired: {desired state}
   - Action: {what to do}

## Action Items

| Action | Owner | Due | Status |
|--------|-------|-----|--------|
| {action 1} | {owner} | {date} | {status} |
| {action 2} | {owner} | {date} | {status} |
| {action 3} | {owner} | {date} | {status} |

## Metrics for Next Sprint

| Metric | Last Sprint | Target |
|--------|-------------|--------|
| Velocity | {velocity}% | {target}% |
| On Time | {on_time}% | {target}% |
| Bugs | {count} | {target} |
| Blockers | {count} | {target} |

## Process Changes

### Change 1: {description}
- Reason: {reason}
- Expected Impact: {impact}

### Change 2: {description}
- Reason: {reason}
- Expected Impact: {impact}

## Team Feedback

### {agent_name}
- Feedback: {feedback}
- Suggestion: {suggestion}

### {agent_name}
- Feedback: {feedback}
- Suggestion: {suggestion}
```

### Step 5: Create Action Items
```
FROM RETROSPECTIVE:

FOR EACH IMPROVEMENT:
1. Create action item
2. Assign owner
3. Set deadline
4. Define success criteria

SAVE TO:
- production/sprint/{sprint-id}/retrospective.md
- production/sprint/action-items.json
```

### Step 6: Apply to Next Sprint
```
BEFORE NEXT SPRINT:

1. Review action items from last sprint
2. Check if action items completed
3. Apply process changes
4. Update sprint template
5. Share learnings with team
```

## Output
- Retrospective completed
- Issues identified
- Improvements planned
- Action items created
- Learnings applied to next sprint
