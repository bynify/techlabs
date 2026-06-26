# business-planning-update

Update business planning based on monitoring insights and improvements.

## When to Use
- After improvements proposed
- Business planning needs update
- New insights from monitoring
- Strategy adjustment needed

## Agents to Dispatch
- product-manager: Business strategy
- business-analyst: Planning update
- financial-analyst: Financial update

## Enforcement

```
⚠️ MANDATORY: Business planning must be updated based on data

BUSINESS PLANNING UPDATE ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

UPDATE MUST INCLUDE:
1. Business Objectives Review
   - Are objectives still relevant?
   - Need to adjust targets?
   - New objectives needed?

2. Market Analysis Update
   - Market trends changed?
   - Competitors changed?
   - Customer needs changed?

3. Financial Update
   - Revenue targets adjusted?
   - Budget reallocated?
   - ROI updated?

4. Product Strategy Update
   - Features prioritized?
   - Roadmap adjusted?
   - Timeline changed?

5. Success Metrics Update
   - KPIs still relevant?
   - Targets adjusted?
   - New metrics needed?

UPDATE PROCESS:
1. Review current planning
2. Analyze new data
3. Identify gaps
4. Propose changes
5. Get approval
6. Update documents
```

## Execution

### Step 1: Load Current Planning
```
READ:
- docs/BRD.md (current business requirements)
- docs/PRD.md (current product requirements)
- docs/monitoring-plan.md (current metrics)
- production/monitoring/reports/{date}.md (latest analysis)
- production/improvements/{date}.md (improvements proposed)

EXTRACT:
- Current objectives
- Current targets
- Current metrics
- Latest analysis
- Proposed improvements
```

### Step 2: Analyze Gaps
```javascript
async function analyzeGaps(currentPlanning, newInsights) {
  const gaps = {
    objectives: [],
    metrics: [],
    strategy: [],
    financial: []
  };
  
  // Check objective gaps
  for (const objective of currentPlanning.objectives) {
    const currentMetric = newInsights.metrics[objective.metric];
    if (currentMetric && currentMetric.current < objective.target) {
      gaps.objectives.push({
        objective: objective,
        current: currentMetric.current,
        target: objective.target,
        gap: objective.target - currentMetric.current
      });
    }
  }
  
  // Check metric gaps
  for (const metric of currentPlanning.metrics) {
    const current = newInsights.metrics[metric.name];
    if (current && current.current < metric.target) {
      gaps.metrics.push({
        metric: metric,
        current: current.current,
        target: metric.target,
        gap: metric.target - current.current
      });
    }
  }
  
  // Check strategy gaps
  if (newInsights.proposals.length > 0) {
    gaps.strategy = newInsights.proposals;
  }
  
  // Check financial gaps
  if (newInsights.revenue.current < newInsights.revenue.target) {
    gaps.financial.push({
      metric: 'Revenue',
      current: newInsights.revenue.current,
      target: newInsights.revenue.target,
      gap: newInsights.revenue.target - newInsights.revenue.current
    });
  }
  
  return gaps;
}
```

### Step 3: Propose Updates
```
PROPOSE UPDATES:

1. OBJECTIVE UPDATES
   - Current objective: {description}
   - Issue: {issue}
   - Proposed change: {change}
   - Rationale: {rationale}

2. METRIC UPDATES
   - Current metric: {name}
   - Current target: {target}
   - Issue: {issue}
   - Proposed change: {new target}
   - Rationale: {rationale}

3. STRATEGY UPDATES
   - Current strategy: {description}
   - Issue: {issue}
   - Proposed change: {change}
   - Rationale: {rationale}

4. FINANCIAL UPDATES
   - Current budget: {amount}
   - Issue: {issue}
   - Proposed change: {new amount}
   - Rationale: {rationale}
```

