# scope-approval

Approve out-of-scope changes with multi-agent discussion and documentation.

## When to Use
- Dev finds additional changes needed
- Scope creep detection
- Tech debt discovery
- Unexpected issues

## Agents to Dispatch
- lead-engineer: Coordinate and decide
- security-lead: Security implications
- design-lead: Design impact
- product-manager: Feature impact
- devops-lead: Infrastructure impact
- quality-lead: Quality impact

## Enforcement

```
⚠️ MANDATORY: Multi-agent discussion + full documentation

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

DOCUMENTATION REQUIREMENTS:
  - All discussions documented
  - All decisions recorded
  - All feedback captured
  - Session state updated
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

### Step 2: Create Scope Change Request
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
```

### Step 3: Lead Identifies Affected Agents
```
ANALYZE change type:

IF API changed:
  → security-lead (auth/permission)
  → design-lead (if frontend affected)
  → quality-lead (testing)

IF Database changed:
  → security-lead (data security)
  → devops-lead (migration/deployment)
  → quality-lead (data integrity)

IF Architecture changed:
  → technical-director (architecture)
  → security-lead (security implications)
  → devops-lead (infrastructure)

IF New Feature:
  → product-manager (requirements)
  → design-lead (UI/UX)
  → security-lead (security)

IF Performance:
  → devops-lead (infrastructure)
  → quality-lead (testing)
```

### Step 4: Lead Discusses with Each Agent
```
⚠️ LEAD ALREADY KNOWS PROJECT CONTEXT (BUILT-IN KNOWLEDGE)

LEAD DOES NOT NEED TO READ DOCS:
- Project goals: Already known
- Tech stack: Already known
- Architecture: Already known
- API design: Already known
- Database schema: Already known

FOR EACH AFFECTED AGENT:

LEAD ASKS:
"Change request for {story-id}:
- Change: {description}
- Impact: {impact}
- Your area: {specific area}

Questions:
1. Does this impact your domain?
2. Any concerns?
3. Any recommendations?
4. Approve or reject?"

AGENT ANALYZES:
- Domain assessment
- Impact analysis
- Concerns identified

AGENT DECIDES:
- Status: APPROVED/APPROVED_WITH_CONDITIONS/REJECTED
- Conditions: {list if any}
- Concerns: {list}
- Recommendations: {list}

AGENT PROVIDES FEEDBACK:
- Detailed explanation
- Rationale for decision
- Implementation guidance
```

### Step 5: Document Agent Discussion
```json
// Save to production/scope-discussions/{scope-id}.json
{
  "scopeId": "SCOPE-001",
  "storyId": "AUTH-001",
  "date": "2024-01-15T10:30:00Z",
  "change": "Add phone field to users API",
  "requestedBy": "go-specialist",
  "coordinatedBy": "lead-engineer",
  "discussions": [
    {
      "agent": "security-lead",
      "timestamp": "2024-01-15T10:35:00Z",
      "domain": "Data Security",
      "analysis": "Phone is PII, must comply with GDPR/CCPA",
      "concerns": [
        "Phone must be encrypted at rest",
        "Phone must be masked in logs",
        "Must support deletion request"
      ],
      "recommendations": [
        "Use AES-256 encryption",
        "Mask first 6 digits in logs",
        "Add to PII deletion flow"
      ],
      "decision": "APPROVED_WITH_CONDITIONS",
      "conditions": [
        "Implement AES-256 encryption",
        "Add phone masking in logs",
        "Add to deletion capability",
        "Add to data export"
      ],
      "feedback": "Phone is PII, must be protected. Implement all security measures before production."
    },
    {
      "agent": "quality-lead",
      "timestamp": "2024-01-15T10:40:00Z",
      "domain": "Testing",
      "analysis": "New field requires validation and comprehensive testing",
      "concerns": [
        "Invalid phone formats",
        "Edge cases (empty, null, too long)",
        "Performance impact on queries"
      ],
      "recommendations": [
        "Add regex validation",
        "Write unit tests for all cases",
        "Write integration tests"
      ],
      "decision": "APPROVED_WITH_CONDITIONS",
      "conditions": [
        "Phone validation regex implementation",
        "Unit tests (100% coverage)",
        "Integration tests for API",
        "Edge case tests"
      ],
      "feedback": "Must have comprehensive test coverage before merge."
    },
    {
      "agent": "product-manager",
      "timestamp": "2024-01-15T10:45:00Z",
      "domain": "Features",
      "analysis": "User-facing change requires documentation",
      "concerns": [
        "Users need to know about new field",
        "API docs must be updated"
      ],
      "recommendations": [
        "Update user guide",
        "Add changelog entry",
        "Update API documentation"
      ],
      "decision": "APPROVED_WITH_CONDITIONS",
      "conditions": [
        "Update user guide",
        "Add changelog entry",
        "Update API docs"
      ],
      "feedback": "Documentation must be complete before release."
    },
    {
      "agent": "devops-lead",
      "timestamp": "2024-01-15T10:50:00Z",
      "domain": "Infrastructure",
      "analysis": "No infrastructure changes needed",
      "concerns": [],
      "recommendations": [],
      "decision": "APPROVED",
      "conditions": [],
      "feedback": "No infrastructure impact, can proceed."
    }
  ]
}
```

