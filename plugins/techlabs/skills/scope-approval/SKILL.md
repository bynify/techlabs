# scope-approval

Approve out-of-scope changes with multi-agent discussion.

## When to Use
- Dev finds additional changes needed
- Scope creep detection
- Tech debt discovery
- Unexpected issues

## Agents to Dispatch
- lead-engineer: Coordinate and decide
- security-lead: If security impact
- design-lead: If design impact
- product-manager: If feature impact
- devops-lead: If infrastructure impact
- quality-lead: If quality impact

## Enforcement

```
⚠️ MANDATORY: Multi-agent discussion before approval

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

APPROVAL FLOW:
  dev-story → finds out-of-scope change
       ↓
  scope-approval (THIS SKILL)
       ↓
  Lead identifies affected agents
       ↓
  Lead discusses with each agent
       ↓
  Each agent provides feedback
       ↓
  Lead consolidates feedback
       ↓
  Lead makes final decision
       ↓
  IF approved → lead-docs-update
       ↓
  IF rejected → revert change
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
  → product-manager (feature impact)

IF New Feature:
  → product-manager (requirements)
  → design-lead (UI/UX)
  → security-lead (security)
  → quality-lead (testing)

IF Performance:
  → devops-lead (infrastructure)
  → quality-lead (testing)
```

### Step 4: Lead Discusses with Each Agent
```
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

AGENT PROVIDES:
- Domain assessment
- Concerns identified
- Recommendations
- Approval/rejection
```

### Step 5: Multi-Agent Discussion Example
```markdown
# Multi-Agent Discussion: AUTH-001

## Change Request
Add phone field to users API

## Agent Feedback

### security-lead
**Domain:** Data security
**Impact:** LOW - Phone is PII
**Concerns:** Must encrypt at rest
**Recommendation:** Use AES-256 encryption
**Decision:** ✅ APPROVED (with encryption)

### quality-lead
**Domain:** Testing
**Impact:** MEDIUM - New validation needed
**Concerns:** Phone format validation
**Recommendation:** Add regex validation
**Decision:** ✅ APPROVED (with validation)

### devops-lead
**Domain:** Infrastructure
**Impact:** LOW - No migration needed
**Concerns:** None
**Recommendation:** None
**Decision:** ✅ APPROVED

### product-manager
**Domain:** Features
**Impact:** MEDIUM - User-facing change
**Concerns:** Documentation needed
**Recommendation:** Update user guide
**Decision:** ✅ APPROVED (with docs)

## Lead Decision
**Overall:** ✅ APPROVED
**Conditions:**
1. Encrypt phone at rest (security-lead)
2. Add phone validation (quality-lead)
3. Update user guide (product-manager)

## Documentation Updates Required
- [ ] api-design.md (add phone field)
- [ ] database-design.md (if schema change)
- [ ] security-docs.md (encryption notes)
- [ ] user-guide.md (new field)
```

### Step 6: Lead Makes Final Decision
```
CONSOLIDATE all agent feedback:

IF all agents approve:
  → APPROVE with conditions
  → Document conditions
  → Pass to lead-docs-update

IF any agent rejects:
  → Analyze rejection reason
  → Find alternative solution
  → Re-discuss with agents
  → Make final decision

IF mixed feedback:
  → Weigh concerns
  → Find compromise
  → Document decision rationale
```

### Step 7: Record Decision
```markdown
# Scope Approval Decision

## Story: {story-id}
## Date: {date}
## Lead: {lead-name}

## Change Requested
{description}

## Agent Consultations
| Agent | Domain | Concern | Decision |
|-------|--------|---------|----------|
| security-lead | Security | Encryption needed | ✅ Approved |
| quality-lead | Testing | Validation needed | ✅ Approved |
| devops-lead | Infrastructure | No impact | ✅ Approved |
| product-manager | Features | Documentation | ✅ Approved |

## Final Decision
**Status:** ✅ APPROVED

**Conditions:**
1. Implement phone encryption (security)
2. Add phone validation (quality)
3. Update user guide (product)

## Next Steps
1. Lead runs /lead-docs-update
2. Developer implements with conditions
3. QA verifies all conditions met
```

### Step 8: Notify Developer
```
SEND to developer:

"Scope change APPROVED

Conditions:
1. {condition 1}
2. {condition 2}
3. {condition 3}

Documentation will be updated by lead.
Proceed with implementation."
```

## Output
- Scope change documented
- Multi-agent discussion completed
- All concerns addressed
- Final decision recorded
- Developer notified
- Ready for lead-docs-update
