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

### Step 1: Load Approval Context
```
READ:
- production/stories/{story-id}.md
- Scope approval record
- Agent feedback
- Current docs
```

### Step 2: Identify Required Updates
```
FOR EACH CHANGE:

IF API changed:
  → Update api-design docs
  → Update endpoint list
  → Update request/response examples
  → Update OpenAPI spec

IF Database changed:
  → Update database-design docs
  → Update ER diagram
  → Update migration SQL
  → Update data dictionary

IF Architecture changed:
  → Update architecture docs
  → Update system diagrams
  → Update component relationships
  → Write ADR (Architecture Decision Record)
```

### Step 3: Lead Updates API Design Docs
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
  "phone": "string",
  "createdAt": "datetime"
}
```

## Security Notes (from security-lead)
- Phone encrypted at rest using AES-256
- Phone validation: regex pattern
- Access control: same as email

## Migration Notes
- No breaking changes
- New field is optional
- Existing data unaffected
```

### Step 4: Lead Updates Database Design Docs
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

### Step 5: Lead Updates Security Docs (if applicable)
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

### Step 6: Lead Updates Quality Docs (if applicable)
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

### Step 7: Lead Updates Changelog
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

### Step 8: Save Updated Docs
```
SAVE:
- docs/api-design.md (updated)
- docs/database-design.md (updated)
- docs/security-docs.md (if changed)
- docs/quality-docs.md (if changed)
- CHANGELOG.md (updated)

UPDATE:
- story.docsUpdated = true
- story.updatedBy = lead.name
- story.updatedAt = new Date()
- story.agentApprovals = agentDecisions
```

### Step 9: Notify All Stakeholders
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
- All stakeholders notified
- Documentation complete