### Step 6: Lead Consolidates Feedback
```markdown
# Scope Approval Report

## Story: AUTH-001
## Date: 2024-01-15
## Lead: lead-engineer

## Change Requested
Add phone field to users API

## Agent Decisions Summary

| Agent | Domain | Decision | Conditions |
|-------|--------|----------|------------|
| security-lead | Data Security | ✅ APPROVED | 4 conditions |
| quality-lead | Testing | ✅ APPROVED | 4 conditions |
| product-manager | Features | ✅ APPROVED | 3 conditions |
| devops-lead | Infrastructure | ✅ APPROVED | 0 conditions |

## All Conditions (Consolidated)

### Security (from security-lead)
1. Implement AES-256 encryption for phone at rest
2. Mask phone in all logs (show last 4 digits only)
3. Add phone to PII deletion flow (GDPR compliance)
4. Add phone to data export (right to portability)

### Quality (from quality-lead)
5. Add phone validation regex
6. Write unit tests for validation (100% coverage)
7. Write integration tests for API endpoints
8. Test edge cases (invalid format, empty, null, too long)

### Documentation (from product-manager)
9. Update user guide with phone field usage
10. Add changelog entry for new feature
11. Update API documentation with request/response examples

### Infrastructure (from devops-lead)
12. No changes needed

## Final Decision
**Status:** ✅ APPROVED
**Total Conditions:** 11
**Estimated Effort:** +4 hours

## Next Steps
1. Lead runs /lead-docs-update
2. Developer implements all conditions
3. Lead reviews implementation
4. QA verifies all conditions met
```

### Step 7: Lead Updates Docs
```
RUN: /lead-docs-update

WITH:
- scopeId: SCOPE-001
- storyId: AUTH-001
- conditions: [list of all conditions]
- agentFeedback: [all agent feedback]
```

### Step 8: Lead Gives Feedback to Dev
```markdown
# Implementation Feedback

## To: go-specialist
## From: lead-engineer
## Story: AUTH-001
## Date: 2024-01-15

## Status: ✅ APPROVED

## What to Implement

### 1. Database Schema
```sql
-- Add phone column (nullable)
ALTER TABLE users ADD COLUMN phone VARCHAR(255);
```

### 2. API Changes
```json
// Request
{
  "name": "string",
  "email": "string",
  "phone": "string"  // NEW - optional
}

// Response
{
  "id": "uuid",
  "name": "string",
  "email": "string",
  "phone": "string",  // NEW - decrypted for display
  "createdAt": "datetime"
}
```

### 3. Security Implementation
```go
// Encrypt before save
func encryptPhone(phone string) string {
    // AES-256 encryption
}

// Mask for logs
func maskPhone(phone string) string {
    // Show last 4 digits only
    return "******" + phone[len(phone)-4:]
}
```

### 4. Validation
```go
// Phone validation regex
var phoneRegex = regexp.MustCompile(`^\+?[1-9]\d{1,14}$`)

func validatePhone(phone string) error {
    if !phoneRegex.MatchString(phone) {
        return errors.New("invalid phone format")
    }
    return nil
}
```

### 5. Tests Required
- [ ] Unit test: Valid phone format
- [ ] Unit test: Invalid phone format
- [ ] Unit test: Empty phone
- [ ] Unit test: Null phone
- [ ] Unit test: Phone encryption
- [ ] Unit test: Phone masking
- [ ] Integration test: Create user with phone
- [ ] Integration test: Update user phone
- [ ] Integration test: Get user with phone

### 6. Documentation Updates
- [ ] Update README.md
- [ ] Update API docs
- [ ] Add CHANGELOG entry

## Conditions Checklist
- [ ] All security measures implemented
- [ ] All tests written and passing
- [ ] All documentation updated
- [ ] No lint errors
- [ ] No type errors

## Review Process
After implementation:
1. Run /review-gate for code review
2. Run /gate-check for automated QA
3. Lead reviews all conditions
4. QA verifies all tests
```

### Step 9: Update Session State
```json
// Update .claude/sprint-state.json
{
  "stories": {
    "AUTH-001": {
      "status": "IN_PROGRESS",
      "scopeChanges": [
        {
          "id": "SCOPE-001",
          "description": "Add phone field to users API",
          "status": "APPROVED",
          "approvedBy": "lead-engineer",
          "conditions": 11,
          "conditionsMet": 0,
          "timestamp": "2024-01-15T10:30:00Z"
        }
      ]
    }
  }
}
```

### Step 10: Dev Implements
```
DEVELOPER FOLLOWS:

1. Read feedback from lead
2. Implement all changes
3. Write all tests
4. Update all docs
5. Self-review against conditions
6. Mark as ready for review
```

### Step 11: Lead Reviews
```
LEAD VERIFIES:

- [ ] All conditions met
- [ ] All tests passing
- [ ] All docs updated
- [ ] No regressions
- [ ] Security measures in place
- [ ] Quality standards met

IF ALL PASS → APPROVE
IF MISSING → REJECT with specific feedback
```

## Output
- Scope change documented
- Multi-agent discussion documented
- All conditions captured
- Feedback given to dev
- Implementation tracked
- Session state updated
- Resume capability enabled
