# jobs-to-be-done

Analyze user Jobs-To-Be-Done (JTBD) for product and feature discovery.

## When to Use
- Product strategy
- Feature prioritization
- User research
- Marketing messaging

## Execution

### Step 1: Define Research Approach
```
ASK USER:
1. Who are the target users?
2. What context are they in?
3. What job are they trying to get done?
4. Current alternatives they use?
5. What fails with current solutions?
```

### Step 2: Interview Framework
```
JTBD INTERVIEW PROMPTS:

1. DISCOVERY
- "Tell me about the last time you [job context]"
- "What were you trying to accomplish?"
- "What was happening around you?"

2. CURRENT SOLUTION
- "What do you do now to get this job done?"
- "What tools/products do you use?"
- "How did you start using them?"

3. PAIN POINTS
- "What's frustrating about the current way?"
- "What takes too long?"
- "What doesn't work as expected?"

4. DESIRED OUTCOME
- "What would success look like?"
- "How would you measure if it worked?"
- "What would make you switch?"
```

### Step 3: Define Jobs
```markdown
## Job Statement

**As a** [user type]
**When** [situation/context]
**I want to** [motivation/desire]
**So I can** [expected outcome]

### Push Factors (What drives change)
- Current solution is frustrating
- New situation requires different approach
- Cost/effort too high

### Pull Factors (What attracts to new solution)
- Better features
- Lower cost
- Ease of use
- Social proof

### Anxiety Factors (What holds back)
- Learning curve
- Switching costs
- Risk of failure
- Data migration
```

### Step 4: Job Categories
```
FUNCTIONAL JOB:
- Get [task] done
- Achieve [goal]
- Solve [problem]

EMOTIONAL JOB:
- Feel [emotion]
- Appear [perception]
- Avoid [negative emotion]

SOCIAL JOB:
- Be seen as [role]
- Fit in with [group]
- Gain [status]
```

### Step 5: Prioritize Jobs
```
SCORING (1-5):

| Job | Frequency | Importance | Current Satisfaction | Opportunity |
|-----|-----------|------------|---------------------|-------------|
| Track expenses | Daily | High | Low (2/5) | High |
| Generate report | Weekly | Medium | Medium (3/5) | Medium |
| Share with team | Daily | High | Low (1/5) | High |

OPPORTUNITY = Frequency × Importance × (5 - Satisfaction)
```

### Step 6: Map to Features
```markdown
## Job: Track daily expenses

### Current Solution
- Spreadsheets
- Paper receipts
- Memory

### Pain Points
- Time consuming
- Easy to forget
- No real-time view

### Feature Mapping
| Feature | Job Solved | Priority |
|---------|-----------|----------|
| Receipt scanner | Reduce manual entry | P0 |
| Auto-categorize | Save time | P0 |
| Real-time dashboard | Visibility | P1 |
| Budget alerts | Stay on track | P1 |
| Team sharing | Collaboration | P2 |

### Success Metrics
- Time to log expense: <30 seconds
- Accuracy: >95%
- Daily active usage: >80%
```

### Step 7: Generate Report
```markdown
# JTBD Analysis Report

## Key Jobs Identified

### Job 1: Track daily expenses (HIGH PRIORITY)
- Frequency: Daily
- Current satisfaction: 2/5
- Opportunity: HIGH
- Features: Receipt scanner, auto-categorize, dashboard

### Job 2: Generate monthly reports (MEDIUM PRIORITY)
- Frequency: Monthly
- Current satisfaction: 3/5
- Opportunity: MEDIUM
- Features: Auto-reports, export, sharing

### Job 3: Collaborate with team (HIGH PRIORITY)
- Frequency: Daily
- Current satisfaction: 1/5
- Opportunity: HIGH
- Features: Shared views, comments, approvals

## Recommendations
1. Focus on Job 1 and Job 3 first
2. Build receipt scanner as core feature
3. Position as "expense tracking that takes seconds"
```

## Output
- Job definitions (with push/pull/anxiety)
- Job prioritization matrix
- Feature mapping
- Success metrics
- Research report
