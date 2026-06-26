# doc-recovery

Generate or recover missing documents needed for sprint.

## When to Use
- Missing prerequisites found
- Documents lost or deleted
- Quick start without full planning
- Emergency documentation

## Agents to Dispatch
- product-manager: Requirements docs
- lead-engineer: Technical docs
- technical-director: Architecture docs

## Execution

### Step 1: Detect Missing Documents
```
CHECK FOR:
1. docs/PRD.md - Product requirements
2. docs/architecture.md - System design
3. docs/api-design.md - API specifications
4. docs/database-design.md - Schema design
5. docs/stack.md - Technology choices
6. production/epics/ - Epic breakdown
7. production/stories/ - User stories
```

### Step 2: Generate from Context
```markdown
# Auto-Generated PRD

## Source: User input + conversation

### Project: [Detected from context]

## Features (inferred)
1. [Feature 1 from conversation]
2. [Feature 2 from conversation]
3. [Feature 3 from conversation]

## Requirements (inferred)
- User authentication
- Data storage
- API endpoints
- Frontend UI

## Constraints (from conversation)
- Timeline: [if mentioned]
- Budget: [if mentioned]
- Tech stack: [if mentioned]

## Generated from
- User conversation: [date]
- Context: [what was discussed]
```

### Step 3: Generate Architecture
```markdown
# Auto-Generated Architecture

## Source: Stack configuration + requirements

### Technology Stack
- Backend: [from stack config]
- Database: [from stack config]
- Frontend: [from stack config]
- Deployment: [from deployment config]

### System Components
1. [Component 1] - [Purpose]
2. [Component 2] - [Purpose]
3. [Component 3] - [Purpose]

### Data Flow
[User] → [API] → [Database]
[User] → [Frontend] → [API] → [Service]

### Security Considerations
- Authentication: JWT
- Authorization: RBAC
- Data encryption: AES-256

## Generated from
- Stack configuration: docs/stack.md
- Requirements: docs/PRD.md
- Date: [today]
```

### Step 4: Generate User Stories
```markdown
# Auto-Generated User Stories

## Source: PRD + Architecture

### Epic: [Feature Name]

#### Story 1: [Title]
**As a** [user type]
**I want** [action]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] [Criteria 1]
- [ ] [Criteria 2]
- [ ] [Criteria 3]

**Points:** [estimated]

[Repeat for each feature]
```

### Step 5: Save Generated Docs
```javascript
async function saveGeneratedDocs(docs) {
  // Create directories if not exist
  await fs.mkdir('docs', { recursive: true });
  await fs.mkdir('production/epics', { recursive: true });
  await fs.mkdir('production/stories', { recursive: true });
  
  // Save each document
  for (const [filename, content] of Object.entries(docs)) {
    await fs.writeFile(filename, content);
    console.log(`Created: ${filename}`);
  }
}
```

### Step 6: Validate Generated Docs
```markdown
# Validation Report

## Generated Documents
| Document | Status | Quality |
|----------|--------|---------|
| PRD | ✅ Generated | ⚠️ Basic |
| Architecture | ✅ Generated | ⚠️ Basic |
| User Stories | ✅ Generated | ⚠️ Basic |

## Warnings
1. PRD is auto-generated - Review recommended
2. Architecture is basic - May need refinement
3. User stories need acceptance criteria review

## Next Steps
1. Review generated documents
2. Add missing details
3. Refine architecture
4. Update user stories
```

### Step 7: Generate Recovery Report
```markdown
# Document Recovery Report

## Date: 2024-01-15
## Reason: Missing prerequisites

## Documents Generated
1. docs/PRD.md - From conversation context
2. docs/architecture.md - From stack config
3. docs/api-design.md - From requirements
4. docs/database-design.md - From data model
5. production/epics/ - From PRD
6. production/stories/ - From epics

## Quality Assessment
- Completeness: 60%
- Accuracy: 70%
- Needs Review: Yes

## Recommendations
1. Review all generated docs
2. Add missing acceptance criteria
3. Refine architecture decisions
4. Validate database schema

## Risk Assessment
- Risk Level: Medium
- Reason: Auto-generated docs may miss edge cases
- Mitigation: Review before sprint
```

## Output
- Missing documents detected
- Documents auto-generated
- Saved to correct locations
- Validation report
- Recovery report
