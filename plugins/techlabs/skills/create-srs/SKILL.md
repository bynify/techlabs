# create-srs

Create Software Requirements Specification (SRS) that defines technical requirements, system design, and constraints.

## When to Use
- After URS approved
- Technical requirements needed
- Architecture planning
- Development preparation

## Agents to Dispatch
- technical-director: System design
- security-lead: Security requirements
- performance-lead: Performance requirements
- compliance-officer: Compliance requirements

## Enforcement

```
⚠️ MANDATORY: SRS required before architecture design

SRS ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SRS MUST INCLUDE:
1. System Overview
2. Functional Requirements
3. Non-Functional Requirements
4. System Architecture
5. Data Requirements
6. Interface Requirements
7. Security Requirements
8. Performance Requirements
9. Compliance Requirements
10. Testing Requirements

BLOCK IF:
- Functional requirements incomplete
- Non-functional requirements missing
- Security requirements unclear
- Performance targets undefined
```

## Execution

### Step 1: Load URS Context
```
READ:
- docs/URS.md (user requirements)
- docs/BRD.md (business requirements)

EXTRACT:
- User personas
- User journeys
- Use cases
- Acceptance criteria
```

### Step 2: Define Functional Requirements
```
ASK USER:

1. CORE FEATURES
   - What are the main features?
   - What are the supporting features?
   - What are the admin features?

2. FEATURE DETAILS
   - For each feature:
     - What does it do?
     - How does it work?
     - What are the inputs?
     - What are the outputs?
     - What are the edge cases?

3. DATA REQUIREMENTS
   - What data is collected?
   - How is it stored?
   - How is it processed?
   - How is it displayed?
```

### Step 3: Create Functional Requirements
```markdown
# Functional Requirements

## FR-001: {Feature Name}
### Description
{feature description}

### Priority
{P0/P1/P2}

### Inputs
- Input 1: {type} - {description}
- Input 2: {type} - {description}

### Processing
- Step 1: {processing}
- Step 2: {processing}
- Step 3: {processing}

### Outputs
- Output 1: {type} - {description}
- Output 2: {type} - {description}

### Business Rules
- Rule 1: {description}
- Rule 2: {description}

### Edge Cases
- Case 1: {scenario} → {handling}
- Case 2: {scenario} → {handling}

### Acceptance Criteria
- [ ] Criterion 1: {description}
- [ ] Criterion 2: {description}

## FR-002: {Feature Name}
...
```

### Step 4: Define Non-Functional Requirements
```
ASK USER:

1. PERFORMANCE
   - Response time targets?
   - Throughput targets?
   - Concurrency targets?
   - Scalability targets?

2. SECURITY
   - Authentication requirements?
   - Authorization requirements?
   - Data encryption requirements?
   - Compliance requirements?

3. RELIABILITY
   - Availability targets?
   - Recovery time targets?
   - Backup requirements?
   - Disaster recovery?

4. USABILITY
   - Accessibility requirements?
   - Browser support?
   - Device support?
   - Language support?

5. MAINTAINABILITY
   - Code quality standards?
   - Documentation requirements?
   - Testing requirements?
   - Deployment requirements?
```

### Step 5: Create Non-Functional Requirements
```markdown
# Non-Functional Requirements

## NFR-001: Performance
### Response Time
| Operation | Target | Measurement |
|-----------|--------|-------------|
| API Call | <200ms | P95 |
| Page Load | <2s | P95 |
| Database Query | <50ms | P95 |

### Throughput
| Metric | Target |
|--------|--------|
| Requests/sec | 1000 |
| Concurrent Users | 10000 |
| Data Processing | 1GB/hour |

### Scalability
| Metric | Target |
|--------|--------|
| Horizontal Scaling | Yes |
| Vertical Scaling | Yes |
| Auto-scaling | Yes |

## NFR-002: Security
### Authentication
- Method: JWT/OAuth2
- Token Expiry: 24 hours
- Refresh Token: Yes
- MFA: Optional

### Authorization
- Model: RBAC
- Roles: Admin, User, Viewer
- Permissions: Granular

### Data Protection
- Encryption at Rest: AES-256
- Encryption in Transit: TLS 1.3
- Data Masking: Yes
- Data Retention: 7 years

### Compliance
- GDPR: Yes
- CCPA: Yes
- HIPAA: No
- SOC2: Yes

## NFR-003: Reliability
### Availability
| Metric | Target |
|--------|--------|
| Uptime | 99.9% |
| MTBF | 720 hours |
| MTTR | 1 hour |

### Recovery
| Metric | Target |
|--------|--------|
| RPO | 1 hour |
| RTO | 4 hours |
| Backup Frequency | Daily |

## NFR-004: Usability
### Accessibility
- WCAG 2.1: AA
- Screen Reader: Yes
- Keyboard Navigation: Yes
- Color Contrast: 4.5:1

### Browser Support
- Chrome: Latest 2 versions
- Firefox: Latest 2 versions
- Safari: Latest 2 versions
- Edge: Latest 2 versions

### Device Support
- Desktop: Yes
- Tablet: Yes
- Mobile: Yes
- Responsive: Yes

## NFR-005: Maintainability
### Code Quality
- Linting: ESLint/Prettier
- Type Checking: TypeScript
- Code Review: Required
- Test Coverage: ≥80%

### Documentation
- API Docs: OpenAPI 3.0
- Code Docs: JSDoc/TSDoc
- User Docs: Markdown
- Architecture Docs: C4 Model

### Testing
- Unit Tests: Required
- Integration Tests: Required
- E2E Tests: Required
- Performance Tests: Required
```

### Step 6: Multi-Agent Discussion
```
DISCUSS WITH:

TECHNICAL-DIRECTOR:
- Is the architecture feasible?
- Are requirements technically sound?
- Are there technical constraints?

SECURITY-LEAD:
- Are security requirements complete?
- Are compliance requirements defined?
- Are data protection requirements clear?

PERFORMANCE-LEAD:
- Are performance targets realistic?
- Are scalability requirements clear?
- Are monitoring requirements defined?

COMPLIANCE-OFFICER:
- Are regulatory requirements met?
- Are audit requirements defined?
- Are reporting requirements clear?

ALL MUST AGREE BEFORE PROCEEDING
```

### Step 7: Save & Validate
```
SAVE TO:
- docs/SRS.md

VALIDATE:
- All functional requirements defined?
- All non-functional requirements specified?
- All security requirements clear?
- All performance targets realistic?
- All compliance requirements met?

IF VALID:
- Mark as APPROVED
- Proceed to Architecture

IF INVALID:
- Mark as DRAFT
- Request revisions
- Re-approve
```

## Output
- SRS document created
- Functional requirements defined
- Non-functional requirements specified
- Security requirements clear
- Performance targets realistic
- Ready for Architecture
