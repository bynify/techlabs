# business-monitoring

Ongoing business monitoring to track metrics and identify improvements.

## When to Use
- After launch
- Daily monitoring
- Weekly review
- Monthly review

## Agents to Dispatch
- business-monitor: Track metrics
- revenue-analyst: Revenue analysis
- ux-analyst: UX analysis
- data-analyst: Data analysis

## Enforcement

```
⚠️ MANDATORY: Business monitoring required after launch

BUSINESS MONITORING ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MONITORING SCHEDULE:
- Daily: Quick metrics check
- Weekly: Detailed analysis
- Monthly: Business review
- Quarterly: Strategy review

MUST TRACK:
1. Revenue Metrics (MRR, ARR, conversion, churn)
2. UX Metrics (satisfaction, usability, engagement)
3. Technical Metrics (performance, errors, usage)
4. User Feedback (NPS, CSAT, support tickets)

MUST IDENTIFY:
1. Issues (what's not working)
2. Opportunities (what can improve)
3. Trends (what's changing)
4. Patterns (what's recurring)

MUST PROPOSE:
1. Improvements (what to change)
2. Experiments (what to test)
3. Features (what to build)
4. Fixes (what to repair)
```

## Execution

### Step 1: Load Monitoring Plan
```
READ:
- docs/monitoring-plan.md
- docs/PRD.md
- docs/BRD.md

EXTRACT:
- Metrics to track
- Targets to hit
- Dashboards to review
- Alerts to check
```

### Step 2: Collect Data
```
TOOL CALLS:

1. REVENUE DATA
   - Search: "revenue analytics {platform}"
   - Search: "conversion tracking {platform}"
   - Search: "churn analysis {platform}"

2. UX DATA
   - Search: "user behavior analytics"
   - Search: "session recording {platform}"
   - Search: "heatmaps {platform}"

3. TECHNICAL DATA
   - Search: "APM {platform}"
   - Search: "error tracking {platform}"
   - Search: "performance monitoring {platform}"

4. USER FEEDBACK
   - Search: "NPS survey {platform}"
   - Search: "user feedback collection"
   - Search: "support ticket analysis"
```

### Step 3: Analyze Data
```javascript
async function analyzeBusinessData(data) {
  const analysis = {
    revenue: {
      mrr: analyzeMRR(data.revenue),
      arr: analyzeARR(data.revenue),
      conversion: analyzeConversion(data.revenue),
      churn: analyzeChurn(data.revenue),
      trends: identifyTrends(data.revenue)
    },
    ux: {
      satisfaction: analyzeSatisfaction(data.ux),
      usability: analyzeUsability(data.ux),
      engagement: analyzeEngagement(data.ux),
      issues: identifyUXIssues(data.ux)
    },
    technical: {
      performance: analyzePerformance(data.technical),
      errors: analyzeErrors(data.technical),
      usage: analyzeUsage(data.technical)
    },
    feedback: {
      nps: analyzeNPS(data.feedback),
      csat: analyzeCSAT(data.feedback),
      tickets: analyzeTickets(data.feedback)
    }
  };
  
  return analysis;
}

function analyzeMRR(data) {
  return {
    current: data.currentMRR,
    previous: data.previousMRR,
    growth: ((data.currentMRR - data.previousMRR) / data.previousMRR) * 100,
    target: data.targetMRR,
    gap: data.targetMRR - data.currentMRR
  };
}

function analyzeConversion(data) {
  return {
    trialToPaid: data.trialToPaid,
    freeToPaid: data.freeToPaid,
    upsell: data.upsell,
    target: data.targetConversion,
    gap: data.targetConversion - data.currentConversion
  };
}

function analyzeChurn(data) {
  return {
    rate: data.churnRate,
    reasons: data.churnReasons,
    target: data.targetChurn,
    gap: data.currentChurn - data.targetChurn
  };
}

function analyzeSatisfaction(data) {
  return {
    nps: data.nps,
    csat: data.csat,
    ces: data.ces,
    target: data.targetNPS,
    gap: data.targetNPS - data.nps
  };
}
```

