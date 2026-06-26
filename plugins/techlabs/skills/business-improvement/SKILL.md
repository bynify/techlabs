# business-improvement

Propose business improvements based on monitoring data.

## When to Use
- After monitoring analysis
- Issues identified
- Opportunities identified
- Improvement needed

## Agents to Dispatch
- business-monitor: Improvement proposals
- product-manager: Feature prioritization
- technical-director: Technical feasibility

## Enforcement

```
⚠️ MANDATORY: Improvements must be data-driven

BUSINESS IMPROVEMENT ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

IMPROVEMENT MUST BE:
1. Data-driven (based on metrics)
2. Specific (clear problem)
3. Actionable (can be implemented)
4. Measurable (can track impact)
5. Prioritized (P0/P1/P2)

IMPROVEMENT CATEGORIES:
1. Revenue improvements
2. UX improvements
3. Technical improvements
4. Process improvements

IMPROVEMENT PROCESS:
1. Identify issue
2. Analyze root cause
3. Propose solution
4. Estimate impact
5. Estimate effort
6. Prioritize
7. Assign to planning
```

## Execution

### Step 1: Load Monitoring Data
```
READ:
- production/monitoring/proposals/{date}.md
- docs/monitoring-plan.md
- production/monitoring/reports/{date}.md

EXTRACT:
- Issues identified
- Opportunities identified
- Proposals created
- Data analysis
```

### Step 2: Analyze Proposals
```javascript
async function analyzeProposals(proposals) {
  const analyzed = {
    revenue: [],
    ux: [],
    technical: [],
    process: []
  };
  
  for (const proposal of proposals) {
    const analysis = {
      ...proposal,
      impactScore: calculateImpact(proposal),
      effortScore: calculateEffort(proposal),
      priority: calculatePriority(proposal),
      roi: calculateROI(proposal)
    };
    
    analyzed[proposal.category].push(analysis);
  }
  
  return analyzed;
}

function calculateImpact(proposal) {
  // Impact: High=3, Medium=2, Low=1
  const impactMap = { 'High': 3, 'Medium': 2, 'Low': 1 };
  return impactMap[proposal.impact] || 1;
}

function calculateEffort(proposal) {
  // Effort: High=3, Medium=2, Low=1
  const effortMap = { 'High': 3, 'Medium': 2, 'Low': 1 };
  return effortMap[proposal.effort] || 1;
}

function calculatePriority(proposal) {
  // Priority based on impact/effort ratio
  const impact = calculateImpact(proposal);
  const effort = calculateEffort(proposal);
  const ratio = impact / effort;
  
  if (ratio >= 2) return 'P0'; // High impact, low effort
  if (ratio >= 1) return 'P1'; // Medium impact/effort
  return 'P2'; // Low impact or high effort
}

function calculateROI(proposal) {
  // ROI = Impact / Effort
  return calculateImpact(proposal) / calculateEffort(proposal);
}
```

### Step 3: Create Improvement Proposals
```markdown
# Business Improvement Proposals

## Date
{date}

## Executive Summary
{brief summary of proposed improvements}

## Proposals

### Revenue Improvements

#### Proposal 1: {title}
**Issue:** {issue description}
**Root Cause:** {root cause}
**Solution:** {proposed solution}
**Impact:** {High/Medium/Low}
**Effort:** {High/Medium/Low}
**ROI:** {roi score}
**Priority:** {P0/P1/P2}
**Estimated Revenue Impact:** ${amount}

**Implementation:**
1. {step 1}
2. {step 2}
3. {step 3}

**Success Metrics:**
- Metric 1: {metric}
- Metric 2: {metric}

### UX Improvements

#### Proposal 2: {title}
**Issue:** {issue description}
**Root Cause:** {root cause}
**Solution:** {proposed solution}
**Impact:** {High/Medium/Low}
**Effort:** {High/Medium/Low}
**ROI:** {roi score}
**Priority:** {P0/P1/P2}

**Implementation:**
1. {step 1}
2. {step 2}
3. {step 3}

**Success Metrics:**
- Metric 1: {metric}
- Metric 2: {metric}

### Technical Improvements

#### Proposal 3: {title}
**Issue:** {issue description}
**Root Cause:** {root cause}
**Solution:** {proposed solution}
**Impact:** {High/Medium/Low}
**Effort:** {High/Medium/Low}
**ROI:** {roi score}
**Priority:** {P0/P1/P2}

**Implementation:**
1. {step 1}
2. {step 2}
3. {step 3}

**Success Metrics:**
- Metric 1: {metric}
- Metric 2: {metric}

## Prioritization Matrix

| Proposal | Impact | Effort | ROI | Priority | Category |
|----------|--------|--------|-----|----------|----------|
| {title} | {score} | {score} | {score} | {priority} | {category} |

## Resource Requirements

### Team Resources
- Developer: {hours}
- Designer: {hours}
- QA: {hours}
- Total: {hours}

### Budget
- Development: ${amount}
- Tools: ${amount}
- Total: ${amount}

## Timeline

### Phase 1: Immediate (Week 1-2)
- {proposal 1}
- {proposal 2}

### Phase 2: Short-term (Week 3-4)
- {proposal 3}
- {proposal 4}

### Phase 3: Medium-term (Month 2)
- {proposal 5}
- {proposal 6}

## Success Criteria

### Revenue Metrics
- Metric 1: {target}
- Metric 2: {target}

### UX Metrics
- Metric 1: {target}
- Metric 2: {target}

### Technical Metrics
- Metric 1: {target}
- Metric 2: {metric}
```

### Step 4: Multi-Agent Review
```
REVIEW WITH:

PRODUCT-MANAGER:
- "Proposals align with product vision"
- "Priorities are correct"
- "Resources are realistic"

BUSINESS-MONITOR:
- "Proposals are data-driven"
- "Metrics are measurable"
- "Success criteria are clear"

TECHNICAL-DIRECTOR:
- "Proposals are technically feasible"
- "Timeline is realistic"
- "Resources are sufficient"

ALL MUST AGREE
```

### Step 5: Assign to Planning
```
ASSIGN:

P0 PROPOSALS (IMMEDIATE):
- Assign to current sprint planning
- Create new user stories
- Assign to development team

P1 PROPOSALS (SHORT-TERM):
- Assign to next sprint planning
- Create new user stories
- Assign to development team

P2 PROPOSALS (MEDIUM-TERM):
- Assign to backlog
- Create new user stories
- Plan for future sprints

SAVE TO:
- production/improvements/{date}.md
- production/sprint/backlog.md (P0/P1)
```

### Step 6: Track Implementation
```
TRACK:

FOR EACH PROPOSAL:
- Implementation status
- Progress tracking
- Success metrics
- Impact measurement

AFTER IMPLEMENTATION:
- Measure impact
- Compare to baseline
- Report results
- Update knowledge base
```

## Output
- Improvement proposals created
- Proposals prioritized
- Assigned to planning
- Ready for development
- Tracking set up
