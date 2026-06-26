# lead-docs-update

Lead updates all related documentation after multi-agent approval.

## When to Use
- After scope approval
- API design changes
- Database design changes
- Architecture changes
- Any design-level changes

## Agents to Dispatch
- lead-engineer: Coordinate docs update
- security-lead: Security docs
- design-lead: Design docs
- devops-lead: Infrastructure docs
- quality-lead: Test docs
- product-manager: User-facing docs

## Enforcement

```
⚠️ MANDATORY: Lead updates docs after multi-agent approval

DOCUMENTATION UPDATES REQUIRED:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

API CHANGES:
  → Lead updates api-design.md
  → Lead updates OpenAPI spec
  → Lead updates README endpoints
  → Lead updates changelog

DATABASE CHANGES:
  → Lead updates database-design.md
  → Lead updates ER diagram
  → Lead updates migration plan
  → Lead updates changelog

ARCHITECTURE CHANGES:
  → Lead updates architecture docs
  → Lead updates system diagrams
  → Lead updates ADR (if decision)
  → Lead updates changelog

AGENT-SPECIFIC UPDATES:
  → security-lead: Security docs
  → design-lead: Design docs
  → devops-lead: Infrastructure docs
  → quality-lead: Test docs
  → product-manager: User-facing docs
```

## Execution

### Step 1: Lead Already Knows Context
```
⚠️ LEAD ALREADY KNOWS PROJECT CONTEXT (BUILT-IN KNOWLEDGE)

LEAD DOES NOT NEED TO READ DOCS:
- Project goals: Already known
- Tech stack: Already known
- Architecture: Already known
- API design: Already known
- Database schema: Already known

LEAD ONLY READS:
- Scope discussion record
- Agent feedback
- Implementation status
```

### Step 2: Create Documentation Update Report
```markdown
# Documentation Update Report

## Story: {story-id}
## Scope Change: {scope-id}
## Lead: {lead-name}
## Date: {date}

## Changes Made
| Document | Changes | Agent Source |
|----------|---------|--------------|
| api-design.md | Added phone field | security-lead |
| database-design.md | Added migration | quality-lead |
| security-docs.md | Added encryption | security-lead |
| quality-docs.md | Added test requirements | quality-lead |
| changelog.md | Added entry | product-manager |

## Agent Feedback Incorporated
| Agent | Feedback | Incorporated |
|-------|----------|--------------|
| security-lead | AES-256 encryption | ✅ |
| quality-lead | Validation regex | ✅ |
| product-manager | User guide update | ✅ |
```

### Step 3: Update API Design Docs
```markdown
# API Design Update

## Change Details
- **Story:** {story-id}
- **Approved by:** {lead-name}
- **Agents consulted:** {list agents}

## Changes
| Endpoint | Change | Before | After |
|----------|--------|--------|-------|
| /api/users | Added field | - | phone |

## Updated Endpoints
### POST /api/users
**Request:**
```json
{
  "name": "string",
  "email": "string",
  "phone": "string"  // NEW - Encrypted
}
```

**Response:**
```json
{
  "id": "uuid",
  "name": "string",
  "email": "string",
  "phone": "string",  // NEW - decrypted for display
  "createdAt": "datetime"
}
```

## Security Notes (from security-lead)
- Phone encrypted at rest using AES-256
- Phone validation: regex pattern
- Access control: same as email

## Testing Notes (from quality-lead)
- Phone validation regex required
- Unit tests for validation (100% coverage)
- Integration tests for API

## Migration Notes
- No breaking changes
- New field is optional
- Existing data unaffected
```

