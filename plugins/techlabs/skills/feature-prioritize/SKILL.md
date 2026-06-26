# feature-prioritize

Prioritize features using RICE, MoSCoW, or Value/Effort matrix.

## When to Use
- Sprint planning
- Roadmap creation
- Resource allocation
- Stakeholder alignment

## Execution

### Step 1: Gather Feature List
```
ASK USER:
1. What features are being considered?
2. What's the goal? (growth, revenue, retention)
3. Resource constraints?
4. Timeline?
```

### Step 2: RICE Scoring
```
RICE = (Reach × Impact × Confidence) / Effort

REACH: How many users affected per quarter?
IMPACT: How much does it move the needle? (0.25=low, 0.5=medium, 1=high, 2=massive)
CONFIDENCE: How sure are we? (100%=high, 80%=medium, 50%=low)
EFFORT: Person-months to complete

EXAMPLE:
| Feature | Reach | Impact | Confidence | Effort | RICE |
|---------|-------|--------|------------|--------|------|
| Auth | 1000 | 1 | 100% | 2 | 500 |
| Dashboard | 800 | 0.5 | 80% | 1 | 320 |
| Export | 200 | 0.5 | 90% | 0.5 | 180 |
| API v2 | 500 | 0.5 | 70% | 3 | 58 |
```

### Step 3: MoSCoW Method
```
MUST HAVE (Won't launch without):
- Core feature A (the main value prop)
- Authentication
- Basic data persistence

SHOULD HAVE (Important but not critical):
- Advanced search
- Email notifications
- Mobile responsive

COULD HAVE (Nice to have):
- Dark mode
- Export to PDF
- Social sharing

WON'T HAVE (This release):
- Multi-language
- Mobile app
- AI features
```

### Step 4: Value/Effort Matrix
```
                    HIGH VALUE
                        │
     QUICK WINS         │         BIG BETS
     (Do First)         │         (Plan Carefully)
     Low Effort         │         High Effort
                        │
────────────────────────┼────────────────────────
                        │
     FILL-INS           │         MONEY PITS
     (Do Last)          │         (Avoid/Deprioritize)
     Low Effort         │         High Effort
                        │
                    LOW VALUE

QUICK WINS: Auth (3 days), Profile page (2 days)
BIG BETS: Payment integration (2 weeks), Real-time sync (3 weeks)
FILL-INS: Dark mode (1 day), Logo update (0.5 days)
MONEY PITS: Custom CMS (6 weeks), Blockchain integration (4 weeks)
```

### Step 5: Weighted Scoring
```typescript
interface FeatureScore {
  feature: string;
  userValue: number;      // 1-5
  businessValue: number;  // 1-5
  effort: number;         // 1-5 (inverse: 1=high, 5=low)
  risk: number;           // 1-5 (inverse: 1=high, 5=low)
  strategic: number;      // 1-5
}

function calculateScore(s: FeatureScore): number {
  const weights = {
    userValue: 0.35,
    businessValue: 0.25,
    effort: 0.20,
    risk: 0.10,
    strategic: 0.10,
  };
  
  return (
    s.userValue * weights.userValue +
    s.businessValue * weights.businessValue +
    s.effort * weights.effort +
    s.risk * weights.risk +
    s.strategic * weights.strategic
  );
}
```

### Step 6: Generate Priority Report
```markdown
# Feature Priority Report

## Methodology: RICE + MoSCoW

## Top Priority (Do Now)
| Rank | Feature | RICE Score | MoSCoW | Est. |
|------|---------|------------|--------|------|
| 1 | User Auth | 500 | Must | 2 weeks |
| 2 | Dashboard | 320 | Must | 1 week |
| 3 | Export CSV | 180 | Should | 3 days |

## Backlog (Do Next)
| Rank | Feature | RICE Score | MoSCoW | Est. |
|------|---------|------------|--------|------|
| 4 | Notifications | 120 | Should | 1 week |
| 5 | API v2 | 58 | Could | 3 weeks |

## Deprioritized (Won't Do Now)
| Feature | Reason |
|---------|--------|
| Blockchain | Low value, high effort |
| Custom CMS | Build vs buy |
```

## Output
- RICE scores
- MoSCoW categories
- Value/Effort matrix
- Priority recommendations
- Feature roadmap
