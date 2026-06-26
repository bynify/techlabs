# create-ab-test

Implement A/B testing with feature flags, variant assignment, and tracking.

## When to Use
- Testing UI changes
- Comparing conversion rates
- Validating new features
- Measuring user behavior

## Execution

### Step 1: Define Experiment
```
ASK USER:
1. What are we testing?
2. What's the control (A) and variant (B)?
3. What metric defines success?
4. Sample size needed?
5. How long to run?
```

### Step 2: Implement Feature Flag
```typescript
// src/lib/experiments.ts
interface Experiment {
  id: string;
  name: string;
  variants: { id: string; weight: number }[];
}

const experiments: Experiment[] = [
  {
    id: 'checkout-redesign',
    name: 'New Checkout Flow',
    variants: [
      { id: 'control', weight: 50 },
      { id: 'variant-b', weight: 50 },
    ],
  },
];

function getVariant(experimentId: string, userId: string): string {
  const experiment = experiments.find(e => e.id === experimentId)!;
  const hash = hashCode(`${experimentId}:${userId}`);
  const bucket = hash % 100;
  
  let cumulative = 0;
  for (const variant of experiment.variants) {
    cumulative += variant.weight;
    if (bucket < cumulative) return variant.id;
  }
  return experiment.variants[0].id;
}
```

### Step 3: Track Exposures and Conversions
```typescript
// Track when user sees variant
function trackExposure(experimentId: string, variantId: string, userId: string) {
  analytics.track('experiment_exposure', {
    experiment_id: experimentId,
    variant_id: variantId,
    user_id: userId,
  });
}

// Track conversion event
function trackConversion(experimentId: string, variantId: string, userId: string, metric: string) {
  analytics.track('experiment_conversion', {
    experiment_id: experimentId,
    variant_id: variantId,
    user_id: userId,
    metric,
  });
}
```

### Step 4: Component Wrapper
```tsx
function ExperimentGate({ experimentId, children, fallback }: Props) {
  const userId = useUserId();
  const variant = getVariant(experimentId, userId);

  useEffect(() => {
    trackExposure(experimentId, variant, userId);
  }, [experimentId, variant, userId]);

  if (variant === 'control') return fallback;
  return children;
}

// Usage
<ExperimentGate experimentId="checkout-redesign" fallback={<OldCheckout />}>
  <NewCheckout />
</ExperimentGate>
```

## Output
- Experiment configuration
- Variant assignment logic
- Tracking events
- Component wrapper