### Step 4: Update Database Design Docs
```markdown
# Database Design Update

## Change Details
- **Story:** {story-id}
- **Approved by:** {lead-name}

## Schema Changes
| Table | Change | Column | Type |
|-------|--------|--------|------|
| users | Added | phone | varchar(255) |

## Migration
```sql
ALTER TABLE users ADD COLUMN phone VARCHAR(255);
-- Encrypted at application level
```

## Data Dictionary
| Table | Column | Type | Description |
|-------|--------|------|-------------|
| users | phone | varchar(255) | User phone (encrypted) |

## ER Diagram Update
{updated diagram}
```

### Step 5: Update Security Docs
```markdown
# Security Update

## Change Details
- **Story:** {story-id}
- **Security Lead:** {security-lead}

## Security Changes
| Feature | Change | Security Implication |
|---------|--------|---------------------|
| Phone field | Added | PII - requires encryption |

## Implementation Requirements
- [ ] Encrypt phone at rest (AES-256)
- [ ] Validate phone format (regex)
- [ ] Mask phone in logs
- [ ] Add to PII audit trail

## Compliance Notes
- GDPR: Phone is PII
- CCPA: Phone is personal data
- Must provide deletion capability
```

### Step 6: Update Quality Docs
```markdown
# Quality Update

## Change Details
- **Story:** {story-id}
- **Quality Lead:** {quality-lead}

## Test Requirements
| Test Type | Requirement | Coverage |
|-----------|-------------|----------|
| Unit test | Phone validation | 100% |
| Integration test | Phone API | 100% |
| Security test | Encryption | 100% |

## Test Cases
- [ ] Valid phone format accepted
- [ ] Invalid phone format rejected
- [ ] Phone encrypted at rest
- [ ] Phone decrypted on read
- [ ] Phone masked in logs
```

### Step 7: Update Changelog
```markdown
# Changelog

## [Unreleased]

### Added
- Phone number field to users table
- Phone validation (regex)
- Phone encryption (AES-256)

### Changed
- Updated user response to include phone field

### Security
- Phone encrypted at rest (GDPR/CCPA compliance)

### Documentation
- Updated api-design.md
- Updated database-design.md
- Updated security-docs.md
- Updated quality-docs.md
```

### Step 8: Update README (if needed)
```
IF new commands/APIs added:
  → Update README commands section
  → Update API documentation
  → Update examples
```

### Step 9: Save Documentation Record
```json
// Save to production/docs-updates/{scope-id}.json
{
  "scopeId": "SCOPE-001",
  "storyId": "AUTH-001",
  "lead": "lead-engineer",
  "timestamp": "2024-01-15T11:00:00Z",
  "updates": [
    {
      "file": "docs/api-design.md",
      "changes": "Added phone field to users API",
      "agentSource": "security-lead"
    },
    {
      "file": "docs/database-design.md",
      "changes": "Added phone column migration",
      "agentSource": "quality-lead"
    },
    {
      "file": "docs/security-docs.md",
      "changes": "Added encryption requirements",
      "agentSource": "security-lead"
    },
    {
      "file": "docs/quality-docs.md",
      "changes": "Added test requirements",
      "agentSource": "quality-lead"
    },
    {
      "file": "CHANGELOG.md",
      "changes": "Added phone field entry",
      "agentSource": "product-manager"
    }
  ]
}
```

### Step 10: Update Session State
```json
// Update .claude/sprint-state.json
{
  "stories": {
    "AUTH-001": {
      "scopeChanges": {
        "SCOPE-001": {
          "docsUpdated": true,
          "docsUpdateTimestamp": "2024-01-15T11:00:00Z",
          "docsUpdateLead": "lead-engineer"
        }
      }
    }
  }
}
```

### Step 11: Notify All Stakeholders
```
NOTIFY:
- Developer: All docs updated, proceed with implementation
- QA: New docs available, update test plan
- Product: Changelog updated
- Security: Security docs updated
- DevOps: Infrastructure docs updated (if applicable)
```

## Output
- All design docs updated
- Security docs updated (if applicable)
- Quality docs updated (if applicable)
- Changelog updated
- Documentation record saved
- Session state updated
- All stakeholders notified
