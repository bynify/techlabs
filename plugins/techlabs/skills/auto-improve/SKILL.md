# auto-improve

Automatically improve skills, rules, and agents based on usage patterns and feedback.

## When to Use
- Periodic improvement cycles
- After error patterns detected
- Low success rate on skills
- User feedback collected

## Execution

### Step 1: Collect Metrics
```typescript
// .claude/analytics/skill-metrics.json
interface SkillMetric {
  skill: string;
  totalRuns: number;
  successfulRuns: number;
  failedRuns: number;
  averageDuration: number;
  commonErrors: string[];
  userFeedback: { positive: number; negative: number };
}

async function collectMetrics(): Promise<SkillMetric[]> {
  const usage = await readFile('.claude/analytics/skill-usage.json');
  const errors = await readFile('.claude/errors/error-log.yaml');
  const feedback = await readFile('.claude/suggestions/feedback.json');

  return aggregateMetrics(usage, errors, feedback);
}
```

### Step 2: Identify Improvement Targets
```typescript
interface ImprovementTarget {
  skill: string;
  issue: string;
  severity: 'high' | 'medium' | 'low';
  proposedFix: string;
  estimatedImpact: number;
}

async function identifyTargets(metrics: SkillMetric[]): Promise<ImprovementTarget[]> {
  const targets: ImprovementTarget[] = [];

  for (const metric of metrics) {
    const successRate = metric.successfulRuns / metric.totalRuns;

    // Low success rate
    if (successRate < 0.7 && metric.totalRuns > 5) {
      targets.push({
        skill: metric.skill,
        issue: `Low success rate: ${Math.round(successRate * 100)}%`,
        severity: 'high',
        proposedFix: `Review and fix common errors: ${metric.commonErrors.join(', ')}`,
        estimatedImpact: 0.3,
      });
    }

    // Common errors
    if (metric.commonErrors.length > 2) {
      targets.push({
        skill: metric.skill,
        issue: `Multiple error types: ${metric.commonErrors.length}`,
        severity: 'medium',
        proposedFix: 'Add error handling and validation steps',
        estimatedImpact: 0.2,
      });
    }

    // Negative feedback
    if (metric.userFeedback.negative > metric.userFeedback.positive) {
      targets.push({
        skill: metric.skill,
        issue: 'More negative than positive feedback',
        severity: 'medium',
        proposedFix: 'Review user feedback and adjust skill behavior',
        estimatedImpact: 0.25,
      });
    }
  }

  return targets.sort((a, b) => b.estimatedImpact - a.estimatedImpact);
}
```

### Step 3: Generate Improvements
```typescript
interface SkillImprovement {
  skill: string;
  section: string;
  currentContent: string;
  improvedContent: string;
  reason: string;
}

async function generateImprovement(target: ImprovementTarget): Promise<SkillImprovement> {
  const currentSkill = await readFile(`skills/${target.skill}/SKILL.md`);
  const errorPatterns = await readFile('.claude/errors/patterns.json');

  // Analyze what's failing
  const failingSteps = identifyFailingSteps(errorPatterns, target.skill);

  // Generate improved content
  const improved = await enhanceSkillContent(currentSkill, failingSteps);

  return {
    skill: target.skill,
    section: 'Execution',
    currentContent: currentSkill,
    improvedContent: improved,
    reason: target.proposedFix,
  };
}
```

### Step 4: Apply Improvements
```typescript
async function applyImprovement(improvement: SkillImprovement): Promise<void> {
  // 1. Backup current version
  await backupSkill(improvement.skill);

  // 2. Apply changes
  await writeFile(
    `skills/${improvement.skill}/SKILL.md`,
    improvement.improvedContent
  );

  // 3. Log improvement
  await logImprovement({
    skill: improvement.skill,
    timestamp: new Date().toISOString(),
    reason: improvement.reason,
    diff: generateDiff(improvement.currentContent, improvement.improvedContent),
  });

  // 4. Update version
  await incrementSkillVersion(improvement.skill);
}
```

### Step 5: Track Results
```yaml
# .claude/improvements/log.yaml
improvements:
  - skill: "api-design"
    date: "2024-03-15"
    reason: "Low success rate on error handling"
    changes:
      - "Added validation step before implementation"
      - "Added error response examples"
    result:
      success_rate_before: 65%
      success_rate_after: 89%
      improvement: "+24%"

  - skill: "create-worker"
    date: "2024-03-14"
    reason: "Common wrangler.toml misconfiguration"
    changes:
      - "Added wrangler.toml validation step"
      - "Added environment-specific examples"
    result:
      success_rate_before: 72%
      success_rate_after: 95%
      improvement: "+23%"
```

### Step 6: Periodic Review Schedule
```
IMPROVEMENT CYCLE:

Daily:
- Collect error logs
- Track skill usage

Weekly:
- Analyze success rates
- Identify improvement targets
- Generate improvement proposals

Monthly:
- Apply approved improvements
- Measure impact
- Update improvement rules
```

### Step 7: Generate Report
```markdown
# Auto-Improve Report

## Summary
- Skills analyzed: 201
- Improvement targets: 5
- Improvements applied: 3
- Average success rate improvement: +22%

## Applied Improvements

### 1. api-design (+24% success rate)
- **Issue:** Low success rate on error handling
- **Fix:** Added validation step and error examples
- **Result:** 65% → 89% success rate

### 2. create-worker (+23% success rate)
- **Issue:** Common wrangler.toml misconfiguration
- **Fix:** Added validation and environment examples
- **Result:** 72% → 95% success rate

## Pending Improvements

### 3. create-dockerfile (estimated +15%)
- **Issue:** Multi-stage build confusion
- **Proposed Fix:** Add language-specific templates
- **Status:** Awaiting review
```

## Output
- .claude/analytics/skill-metrics.json
- .claude/improvements/log.yaml
- Improvement report
- Updated skills