### Step 4: Identify Issues
```
IDENTIFY ISSUES:

REVENUE ISSUES:
- MRR below target?
- Conversion below target?
- Churn above target?

UX ISSUES:
- NPS below target?
- Task completion below target?
- Error rate above target?

TECHNICAL ISSUES:
- Performance below target?
- Uptime below target?
- Errors above target?

USER ISSUES:
- Support tickets high?
- Negative feedback?
- Feature requests?
```

### Step 5: Identify Opportunities
```
IDENTIFY OPPORTUNITIES:

GROWTH OPPORTUNITIES:
- New market segments?
- New features?
- New pricing?

IMPROVEMENT OPPORTUNITIES:
- UX improvements?
- Performance improvements?
- Cost reductions?

EXPERIMENT OPPORTUNITIES:
- A/B tests?
- New approaches?
- New tools?
```

### Step 6: Create Analysis Report
```markdown
# Business Monitoring Report

## Report Period
{start_date} - {end_date}

## Executive Summary
{brief summary of key findings}

## Revenue Analysis

### MRR
- Current: ${amount}
- Previous: ${amount}
- Growth: {rate}%
- Target: ${amount}
- Status: {On Track/Behind/Ahead}

### Conversion
- Trial→Paid: {rate}%
- Free→Paid: {rate}%
- Target: {rate}%
- Status: {On Track/Behind/Ahead}

### Churn
- Rate: {rate}%
- Target: {rate}%
- Status: {On Track/Behind/Ahead}

## UX Analysis

### Satisfaction
- NPS: {score}
- CSAT: {rate}%
- Target: {score}
- Status: {On Track/Behind/Ahead}

### Usability
- Task Completion: {rate}%
- Time on Task: {time}s
- Error Rate: {rate}%
- Status: {On Track/Behind/Ahead}

### Engagement
- DAU: {count}
- MAU: {count}
- Session Duration: {time}m
- Status: {On Track/Behind/Ahead}

## Technical Analysis

### Performance
- Response Time: {time}ms
- Uptime: {rate}%
- Status: {On Track/Behind/Ahead}

### Errors
- Error Rate: {rate}%
- Status: {On Track/Behind/Ahead}

## Issues Identified

### Issue 1: {title}
- Description: {description}
- Impact: {High/Medium/Low}
- Root Cause: {cause}
- Recommendation: {recommendation}

### Issue 2: {title}
- Description: {description}
- Impact: {High/Medium/Low}
- Root Cause: {cause}
- Recommendation: {recommendation}

## Opportunities Identified

### Opportunity 1: {title}
- Description: {description}
- Impact: {High/Medium/Low}
- Effort: {High/Medium/Low}
- Recommendation: {recommendation}

### Opportunity 2: {title}
- Description: {description}
- Impact: {High/Medium/Low}
- Effort: {High/Medium/Low}
- Recommendation: {recommendation}

## Recommendations

### Immediate Actions
1. {action}
2. {action}

### Short-term Improvements (1-2 weeks)
1. {improvement}
2. {improvement}

### Long-term Improvements (1-3 months)
1. {improvement}
2. {improvement}

## Next Review
{date}
```

### Step 7: Propose Improvements
```
CREATE PROPOSALS:

PROPOSAL 1: {title}
- Issue: {issue}
- Solution: {solution}
- Impact: {impact}
- Effort: {effort}
- Priority: {P0/P1/P2}

PROPOSAL 2: {title}
- Issue: {issue}
- Solution: {solution}
- Impact: {impact}
- Effort: {effort}
- Priority: {P0/P1/P2}

SAVE TO:
- production/monitoring/proposals/{date}.md
```

### Step 8: Notify Planning Team
```
NOTIFY:
- Product Manager: "Proposals ready for review"
- Business Analyst: "Analysis complete"
- Technical Director: "Technical issues identified"

MEETING:
- Review proposals
- Prioritize improvements
- Create new planning
```

## Output
- Business monitoring completed
- Issues identified
- Opportunities identified
- Proposals created
- Planning team notified
- Ready for improvement planning
