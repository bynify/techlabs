# generate-report

Generate weekly/monthly analytics report.

## Execution

### Step 1: Load Analytics Data
```
READ:
- .claude/analytics/skill-usage.yaml
- .claude/analytics/agent-performance.yaml
- .claude/analytics/decision-history.yaml
- .claude/analytics/improvement-log.yaml
```

### Step 2: Calculate Metrics
```
METRICS:
- Total executions this period
- Success rate by skill
- Most/least active agents
- Decision outcomes
- Improvements made
```

### Step 3: Generate Report
```
CREATE:
- reports/YYYY-MM-report.md
- Summary section
- Detailed metrics
- Trends analysis
- Recommendations
```

### Step 4: Show Report
```
DISPLAY:
- Report summary
- Key findings
- Action items
```

## Output
- Report file
- Summary
