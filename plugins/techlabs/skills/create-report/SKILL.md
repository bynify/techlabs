# create-report

Generate reports from data (analytics, performance, status).

## When to Use
- Weekly reports
- Performance reviews
- Status updates

## Execution

### Step 1: Define Report Type
```
TYPES:
- Performance: API metrics, error rates
- Analytics: Users, traffic, conversions
- Status: Sprint progress, blockers
- Financial: Revenue, costs
```

### Step 2: Gather Data
```typescript
async function generateReport(type: string, period: DateRange) {
  const data = await fetchMetrics(type, period);
  return {
    period,
    summary: calculateSummary(data),
    trends: calculateTrends(data),
    highlights: identifyHighlights(data),
  };
}
```

### Step 3: Format Report
```markdown
# {Type} Report: {Period}

## Summary
- Key metric 1: value (change%)
- Key metric 2: value (change%)

## Trends
- Upward/downward trend description

## Highlights
- Notable achievement
- Area needing attention

## Next Steps
- Recommended action 1
- Recommended action 2
```

## Output
- Report generation
- Data aggregation
- Formatting
- Distribution
