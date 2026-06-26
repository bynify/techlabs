# feature-flags

Manage feature flags for gradual rollout and A/B testing.

## When to Use
- Feature ready for rollout
- A/B testing needed
- Quick rollback needed
- Gradual deployment

## Agents to Dispatch
- lead-engineer: Feature flag management
- devops-engineer: Deployment flags

## Enforcement

```
⚠️ MANDATORY: Feature flags for new features

FEATURE FLAGS ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST IMPLEMENT:
1. Feature flag for each new feature
2. Gradual rollout capability
3. A/B testing capability
4. Quick rollback capability

MUST TRACK:
1. Flag status (on/off)
2. Flag percentage (rollout %)
3. Flag metrics (usage, errors)
4. Flag history (changes)

MUST MANAGE:
1. Flag lifecycle
2. Flag cleanup
3. Flag documentation
```

## Execution

### Step 1: Create Feature Flag
```
FEATURE FLAG:

Name: {feature_name}
Description: {description}
Type: {boolean/percentage/multivariate}
Default: {on/off}
Rollout Strategy: {gradual/sudden}

Environments:
- Development: {on/off}
- Staging: {on/off}
- Production: {on/off/percentage}
```

### Step 2: Implement Feature Flag
```javascript
// Feature Flag Implementation

// 1. Define flag configuration
const featureFlags = {
  'new-checkout': {
    enabled: true,
    rolloutPercentage: 50,
    environments: {
      development: true,
      staging: true,
      production: 50
    }
  },
  'dark-mode': {
    enabled: true,
    rolloutPercentage: 100,
    environments: {
      development: true,
      staging: true,
      production: 100
    }
  }
};

// 2. Check flag
function isFeatureEnabled(flagName, userId) {
  const flag = featureFlags[flagName];
  
  if (!flag || !flag.enabled) {
    return false;
  }
  
  // Percentage-based rollout
  const userHash = hashUserId(userId);
  const percentage = userHash % 100;
  
  return percentage < flag.rolloutPercentage;
}

// 3. Get flag value
function getFeatureFlag(flagName, userId) {
  const flag = featureFlags[flagName];
  
  if (!flag) {
    return null;
  }
  
  return {
    enabled: isFeatureEnabled(flagName, userId),
    percentage: flag.rolloutPercentage,
    variant: getVariant(flagName, userId)
  };
}
```

### Step 3: Create Flag Dashboard
```markdown
# Feature Flags Dashboard

## Date
{date}

## Active Flags

| Flag | Status | Rollout | Environments | Metrics |
|------|--------|---------|--------------|---------|
| {flag 1} | {on/off} | {percentage}% | {envs} | {metrics} |
| {flag 2} | {on/off} | {percentage}% | {envs} | {metrics} |

## Flag Details

### Flag: {flag_name}
**Description:** {description}
**Status:** {on/off}
**Rollout:** {percentage}%

**Environments:**
- Development: {on/off}
- Staging: {on/off}
- Production: {on/off/percentage}

**Metrics:**
- Usage: {count}
- Errors: {count}
- Conversion: {rate}%

**History:**
| Date | Change | User |
|------|--------|------|
| {date} | {change} | {user} |

## Rollout Strategy

### Gradual Rollout
1. Development → 100%
2. Staging → 100%
3. Production → 10%
4. Production → 50%
5. Production → 100%

### A/B Testing
- Variant A: {description}
- Variant B: {description}
- Split: {percentage}%
- Duration: {days} days

## Rollback Plan
1. Disable flag
2. Verify rollback
3. Notify team
4. Investigate issue
```

### Step 4: Track Flag Metrics
```
FOR EACH FLAG:

1. USAGE METRICS
   - How many users see the feature?
   - How many users use the feature?
   - How many users convert?

2. ERROR METRICS
   - Any errors related to the feature?
   - Error rate for feature users?
   - Error rate for non-feature users?

3. PERFORMANCE METRICS
   - Response time with feature?
   - Response time without feature?
   - Performance impact?

4. BUSINESS METRICS
   - Conversion rate with feature?
   - Revenue impact?
   - User satisfaction?
```

### Step 5: A/B Testing
```
FOR A/B TESTS:

1. DEFINE VARIANTS
   - Variant A: {description}
   - Variant B: {description}
   - Control: {description}

2. SET SPLIT
   - Traffic split: {percentage}%
   - User split: {percentage}%
   - Duration: {days} days

3. COLLECT DATA
   - Track variant assignment
   - Track user behavior
   - Track conversion

4. ANALYZE RESULTS
   - Statistical significance
   - Conversion difference
   - Business impact

5. DECIDE
   - Winner: {variant}
   - Action: {rollout/rollback}
```

### Step 6: Cleanup Flags
```
AFTER FEATURE FULLY ROLLED OUT:

1. REMOVE FLAG FROM CODE
   - Remove flag checks
   - Remove flag configuration
   - Clean up code

2. UPDATE DOCUMENTATION
   - Remove flag from dashboard
   - Update feature documentation
   - Update architecture docs

3. ARCHIVE FLAG
   - Move to archive
   - Keep history
   - Document decision
```

## Output
- Feature flags created
- Flags implemented
- Flags tracked
- A/B tests conducted
- Flags cleaned up
