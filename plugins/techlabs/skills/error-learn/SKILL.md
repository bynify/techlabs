# error-learn

Learn from errors to prevent future occurrences through pattern detection and rule generation.

## When to Use
- After resolving errors
- Periodic error analysis
- Building prevention rules
- Improving error recovery

## Execution

### Step 1: Load Error History
```typescript
// .claude/errors/error-log.yaml
interface ErrorEntry {
  id: string;
  timestamp: string;
  type: 'runtime' | 'logic' | 'config' | 'dependency' | 'syntax';
  message: string;
  file: string;
  line?: number;
  stack?: string;
  resolved: boolean;
  resolution?: string;
  recoveryTime?: number; // seconds
}

async function loadErrors(): Promise<ErrorEntry[]> {
  const log = await readFile('.claude/errors/error-log.yaml');
  return parseYaml(log);
}
```

### Step 2: Classify Errors
```typescript
interface ErrorPattern {
  id: string;
  type: string;
  trigger: string;
  frequency: number;
  avgRecoveryTime: number;
  commonResolution: string;
  preventionRule?: string;
}

async function classifyErrors(errors: ErrorEntry[]): Promise<ErrorPattern[]> {
  const patterns: Map<string, ErrorPattern> = new Map();

  for (const error of errors) {
    const key = `${error.type}:${normalizeMessage(error.message)}`;
    const existing = patterns.get(key);

    if (existing) {
      existing.frequency++;
      existing.avgRecoveryTime = 
        (existing.avgRecoveryTime * (existing.frequency - 1) + (error.recoveryTime || 0)) / existing.frequency;
    } else {
      patterns.set(key, {
        id: generateId(),
        type: error.type,
        trigger: extractTrigger(error),
        frequency: 1,
        avgRecoveryTime: error.recoveryTime || 0,
        commonResolution: error.resolution || 'unknown',
      });
    }
  }

  return Array.from(patterns.values());
}
```

### Step 3: Extract Prevention Rules
```typescript
async function generatePreventionRules(patterns: ErrorPattern[]): Promise<PreventionRule[]> {
  const rules: PreventionRule[] = [];

  for (const pattern of patterns) {
    if (pattern.frequency >= 3) {
      const rule = await deriveRule(pattern);
      if (rule) {
        rules.push({
          id: pattern.id,
          trigger: pattern.trigger,
          condition: rule.condition,
          action: rule.action,
          message: rule.message,
          confidence: Math.min(pattern.frequency * 10, 100),
        });
      }
    }
  }

  return rules;
}

// Example rules generated:
const exampleRules = [
  {
    trigger: "database connection",
    condition: "pool_size < 10",
    action: "increase_pool_size",
    message: "Database connection pool too small for load",
  },
  {
    trigger: "JWT token",
    condition: "token_age > 24h",
    action: "refresh_token",
    message: "Token expired, implement refresh rotation",
  },
  {
    trigger: "API fetch",
    condition: "no_retry_logic",
    action: "add_retry",
    message: "Add exponential backoff retry for API calls",
  },
];
```

### Step 4: Update Error Patterns File
```typescript
// .claude/errors/patterns.json
interface ErrorPatternStore {
  lastUpdated: string;
  patterns: ErrorPattern[];
  preventionRules: PreventionRule[];
  statistics: {
    totalErrors: number;
    resolvedErrors: number;
    avgRecoveryTime: number;
    topErrorTypes: { type: string; count: number }[];
  };
}

async function updatePatternStore(patterns: ErrorPattern[], rules: PreventionRule[]) {
  const store: ErrorPatternStore = {
    lastUpdated: new Date().toISOString(),
    patterns,
    preventionRules: rules,
    statistics: calculateStatistics(patterns),
  };

  await writeFile('.claude/errors/patterns.json', JSON.stringify(store, null, 2));
}
```

### Step 5: Create Recovery Playbook
```yaml
# .claude/errors/recovery-playbook.yaml
playbook:
  - error_type: "database_connection_timeout"
    symptoms:
      - "connection timeout"
      - "pool exhausted"
    immediate_actions:
      - "Check connection pool size"
      - "Check database server health"
      - "Increase pool if needed"
    root_cause_analysis:
      - "Under-provisioned database"
      - "Connection leak in code"
      - "Missing connection cleanup"
    prevention:
      - "Set pool size based on load"
      - "Use connection middleware"
      - "Add connection health checks"
    auto_recovery:
      - action: "increase_pool"
        condition: "pool_size < 20"
      - action: "restart_connections"
        condition: "stale_connections > 5"

  - error_type: "jwt_expired"
    symptoms:
      - "401 Unauthorized"
      - "token expired"
    immediate_actions:
      - "Check token expiry"
      - "Implement refresh token flow"
    prevention:
      - "Use short-lived access tokens (15min)"
      - "Implement refresh token rotation"
      - "Add proactive token refresh"
```

### Step 6: Generate Learning Report
```markdown
# Error Learning Report

## Period: 2024-03-01 to 2024-03-15

## Statistics
- Total errors: 47
- Resolved: 42 (89%)
- Avg recovery time: 12 minutes
- Recurring errors: 5

## Learned Patterns

### 1. Database Connection Timeout (8 occurrences)
- **Trigger:** High traffic periods
- **Root cause:** Pool size too small (default 10)
- **Prevention rule:** Set pool_size = expected_concurrent_users * 2
- **Status:** Prevention rule added

### 2. JWT Token Expired (5 occurrences)
- **Trigger:** User inactive > 24h
- **Root cause:** No refresh token rotation
- **Prevention rule:** Implement refresh token flow
- **Status:** Implementation recommended

## New Prevention Rules
1. `check_pool_size`: Alert if pool_size < 10
2. `verify_token_expiry`: Check token age before API call
3. `add_retry_logic`: Add retry for external API calls

## Recovery Improvements
- Database timeout: Recovery time reduced from 20min to 5min
- Token expiry: Auto-refresh implemented
```

### Step 7: Hook Integration
```bash
#!/bin/bash
# hooks/post-error-learn.sh
# Runs after error resolution to capture learning

ERROR_TYPE=$1
RESOLUTION=$2
RECOVERY_TIME=$3

# Append to error log
echo "- type: $ERROR_TYPE" >> .claude/errors/error-log.yaml
echo "  resolution: $RESOLUTION" >> .claude/errors/error-log.yaml
echo "  recovery_time: $RECOVERY_TIME" >> .claude/errors/error-log.yaml
echo "  timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)" >> .claude/errors/error-log.yaml

# Trigger pattern analysis if enough new errors
ERROR_COUNT=$(grep -c "type:" .claude/errors/error-log.yaml)
if [ $((ERROR_COUNT % 10)) -eq 0 ]; then
  echo "TIP: Run /error-learn to analyze patterns"
fi
```

## Output
- .claude/errors/patterns.json
- .claude/errors/recovery-playbook.yaml
- Prevention rules
- Learning report
