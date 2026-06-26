# lead-docs-update

Lead updates all related documentation after approving scope changes.

## When to Use
- After scope approval
- API design changes
- Database design changes
- Architecture changes
- Any design-level changes

## Agents to Dispatch
- lead-engineer: Review and approve docs
- technical-director: Major architecture changes

## Enforcement

```
⚠️ MANDATORY: Lead must update docs after scope approval

DOCUMENTATION UPDATES REQUIRED:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

API CHANGES:
  → Update api-design docs
  → Update OpenAPI spec
  → Update README endpoints
  → Update changelog

DATABASE CHANGES:
  → Update database-design docs
  → Update ER diagram
  → Update migration plan
  → Update changelog

ARCHITECTURE CHANGES:
  → Update architecture docs
  → Update system diagrams
  → Update ADR (if decision)
  → Update changelog

GENERAL:
  → Update README
  → Update changelog
  → Update comments
```

## Execution

### Step 1: Load Change Context
```
READ:
- production/stories/{story-id}.md
- Scope approval record
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

### Step 3: Update API Design Docs
```markdown
# API Design Update

## Changes
| Endpoint | Change | Before | After |
|----------|--------|--------|-------|
| /api/users | Added field | - | phone |
| /api/auth | Changed response | token only | token + refresh |

## Updated Endpoints
### POST /api/users
**Request:**
```json
{
  "name": "string",
  "email": "string",
  "phone": "string"  // NEW
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

## Migration Notes
- No breaking changes
- New field is optional
- Existing data unaffected
```

### Step 4: Update Database Design Docs
```markdown
# Database Design Update

## Schema Changes
| Table | Change | Column | Type |
|-------|--------|--------|------|
| users | Added | phone | varchar(20) |
| users | Added | lastLogin | timestamp |

## Migration
```sql
ALTER TABLE users ADD COLUMN phone VARCHAR(20);
ALTER TABLE users ADD COLUMN last_login TIMESTAMP;
```

## ER Diagram Update
{updated diagram}

## Data Dictionary
| Table | Column | Type | Description |
|-------|--------|------|-------------|
| users | phone | varchar(20) | User phone number |
| users | last_login | timestamp | Last login time |
```

### Step 5: Update Changelog
```markdown
# Changelog

## [Unreleased]

### Added
- Phone number field to users table
- Last login tracking

### Changed
- Updated user response to include new fields

### Deprecated
- None

### Removed
- None

### Fixed
- None

### Security
- None
```

### Step 6: Update README (if needed)
```
IF new commands/APIs added:
  → Update README commands section
  → Update API documentation
  → Update examples
```

### Step 7: Save Updated Docs
```
SAVE:
- docs/api-design.md (updated)
- docs/database-design.md (updated)
- docs/architecture.md (if changed)
- CHANGELOG.md (updated)

UPDATE:
- story.docsUpdated = true
- story.updatedBy = lead.name
- story.updatedAt = new Date()
```

### Step 8: Notify Team
```
NOTIFY:
- Developer: Docs updated
- QA: New docs available
- Product: Changelog updated
```

## Output
- API design docs updated
- Database design docs updated
- Architecture docs updated (if changed)
- Changelog updated
- README updated (if needed)
- Team notified
