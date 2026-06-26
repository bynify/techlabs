# smart-suggest

Context-aware suggestions based on current task, project state, and history.

## When to Use
- During development
- When stuck
- Finding relevant skills
- Discovering similar past work

## Execution

### Step 1: Load Context
```typescript
// .claude/context/current.json
interface ProjectContext {
  currentTask: string;
  recentFiles: string[];
  recentErrors: string[];
  projectType: string;
  techStack: string[];
  activeDomain: string;
}

async function loadContext(): Promise<ProjectContext> {
  const sessionState = await readFile('production/session-state/active.md');
  const recentActivity = await readFile('.claude/analytics/recent.json');
  
  return parseContext(sessionState, recentActivity);
}
```

### Step 2: Suggestion Engine
```typescript
// .claude/suggestions/engine.ts
interface Suggestion {
  id: string;
  type: 'skill' | 'agent' | 'pattern' | 'fix' | 'improvement';
  title: string;
  description: string;
  confidence: number; // 0-100
  action: string; // command or code
  reasoning: string;
}

async function generateSuggestions(context: ProjectContext): Promise<Suggestion[]> {
  const suggestions: Suggestion[] = [];

  // 1. Match skills to current task
  const taskSuggestions = await matchSkillsToTask(context.currentTask);
  suggestions.push(...taskSuggestions);

  // 2. Find similar past decisions
  const historySuggestions = await findSimilarDecisions(context);
  suggestions.push(...historySuggestions);

  // 3. Detect potential issues
  const issueSuggestions = await detectPotentialIssues(context);
  suggestions.push(...issueSuggestions);

  // 4. Recommend best practices
  const practiceSuggestions = await recommendPractices(context);
  suggestions.push(...practiceSuggestions);

  return suggestions.sort((a, b) => b.confidence - a.confidence).slice(0, 5);
}
```

### Step 3: Task-to-Skill Matching
```typescript
async function matchSkillsToTask(task: string): Promise<Suggestion[]> {
  const skillIndex = await loadSkillIndex();
  const suggestions: Suggestion[] = [];

  const taskKeywords = extractKeywords(task);

  for (const skill of skillIndex) {
    const relevance = calculateRelevance(taskKeywords, skill.keywords);
    if (relevance > 0.6) {
      suggestions.push({
        id: `skill-${skill.name}`,
        type: 'skill',
        title: `Run /${skill.name}`,
        description: skill.description,
        confidence: Math.round(relevance * 100),
        action: `/${skill.name}`,
        reasoning: `Matches task keywords: ${skill.matchedKeywords.join(', ')}`,
      });
    }
  }

  return suggestions;
}
```

### Step 4: History-Based Suggestions
```typescript
async function findSimilarDecisions(context: ProjectContext): Promise<Suggestion[]> {
  const decisions = await readFile('.claude/decisions/history.json');
  const suggestions: Suggestion[] = [];

  for (const decision of decisions) {
    const similarity = calculateSimilarity(context.currentTask, decision.task);
    if (similarity > 0.7) {
      suggestions.push({
        id: `history-${decision.id}`,
        type: 'pattern',
        title: `Similar past decision: ${decision.title}`,
        description: decision.outcome,
        confidence: Math.round(similarity * 100),
        action: `Review: docs/decisions/${decision.file}`,
        reasoning: `Similar task resolved on ${decision.date}`,
      });
    }
  }

  return suggestions;
}
```

### Step 5: Issue Detection
```typescript
async function detectPotentialIssues(context: ProjectContext): Promise<Suggestion[]> {
  const suggestions: Suggestion[] = [];
  const errorPatterns = await readFile('.claude/errors/patterns.json');

  // Check if current task matches known error patterns
  for (const pattern of errorPatterns) {
    if (context.currentTask.includes(pattern.trigger)) {
      suggestions.push({
        id: `issue-${pattern.id}`,
        type: 'fix',
        title: `Watch out: ${pattern.description}`,
        description: `This task has caused errors before: ${pattern.error}`,
        confidence: pattern.frequency * 20,
        action: `Apply fix: ${pattern.fix}`,
        reasoning: `Error occurred ${pattern.frequency} times`,
      });
    }
  }

  return suggestions;
}
```

### Step 6: Present Suggestions
```
SMART SUGGESTIONS:

1. 🎯 Run /api-design (92% confidence)
   Your task "create user endpoint" matches this skill
   → /api-design

2. 📋 Similar decision found (85% confidence)
   You solved "user authentication" on 2024-03-10
   → Review: docs/decisions/ADR-003-auth.md

3. ⚠️ Watch out: DB connection pool (78% confidence)
   This pattern caused errors 3 times before
   → Increase pool size, add retry logic

4. 💡 Use error boundary (70% confidence)
   Component has no error handling
   → Add <ErrorBoundary> wrapper

5. 📦 Consider caching (65% confidence)
   Similar API call pattern benefits from cache
   → Add Redis cache with 5min TTL
```

### Step 7: Feedback Loop
```typescript
// Track suggestion acceptance
async function trackSuggestionFeedback(suggestionId: string, accepted: boolean) {
  const feedback = await readFile('.claude/suggestions/feedback.json');
  feedback.push({
    suggestionId,
    accepted,
    timestamp: new Date().toISOString(),
  });
  await writeFile('.claude/suggestions/feedback.json', feedback);
  
  // Update confidence model
  await updateConfidenceModel(suggestionId, accepted);
}
```

## Output
- Suggestions ranked by confidence
- Actionable commands
- Reasoning for each suggestion
- Feedback tracking
