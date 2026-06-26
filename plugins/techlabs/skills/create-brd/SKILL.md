# create-brd

Create Business Requirements Document (BRD) that defines business goals, stakeholders, and success criteria.

## When to Use
- New project kickoff
- Business requirements needed
- Stakeholder alignment
- Funding/approval process

## Agents to Dispatch
- product-manager: Business requirements
- business-analyst: Requirements analysis
- financial-analyst: Budget/cost analysis

## Enforcement

```
⚠️ MANDATORY: BRD required before any technical work

BRD ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

BRD MUST INCLUDE:
1. Executive Summary
2. Business Objectives
3. Stakeholder Analysis
4. Scope Definition
5. Success Criteria
6. Constraints & Assumptions
7. Budget & Timeline
8. Risk Assessment
9. Approval Signatures

BLOCK IF:
- Business objectives unclear
- Stakeholders not defined
- Success criteria missing
- Budget not approved
```

## Execution

### Step 1: Gather Business Context
```
ASK USER:

1. BUSINESS CONTEXT
   - What problem are we solving?
   - Why is this important now?
   - Who benefits from this solution?
   - What's the business value?

2. STAKEHOLDERS
   - Who are the primary stakeholders?
   - Who are the secondary stakeholders?
   - Who has decision authority?
   - Who are the end users?

3. SUCCESS CRITERIA
   - How do we measure success?
   - What are the KPIs?
   - What's the expected ROI?
   - What's the timeline?

4. CONSTRAINTS
   - Budget limitations?
   - Time constraints?
   - Resource limitations?
   - Technical constraints?

5. ASSUMPTIONS
   - What are we assuming?
   - What dependencies exist?
   - What risks do we foresee?
```

### Step 2: Research & Validate
```
TOOL CALLS:
- Search industry reports
- Search market size data
- Search competitor analysis
- Search best practices

VALIDATE:
- Market opportunity exists?
- Solution is feasible?
- Budget is realistic?
- Timeline is achievable?
```

### Step 3: Multi-Agent Discussion
```
DISCUSS WITH:

PRODUCT-MANAGER:
- Is the product vision clear?
- Are requirements complete?
- Are priorities defined?

BUSINESS-ANALYST:
- Are business processes mapped?
- Are workflows defined?
- Are edge cases covered?

FINANCIAL-ANALYST:
- Is budget realistic?
- Are costs estimated?
- Is ROI achievable?

SECURITY-LEAD:
- Are compliance requirements clear?
- Are data privacy requirements defined?
- Are security requirements specified?

ALL MUST AGREE BEFORE PROCEEDING
```

### Step 4: Generate BRD Document
```markdown
# Business Requirements Document (BRD)

## Document Information
- **Project Name:** {project-name}
- **Version:** 1.0
- **Date:** {date}
- **Author:** {author}
- **Status:** DRAFT | APPROVED

## 1. Executive Summary
{brief summary of business opportunity and solution}

## 2. Business Objectives
### 2.1 Primary Objectives
- Objective 1: {description}
- Objective 2: {description}
- Objective 3: {description}

### 2.2 Secondary Objectives
- Objective 1: {description}
- Objective 2: {description}

### 2.3 Business Value
- Revenue Impact: {amount}
- Cost Savings: {amount}
- Efficiency Gain: {percentage}
- Customer Satisfaction: {metric}

## 3. Stakeholder Analysis
### 3.1 Primary Stakeholders
| Stakeholder | Role | Interest | Influence | Requirements |
|-------------|------|----------|-----------|--------------|
| {name} | {role} | High | High | {requirements} |

### 3.2 Secondary Stakeholders
| Stakeholder | Role | Interest | Influence | Requirements |
|-------------|------|----------|-----------|--------------|
| {name} | {role} | Medium | Medium | {requirements} |

### 3.3 End Users
| User Type | Description | Needs | Pain Points |
|-----------|-------------|-------|-------------|
| {type} | {description} | {needs} | {pain points} |

## 4. Scope Definition
### 4.1 In Scope
- Feature 1: {description}
- Feature 2: {description}
- Feature 3: {description}

### 4.2 Out of Scope
- Feature 1: {description}
- Feature 2: {description}

### 4.3 Future Considerations
- Feature 1: {description}
- Feature 2: {description}

## 5. Success Criteria & KPIs
### 5.1 Business KPIs
| KPI | Metric | Target | Timeline |
|-----|--------|--------|----------|
| Revenue | {metric} | {target} | {timeline} |
| Users | {metric} | {target} | {timeline} |
| Retention | {metric} | {target} | {timeline} |

### 5.2 Technical KPIs
| KPI | Metric | Target | Timeline |
|-----|--------|--------|----------|
| Uptime | {metric} | 99.9% | {timeline} |
| Response Time | {metric} | <200ms | {timeline} |
| Error Rate | {metric} | <0.1% | {timeline} |

## 6. Constraints & Assumptions
### 6.1 Constraints
- Budget: {amount}
- Timeline: {duration}
- Resources: {count}
- Technology: {constraints}

### 6.2 Assumptions
- Assumption 1: {description}
- Assumption 2: {description}
- Assumption 3: {description}

### 6.3 Dependencies
- Dependency 1: {description}
- Dependency 2: {description}

## 7. Budget & Timeline
### 7.1 Budget Breakdown
| Category | Estimated Cost | Notes |
|----------|----------------|-------|
| Development | {amount} | {notes} |
| Infrastructure | {amount} | {notes} |
| Third-party | {amount} | {notes} |
| **Total** | **{amount}** | |

### 7.2 Timeline
| Phase | Duration | Deliverables |
|-------|----------|--------------|
| Planning | {duration} | {deliverables} |
| Development | {duration} | {deliverables} |
| Testing | {duration} | {deliverables} |
| Launch | {duration} | {deliverables} |

## 8. Risk Assessment
### 8.1 Business Risks
| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| {risk} | High | Medium | {mitigation} |

### 8.2 Technical Risks
| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| {risk} | High | Medium | {mitigation} |

### 8.3 Market Risks
| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| {risk} | High | Medium | {mitigation} |

## 9. Approval Signatures
| Role | Name | Signature | Date |
|------|------|-----------|------|
| Product Owner | {name} | | |
| Technical Lead | {name} | | |
| Business Sponsor | {name} | | |
| Security Lead | {name} | | |

## Appendix
- A. Glossary
- B. References
- C. Supporting Documents
```

### Step 5: Multi-Agent Approval
```
EACH AGENT MUST APPROVE:

PRODUCT-MANAGER:
- "Business objectives are clear and achievable"
- "Requirements are complete and prioritized"
- "Scope is well-defined"
- APPROVE / REJECT

BUSINESS-ANALYST:
- "Business processes are mapped"
- "Workflows are defined"
- "Edge cases are covered"
- APPROVE / REJECT

FINANCIAL-ANALYST:
- "Budget is realistic"
- "Costs are estimated correctly"
- "ROI is achievable"
- APPROVE / REJECT

SECURITY-LEAD:
- "Compliance requirements are defined"
- "Data privacy requirements are clear"
- "Security requirements are specified"
- APPROVE / REJECT

ALL MUST AGREE
```

### Step 6: Save & Validate
```
SAVE TO:
- docs/BRD.md

VALIDATE:
- All sections complete?
- All stakeholders approved?
- Budget approved?
- Timeline realistic?

IF VALID:
- Mark as APPROVED
- Proceed to next phase

IF INVALID:
- Mark as DRAFT
- Request revisions
- Re-approve
```

## Output
- BRD document created
- Stakeholder alignment achieved
- Budget approved
- Timeline established
- Ready for URS
