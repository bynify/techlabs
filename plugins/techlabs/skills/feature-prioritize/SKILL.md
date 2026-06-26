# feature-prioritize

Prioritize features using RICE, MoSCoW, or Value/Effort matrix.

## Execution

### Step 1: List Features
```
FEATURES:
1. User auth
2. Dashboard
3. Notifications
4. Export data
5. API v2
```

### Step 2: Score with RICE
```
FEATURE | REACH | IMPACT | CONFIDENCE | EFFORT | RICE SCORE
Auth    | 100   | 3      | 100%       | 5      | 60
Dash    | 80    | 3      | 80%        | 8      | 24
Export  | 30    | 2      | 90%        | 3      | 18
API v2  | 50    | 2      | 70%        | 13     | 5.4
```

### Step 3: Create Roadmap
```
NOW: Auth, Dashboard
NEXT: Export
LATER: API v2
```

## Output
- Feature scores
- Prioritized roadmap
- Rationale