### Step 4: Create Planning Update
```markdown
# Business Planning Update

## Update Date
{date}

## Executive Summary
{summary of changes}

## 1. Business Objectives Review

### Current Objectives
| Objective | Target | Status | Gap |
|-----------|--------|--------|-----|
| {obj1} | {target} | {status} | {gap} |
| {obj2} | {target} | {status} | {gap} |

### Proposed Updates
| Objective | Change | Rationale |
|-----------|--------|-----------|
| {obj1} | {change} | {rationale} |
| {obj2} | {change} | {rationale} |

## 2. Market Analysis Update

### Market Trends
- Trend 1: {description}
- Trend 2: {description}

### Competitor Changes
- Competitor 1: {changes}
- Competitor 2: {changes}

### Customer Changes
- Change 1: {description}
- Change 2: {description}

## 3. Financial Update

### Revenue Targets
| Metric | Current | Proposed | Change |
|--------|---------|----------|--------|
| MRR | ${current} | ${proposed} | {change} |
| ARR | ${current} | ${proposed} | {change} |

### Budget Allocation
| Category | Current | Proposed | Change |
|----------|---------|----------|--------|
| Development | ${current} | ${proposed} | {change} |
| Marketing | ${current} | ${proposed} | {change} |

## 4. Product Strategy Update

### Feature Prioritization
| Feature | Priority | Change | Rationale |
|---------|----------|--------|-----------|
| {feature1} | {priority} | {change} | {rationale} |
| {feature2} | {priority} | {change} | {rationale} |

### Roadmap Update
| Phase | Current | Proposed | Change |
|-------|---------|----------|--------|
| Phase 1 | {current} | {proposed} | {change} |
| Phase 2 | {current} | {proposed} | {change} |

## 5. Success Metrics Update

### KPI Updates
| KPI | Current Target | Proposed Target | Change |
|-----|----------------|-----------------|--------|
| {kpi1} | {current} | {proposed} | {change} |
| {kpi2} | {current} | {proposed} | {change} |

### New Metrics
| Metric | Target | Rationale |
|--------|--------|-----------|
| {metric1} | {target} | {rationale} |

## 6. Improvement Proposals

### From Monitoring
| Proposal | Priority | Status |
|----------|----------|--------|
| {proposal1} | {priority} | {status} |
| {proposal2} | {priority} | {status} |

## 7. Updated BRD Sections

### Section 1: {section}
- Change: {description}
- Rationale: {rationale}

### Section 2: {section}
- Change: {description}
- Rationale: {rationale}

## 8. Updated PRD Sections

### Section 1: {section}
- Change: {description}
- Rationale: {rationale}

## 9. Impact Analysis

### Positive Impacts
- Impact 1: {description}
- Impact 2: {description}

### Negative Impacts
- Impact 1: {description}
- Impact 2: {description}

### Mitigation
- Mitigation 1: {description}
- Mitigation 2: {description}

## 10. Approval

| Role | Name | Date | Status |
|------|------|------|--------|
| Product Owner | {name} | {date} | {status} |
| Technical Lead | {name} | {date} | {status} |
| Business Sponsor | {name} | {date} | {status} |
```

### Step 5: Multi-Agent Approval
```
GET APPROVAL:

PRODUCT-MANAGER:
- "Updates align with product vision"
- "Priorities are correct"
- "Timeline is realistic"

BUSINESS-ANALYST:
- "Updates are data-driven"
- "Metrics are measurable"
- "Strategy is sound"

FINANCIAL-ANALYST:
- "Financial updates are realistic"
- "Budget is sufficient"
- "ROI is positive"

ALL MUST AGREE
```

### Step 6: Update Documents
```
UPDATE:

BRD:
- Update business objectives
- Update success criteria
- Update constraints

PRD:
- Update feature priorities
- Update requirements
- Update timeline

MONITORING PLAN:
- Update metrics
- Update targets
- Update dashboards

SAVE TO:
- docs/BRD.md (updated)
- docs/PRD.md (updated)
- docs/monitoring-plan.md (updated)
- production/planning-updates/{date}.md
```

### Step 7: Create New Sprint Items
```
CREATE NEW ITEMS:

FROM IMPROVEMENTS:
- Create user stories
- Add to backlog
- Prioritize for next sprint

FROM STRATEGY UPDATES:
- Create new epics
- Update roadmap
- Plan future sprints

ASSIGN:
- P0 items → Current sprint
- P1 items → Next sprint
- P2 items → Backlog
```

## Output
- Planning updated
- Documents updated
- New items created
- Ready for development
- Continuous improvement enabled
