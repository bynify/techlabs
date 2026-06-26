# churn-analysis

Analyze user churn patterns and build retention strategies.

## When to Use
- High churn rate
- Retention optimization
- User lifecycle analysis

## Execution

### Step 1: Define Churn
```
METRICS:
- Churn rate = lost users / total users (monthly)
- Cohort retention = % users active after N days
- Revenue churn = lost MRR / total MRR
```

### Step 2: Cohort Analysis
```sql
SELECT
  DATE_TRUNC('month', first_seen) AS cohort,
  COUNT(DISTINCT CASE WHEN active_month = 0 THEN user_id END) AS month_0,
  COUNT(DISTINCT CASE WHEN active_month = 1 THEN user_id END) AS month_1,
  COUNT(DISTINCT CASE WHEN active_month = 2 THEN user_id END) AS month_2
FROM user_activity
GROUP BY 1
ORDER BY 1;
```

### Step 3: Churn Reasons
```
ANALYZE:
- Last action before churn
- Support tickets
- Feature usage patterns
- NPS responses
```

### Step 4: Retention Strategies
```
IF churn_stage == "first_week":
  → Onboarding emails
  → Guided tour
  
IF churn_stage == "month_1":
  → Feature discovery
  → Check-in call
  
IF churn_stage == "power_user":
  → Save offer
  → Exit survey
```

## Output
- Churn metrics
- Cohort analysis
- Churn reasons
- Retention strategies
