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

### Step 5: Save Generated Docs (WITH BACKUP)
```javascript
async function saveGeneratedDocs(docs) {
  // Create directories if not exist
  await fs.mkdir('docs', { recursive: true });
  await fs.mkdir('docs/.backup', { recursive: true });
  await fs.mkdir('production/epics', { recursive: true });
  await fs.mkdir('production/stories', { recursive: true });
  
  // ⚠️ ANOMALY PREVENTION: Check existing files
  for (const [filename, content] of Object.entries(docs)) {
    if (await fs.exists(filename)) {
      // File exists - ASK USER
      const action = await askUser({
        question: `${filename} already exists. What to do?`,
        options: [
          'Backup and overwrite',
          'Merge with existing',
          'Skip this file',
          'Show diff first'
        ]
      });
      
      if (action === 'Backup and overwrite') {
        // Create backup
        const backupPath = `docs/.backup/${filename}-${Date.now()}.md`;
        await fs.copy(filename, backupPath);
        console.log(`Backup created: ${backupPath}`);
        // Overwrite
        await fs.writeFile(filename, content);
      } else if (action === 'Merge with existing') {
        // Merge logic
        const existing = await fs.readFile(filename, 'utf8');
        const merged = mergeDocuments(existing, content);
        await fs.writeFile(filename, merged);
      } else if (action === 'Skip this file') {
        console.log(`Skipped: ${filename}`);
      } else if (action === 'Show diff first') {
        const existing = await fs.readFile(filename, 'utf8');
        showDiff(existing, content);
        // Ask again after showing diff
        const confirm = await askUser({
          question: 'Proceed with overwrite?',
          options: ['Yes, overwrite', 'No, skip']
        });
        if (confirm === 'Yes, overwrite') {
          await fs.copy(filename, `docs/.backup/${filename}-${Date.now()}.md`);
          await fs.writeFile(filename, content);
        }
      }
    } else {
      // File doesn't exist - create new
      await fs.writeFile(filename, content);
    }
    console.log(`Processed: ${filename}`);
  }
}
```

### Step 6: Validate Generated Docs (WITH QUALITY WARNING)
```markdown
# ⚠️ AUTO-GENERATED DOCUMENTS - QUALITY WARNING

## Generated Documents
| Document | Status | Quality | Warning |
|----------|--------|--------|--------|
| PRD | ✅ Generated | ⚠️ 60% | Review required |
| Architecture | ✅ Generated | ⚠️ 60% | Review required |
| User Stories | ✅ Generated | ⚠️ 60% | Review required |

## ⚠️ QUALITY ASSESSMENT
- Completeness: 60% (missing edge cases)
- Accuracy: 70% (may have gaps)
- Security: 40% (incomplete)
- Testing: 30% (minimal)

## ⚠️ CRITICAL Warnings
1. PRD is AUTO-GENERATED - Review REQUIRED before sprint
2. Architecture is BASIC - May miss critical components
3. User stories NEED detailed acceptance criteria
4. Security requirements NOT fully addressed
5. Testing strategy NOT defined

## RECOMMENDED ACTIONS
1. Review ALL generated documents
2. Add missing edge cases
3. Refine architecture for your specific needs
4. Add detailed acceptance criteria
5. Define testing strategy
6. Add security requirements
7. Only proceed with sprint AFTER review

## SPRINT SAFETY
⚠️ Sprint NOT recommended with auto-generated docs
✅ Recommended: Review and refine before sprint
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
