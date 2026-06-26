# create-feature-flag

Feature flag system for gradual rollouts and A/B testing.

## When to Use
- Gradual feature rollout
- A/B testing
- Kill switches
- Beta features

## Execution

### Step 1: Feature Flag Config
```typescript
// src/feature-flags.ts
interface FeatureFlag {
  name: string;
  enabled: boolean;
  rolloutPercentage?: number;
  allowedUsers?: string[];
}

const flags: Record<string, FeatureFlag> = {
  new_checkout: { name: 'new_checkout', enabled: true, rolloutPercentage: 50 },
  beta_dashboard: { name: 'beta_dashboard', enabled: true, allowedUsers: ['usr_123'] },
};
```

### Step 2: Check Flag
```typescript
function isEnabled(flagName: string, userId: string): boolean {
  const flag = flags[flagName];
  if (!flag || !flag.enabled) return false;
  
  if (flag.allowedUsers?.includes(userId)) return true;
  
  if (flag.rolloutPercentage !== undefined) {
    const hash = hashCode(`${flagName}:${userId}`);
    return (hash % 100) < flag.rolloutPercentage;
  }
  
  return true;
}
```

### Step 3: Component Wrapper
```tsx
function FeatureGate({ flag, children, fallback }: Props) {
  const userId = useUserId();
  if (!isEnabled(flag, userId)) return fallback;
  return children;
}
```

## Output
- Flag configuration
- Evaluation logic
- Component wrapper
- Admin interface
