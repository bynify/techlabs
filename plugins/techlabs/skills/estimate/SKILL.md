# estimate

Estimate project effort, timeline, and complexity.

## When to Use
- Project planning
- Sprint planning
- Client proposals

## Execution

### Step 1: Break Down Work
```
FEATURES:
1. Auth system
2. User dashboard
3. API endpoints
4. Admin panel
5. Payments integration
```

### Step 2: Estimate Each
```
FEATURE         | COMPLEXITY | POINTS | DAYS
Auth system     | Medium     | 8      | 3-4
User dashboard  | Low        | 5      | 2-3
API endpoints   | Medium     | 8      | 3-4
Admin panel     | Low        | 5      | 2-3
Payments        | High       | 13     | 5-7

TOTAL: 39 points | 15-21 days
```

### Step 3: Add Buffers
```
OPTIMISTIC: 15 days
REALISTIC: 21 days (+40%)
PESSIMISTIC: 28 days (+87%)

RECOMMEND: Plan for 21 days, buffer to 25
```

### Step 4: Risk Assessment
```
RISKS:
- Payment provider API: +3 days
- Auth edge cases: +2 days
- Scope creep: +5 days

MITIGATION:
- Spike payment integration early
- Use proven auth library
- Strict scope management
```

## Output
- Feature breakdown
- Time estimates
- Risk assessment
- Timeline recommendation
