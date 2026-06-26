# stakeholder-demo

Demo completed features to stakeholders and collect feedback.

## When to Use
- After sprint done
- Before release
- Stakeholder feedback needed
- Feature validation

## Agents to Dispatch
- product-manager: Demo features
- lead-engineer: Technical demo

## Enforcement

```
⚠️ MANDATORY: Stakeholder demo required before release

STAKEHOLDER DEMO ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST DEMO:
1. All completed features
2. Feature benefits
3. User value
4. Technical achievements

MUST COLLECT:
1. Stakeholder feedback
2. Approval status
3. Change requests
4. Priorities adjustment

MUST DOCUMENT:
1. Demo content
2. Feedback received
3. Decisions made
4. Action items
```

## Execution

### Step 1: Prepare Demo
```
READ:
- production/sprint/{sprint-id}/state.json
- production/sprint/{sprint-id}/stories.json

EXTRACT:
- Completed features
- Feature descriptions
- Demo points
- Technical details
```

### Step 2: Create Demo Script
```markdown
# Demo Script

## Sprint
{sprint_name}

## Date
{date}

## Attendees
- {stakeholder 1}
- {stakeholder 2}
- {stakeholder 3}

## Demo Agenda

### 1. Welcome & Overview (5 min)
- Sprint summary
- Goals achieved

### 2. Feature 1: {name} (15 min)
**What it is:**
- {description}

**Why it matters:**
- {user value}

**Demo:**
- {step 1}
- {step 2}
- {step 3}

**Technical highlights:**
- {achievement}

### 3. Feature 2: {name} (15 min)
**What it is:**
- {description}

**Why it matters:**
- {user value}

**Demo:**
- {step 1}
- {step 2}
- {step 3}

**Technical highlights:**
- {achievement}

### 4. Q&A (10 min)
- Open for questions
- Address concerns

### 5. Feedback Collection (5 min)
- Stakeholder feedback
- Change requests
- Priorities

## Demo Checklist
- [ ] Demo environment ready
- [ ] Features deployed
- [ ] Test data prepared
- [ ] Demo script reviewed
- [ ] Attendees notified
```

### Step 3: Conduct Demo
```
DURING DEMO:

1. Present features
2. Show user value
3. Demonstrate functionality
4. Answer questions
5. Collect feedback
```

### Step 4: Collect Feedback
```
FROM STAKEHOLDERS:

1. APPROVAL STATUS
   - Approved for release?
   - Approved with changes?
   - Rejected?

2. FEEDBACK
   - What they liked
   - What they didn't like
   - What they want changed

3. CHANGE REQUESTS
   - New requirements
   - Modified requirements
   - Removed requirements

4. PRIORITIES
   - Priority changes
   - New features
   - Deferred features
```

### Step 5: Create Feedback Report
```markdown
# Stakeholder Demo Feedback

## Demo Date
{date}

## Sprint
{sprint_name}

## Approval Status
{APPROVED/APPROVED WITH CHANGES/REJECTED}

## Feedback

### Positive
- {positive feedback 1}
- {positive feedback 2}

### Negative
- {negative feedback 1}
- {negative feedback 2}

### Change Requests
| Request | Priority | Impact | Status |
|---------|----------|--------|--------|
| {request 1} | {priority} | {impact} | {status} |
| {request 2} | {priority} | {impact} | {status} |

## Action Items

| Action | Owner | Due | Status |
|--------|-------|-----|--------|
| {action 1} | {owner} | {date} | {status} |
| {action 2} | {owner} | {date} | {status} |

## Next Steps
1. {step 1}
2. {step 2}
3. {step 3}
```

### Step 6: Update Planning
```
FROM FEEDBACK:

IF CHANGE REQUESTS:
- Create new user stories
- Add to backlog
- Prioritize for next sprint

IF APPROVED:
- Proceed to release
- Update release notes
- Notify users
```

## Output
- Demo conducted
- Feedback collected
- Approval status documented
- Action items created
- Planning updated
