# create-urs

Create User Requirements Specification (URS) that defines user needs, workflows, and acceptance criteria.

## When to Use
- After BRD approved
- User requirements needed
- UX planning phase
- Feature definition

## Agents to Dispatch
- product-manager: User requirements
- ux-designer: User experience
- business-analyst: Workflow analysis

## Enforcement

```
⚠️ MANDATORY: URS required before technical design

URS ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

URS MUST INCLUDE:
1. User Personas
2. User Journeys
3. Use Cases
4. Workflow Diagrams
5. Acceptance Criteria
6. UI Requirements
7. Performance Requirements
8. Accessibility Requirements

BLOCK IF:
- User personas not defined
- User journeys incomplete
- Acceptance criteria missing
```

## Execution

### Step 1: Load BRD Context
```
READ:
- docs/BRD.md (business requirements)
- docs/PRD.md (product requirements)

EXTRACT:
- Business objectives
- Stakeholder needs
- Success criteria
- Constraints
```

### Step 2: Define User Personas
```
ASK USER:

1. PRIMARY USERS
   - Who are they?
   - What's their role?
   - What's their goal?
   - What's their pain point?
   - What's their technical skill?

2. SECONDARY USERS
   - Who are they?
   - What's their role?
   - What's their goal?

3. USER SCENARIOS
   - When do they use it?
   - Where do they use it?
   - Why do they use it?
   - How often do they use it?
```

### Step 3: Create User Personas
```markdown
# User Personas

## Persona 1: {name}
### Demographics
- Role: {role}
- Company: {company type}
- Technical Skill: {low/medium/high}
- Age Range: {range}

### Goals
- Goal 1: {description}
- Goal 2: {description}
- Goal 3: {description}

### Pain Points
- Pain 1: {description}
- Pain 2: {description}
- Pain 3: {description}

### Needs
- Need 1: {description}
- Need 2: {description}
- Need 3: {description}

### Frustrations
- Frustration 1: {description}
- Frustration 2: {description}

### Quote
"{user quote that captures their essence}"

## Persona 2: {name}
...
```

### Step 4: Create User Journeys
```
ASK USER:

1. USER JOURNEYS
   - What's the main journey?
   - What are the alternative journeys?
   - What are the error journeys?

2. TOUCHPOINTS
   - Where do they interact?
   - What devices do they use?
   - What channels do they prefer?
```

### Step 5: Create User Journeys Document
```markdown
# User Journeys

## Journey 1: {journey name}
### Scenario
{user scenario description}

### Steps
| Step | Action | Screen | Input | Output | Emotion |
|------|--------|--------|-------|--------|---------|
| 1 | {action} | {screen} | {input} | {output} | {emotion} |
| 2 | {action} | {screen} | {input} | {output} | {emotion} |

### Success Criteria
- Criteria 1: {description}
- Criteria 2: {description}

### Error Handling
- Error 1: {scenario} → {handling}
- Error 2: {scenario} → {handling}

## Journey 2: {journey name}
...
```

### Step 6: Define Use Cases
```
ASK USER:

1. USE CASES
   - What are the main use cases?
   - What are the edge cases?
   - What are the error cases?

2. ACCEPTANCE CRITERIA
   - How do we know it's done?
   - What are the quality standards?
   - What are the performance targets?
```

### Step 7: Create Use Cases Document
```markdown
# Use Cases

## Use Case 1: {name}
### Description
{use case description}

### Actors
- Primary: {actor}
- Secondary: {actor}

### Preconditions
- Condition 1: {description}
- Condition 2: {description}

### Main Flow
| Step | Actor Action | System Response |
|------|--------------|-----------------|
| 1 | {action} | {response} |
| 2 | {action} | {response} |

### Alternative Flows
| Flow | Condition | Steps |
|------|-----------|-------|
| 1a | {condition} | {steps} |

### Exception Flows
| Flow | Error | Handling |
|------|-------|----------|
| 1e | {error} | {handling} |

### Postconditions
- Condition 1: {description}
- Condition 2: {description}

### Acceptance Criteria
- [ ] Criterion 1: {description}
- [ ] Criterion 2: {description}
- [ ] Criterion 3: {description}
```

### Step 8: Multi-Agent Discussion
```
DISCUSS WITH:

PRODUCT-MANAGER:
- Are user personas accurate?
- Are user journeys complete?
- Are use cases comprehensive?

UX-DESIGNER:
- Are user flows logical?
- Are touchpoints optimized?
- Is accessibility considered?

BUSINESS-ANALYST:
- Are workflows efficient?
- Are edge cases covered?
- Are acceptance criteria clear?

ALL MUST AGREE BEFORE PROCEEDING
```

### Step 9: Save & Validate
```
SAVE TO:
- docs/URS.md

VALIDATE:
- All personas defined?
- All journeys mapped?
- All use cases documented?
- All acceptance criteria clear?

IF VALID:
- Mark as APPROVED
- Proceed to SRS

IF INVALID:
- Mark as DRAFT
- Request revisions
- Re-approve
```

## Output
- URS document created
- User personas defined
- User journeys mapped
- Use cases documented
- Acceptance criteria clear
- Ready for SRS
