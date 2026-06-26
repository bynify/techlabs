# session-optimize

Optimize Claude Code session for day-to-day usage with large docs and code.

## When to Use
- Session getting slow
- Token usage too high
- Context too large
- Starting new day
- Resuming work

## Agents to Dispatch
- lead-engineer: Session management
- All agents: Follow optimization rules

## Enforcement

```
⚠️ MANDATORY: Session optimization for all workflows

SESSION OPTIMIZATION RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RULE 1: LAZY LOADING
- Don't load everything at once
- Load only what's needed NOW
- Load other docs when needed

RULE 2: CONTEXT WINDOW
- Max context: 80% of token limit
- If exceeded → compress or reset
- Track context size

RULE 3: KNOWLEDGE BASE
- Load relevant docs only
- Don't load all docs
- Query knowledge base on demand

RULE 4: SESSION SIZE
- Track session size
- Warn at 70% capacity
- Suggest reset at 90% capacity

RULE 5: CHECKPOINT
- Save progress regularly
- Resume from checkpoint
- Don't repeat work

RULE 6: COMPRESSION
- Compress old context
- Keep only essential info
- Summarize completed work

RULE 7: RESET STRATEGY
- Reset after major phase
- Reset after long sessions
- Reset when stuck
```

## Execution

### Step 1: Analyze Session Size
```javascript
async function analyzeSessionSize(session) {
  const metrics = {
    totalTokens: session.tokens,
    contextSize: session.context.length,
    filesLoaded: session.files.length,
    messagesCount: session.messages.length,
    lastActivity: session.lastActivity
  };
  
  // Calculate health
  const health = {
    tokenUsage: metrics.totalTokens / getMaxTokens(),
    contextHealth: metrics.contextSize > 10000 ? 'large' : 'normal',
    fileLoad: metrics.filesLoaded > 20 ? 'high' : 'normal',
    age: Date.now() - metrics.lastActivity
  };
  
  // Recommendations
  const recommendations = [];
  
  if (health.tokenUsage > 0.7) {
    recommendations.push('Token usage high. Consider resetting session.');
  }
  
  if (health.contextHealth === 'large') {
    recommendations.push('Context too large. Consider compressing.');
  }
  
  if (health.fileLoad === 'high') {
    recommendations.push('Too many files loaded. Consider unloading.');
  }
  
  return { metrics, health, recommendations };
}
```

### Step 2: Create Session Optimization
```markdown
# Session Optimization Report

## Session Health

| Metric | Value | Status |
|--------|-------|--------|
| Token Usage | {percentage}% | {good/warning/critical} |
| Context Size | {size} | {normal/large} |
| Files Loaded | {count} | {normal/high} |
| Messages | {count} | {normal/high} |
| Session Age | {hours}h | {fresh/aged/old} |

## Optimization Recommendations

### If Token Usage > 70%
**Action:** Reset session
**Why:** Token limit approaching
**How:** /start-day to resume

### If Context Size > 10000
**Action:** Compress context
**Why:** Too much context loaded
**How:** Summarize old messages

### If Files Loaded > 20
**Action:** Unload unused files
**Why:** Memory pressure
**How:** Only load needed files

### If Session Age > 4 hours
**Action:** Consider reset
**Why:** Session degrading
**How:** /start-day to resume

## Optimization Steps

### Step 1: Unload Unused Files
```
KEEP:
- Current story files
- Active documentation
- Knowledge base (relevant only)

REMOVE:
- Old story files
- Inactive documentation
- Unused files
```

### Step 2: Compress Context
```
COMPRESS:
- Old messages → summarize
- Completed work → checkpoint
- Redundant info → remove

KEEP:
- Current context
- Active decisions
- Important constraints
```

### Step 3: Reset if Needed
```
IF RESET NEEDED:
1. Save progress to checkpoint
2. Save state to file
3. Reset session
4. Resume from checkpoint via /start-day
```

## Day-to-Day Workflow

### Morning Start
```
1. /start-day
   → Detects phase
   → Loads minimal context
   → Resumes from checkpoint

2. Work on current task
   → Load only needed files
   → Keep context minimal
   → Checkpoint regularly

3. End of day
   → Save progress
   → Update checkpoint
   → Note next steps
```

### During Work
```
BEFORE EACH ACTION:
1. Check session size
2. Load only needed files
3. Keep context minimal
4. Checkpoint after major steps

