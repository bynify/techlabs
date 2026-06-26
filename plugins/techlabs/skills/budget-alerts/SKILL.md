# budget-alerts

Configure budget alerts and cost notifications.

## When to Use
- Budget setup
- Cost alerts
- Spending notifications
- Financial planning

## Execution

### Step 1: Set Budget
```yaml
# Cloudflare Budget
monthly_budget: 100
currency: USD

# AWS Budget
BudgetName: MonthlyBudget
BudgetLimit: 100
BudgetUnit: USD
TimeUnit: MONTHLY
```

### Step 2: Configure Alerts
```yaml
# Alert Thresholds
thresholds:
  - 50: email
  - 75: email + slack
  - 90: email + slack + sms
  - 100: email + slack + sms + stop
```

### Step 3: Create Alert Rules
```typescript
// Budget alert configuration
const budgetAlerts = [
  {
    threshold: 50,
    channels: ['email'],
    message: 'Budget 50% reached'
  },
  {
    threshold: 75,
    channels: ['email', 'slack'],
    message: 'Budget 75% reached'
  },
  {
    threshold: 90,
    channels: ['email', 'slack', 'sms'],
    message: 'Budget 90% reached - URGENT'
  },
  {
    threshold: 100,
    channels: ['email', 'slack', 'sms'],
    message: 'Budget EXCEEDED - Take action',
    action: 'notify-cto'
  }
];
```

### Step 4: Notification Channels
```yaml
Email:
  - admin@example.com
  - finance@example.com

Slack:
  channel: '#budget-alerts'
  webhook: https://hooks.slack.com/xxx

SMS:
  - +1234567890
```

## Output
- Budget set
- Alerts configured
- Notifications channels set
- Monitoring active
