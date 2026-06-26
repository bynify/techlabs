# create-funnel-analysis

Build funnel analytics to track user conversion through key workflows.

## When to Use
- Checkout optimization
- Onboarding analysis
- Conversion tracking
- Drop-off identification

## Execution

### Step 1: Define Funnel Steps
```typescript
// src/analytics/funnels.ts
const checkoutFunnel: FunnelDefinition = {
  name: 'checkout',
  steps: [
    { event: 'page_view', filter: { path: '/checkout' } },
    { event: 'shipping_entered' },
    { event: 'payment_entered' },
    { event: 'order_submitted' },
    { event: 'order_confirmed' },
  ],
  timeWindow: 30 * 60 * 1000, // 30 minutes
};
```

### Step 2: Track Funnel Events
```typescript
function trackFunnelStep(funnelId: string, step: number, userId: string) {
  analytics.track('funnel_step', {
    funnel_id: funnelId,
    step,
    user_id: userId,
    timestamp: Date.now(),
  });
}
```

### Step 3: Calculate Conversion Rates
```typescript
async function getFunnelMetrics(funnelId: string, dateRange: DateRange) {
  const events = await analytics.getEvents('funnel_step', dateRange);
  
  const funnelEvents = events.filter(e => e.properties.funnel_id === funnelId);
  
  // Group by user and get furthest step
  const userProgress = new Map<string, number>();
  for (const event of funnelEvents) {
    const current = userProgress.get(event.user_id) || 0;
    if (event.properties.step > current) {
      userProgress.set(event.user_id, event.properties.step);
    }
  }

  const metrics = [];
  for (let i = 0; i < 5; i++) {
    const usersAtStep = [...userProgress.values()].filter(s => s >= i).length;
    metrics.push({
      step: i,
      users: usersAtStep,
      rate: i === 0 ? 100 : (usersAtStep / metrics[0].users) * 100,
    });
  }

  return metrics;
}
```

### Step 4: Visualize Results
```
FUNNEL: Checkout

Step 1: Page View      ████████████████████ 10,000 (100%)
Step 2: Shipping       ████████████████      8,000 (80%)
Step 3: Payment        ████████████          6,000 (60%)
Step 4: Submit         ██████████            5,000 (50%)
Step 5: Confirmed      ████████              4,000 (40%)

Biggest drop-off: Payment → Submit (17% drop)
```

## Output
- Funnel definitions
- Event tracking
- Conversion metrics
- Drop-off analysis