IF SESSION GETTING LARGE:
1. Unload unused files
2. Compress old context
3. Summarize completed work
4. Consider reset
```

### Session Reset Strategy
```
RESET WHEN:
- Token usage > 90%
- Session age > 8 hours
- Context too large
- Stuck on issue
- Phase complete

RESET PROCESS:
1. Save progress
2. Save state
3. Reset session
4. Resume via /start-day
```
```

### Step 3: Implement Lazy Loading
```javascript
// Lazy Loading Implementation

// Don't load everything upfront
const lazyLoad = {
  // Load only when needed
  docs: {
    load: async (docName) => {
      // Only load specific doc
      return await readFile(`docs/${docName}.md`);
    },
    unload: async (docName) => {
      // Remove from context
      removeFromContext(docName);
    }
  },
  
  // Load relevant docs based on task
  knowledgeBase: {
    loadRelevant: async (taskType) => {
      const docs = await getRelevantDocs(taskType);
      return docs; // Only relevant docs
    }
  },
  
  // Load files on demand
  files: {
    load: async (filePath) => {
      // Only load specific file
      return await readFile(filePath);
    },
    unload: async (filePath) => {
      // Remove from context
      removeFromContext(filePath);
    }
  }
};
```

### Step 4: Implement Context Compression
```javascript
// Context Compression Implementation

async function compressContext(messages) {
  const compressed = [];
  
  for (const msg of messages) {
    if (msg.type === 'completed') {
      // Summarize completed work
      compressed.push({
        type: 'summary',
        content: summarize(msg.content),
        timestamp: msg.timestamp
      });
    } else if (msg.type === 'current') {
      // Keep current context
      compressed.push(msg);
    }
  }
  
  return compressed;
}

function summarize(content) {
  // Summarize content
  return {
    task: content.task,
    result: content.result,
    nextSteps: content.nextSteps
  };
}
```

### Step 5: Implement Checkpoint System
```javascript
// Checkpoint System

async function saveCheckpoint(session) {
  const checkpoint = {
    phase: session.phase,
    task: session.task,
    progress: session.progress,
    state: session.state,
    timestamp: new Date().toISOString()
  };
  
  await saveToFile(`production/checkpoints/${session.id}.json`, checkpoint);
}

async function loadCheckpoint(sessionId) {
  const checkpoint = await readFromFile(`production/checkpoints/${sessionId}.json`);
  
  return {
    phase: checkpoint.phase,
    task: checkpoint.task,
    progress: checkpoint.progress,
    state: checkpoint.state
  };
}
```

### Step 6: Update Start-Day for Optimization
```markdown
# Start-Day Optimization

## Session Health Check

BEFORE RESUMING:
1. Check session size
2. Check token usage
3. Check context size
4. Check file load

IF OPTIMIZATION NEEDED:
1. Show recommendations
2. Suggest actions
3. Offer to optimize

## Optimization Actions

### If Token Usage > 70%
"Session token usage is {percentage}%. Recommend reset."
→ /start-day will reset and resume

### If Context Too Large
"Context size is {size}. Recommend compression."
→ Summarize old context

### If Too Many Files
"{count} files loaded. Recommend unloading."
→ Unload unused files

## Day-to-Day Flow

### Morning
1. /start-day
   → Health check
   → Load minimal context
   → Resume from checkpoint

### During Day
1. Work on task
   → Load only needed files
   → Keep context minimal
   → Checkpoint regularly

### Evening
1. Save progress
   → Update checkpoint
   → Note next steps
2. Consider reset if long day
```

### Step 7: Create Session Rules
```markdown
# Session Optimization Rules

## Rule 1: Lazy Loading
DON'T:
- Load all docs at once
- Load all files at once
- Load everything upfront

DO:
- Load only what's needed NOW
- Load other docs when needed
- Unload when done

## Rule 2: Context Window
DON'T:
- Fill context to 100%
- Keep old messages forever
- Keep redundant info

DO:
- Keep context at 80% max
- Summarize old messages
- Remove redundant info

## Rule 3: Knowledge Base
DON'T:
- Load all knowledge base
- Search everything
- Keep all results

DO:
- Query relevant docs only
- Keep only needed results
- Unload when done

## Rule 4: Checkpoint
DON'T:
- Work for hours without saving
- Lose progress on reset
- Repeat completed work

DO:
- Checkpoint after major steps
- Save progress regularly
- Resume from checkpoint

## Rule 5: Reset
DON'T:
- Keep session running forever
- Ignore token warnings
- Fight with large context

DO:
- Reset when needed
- Resume via /start-day
- Start fresh when stuck
```
