# session-persist

Persistent session storage with smart context loading across sessions.

## When to Use
- Starting new session
- Resuming from old session
- Switching between projects
- Long-term work continuity

## Agents to Dispatch
- lead-engineer: Session management
- All agents: Follow persist rules

## Enforcement

```
⚠️ MANDATORY: Session data must persist across sessions

SESSION PERSIST RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RULE 1: SAVE EVERYTHING
- Save ALL session data
- Never lose anything
- Compress, don't delete

RULE 2: SMART LOADING
- Load relevant context only
- Don't load all history
- Load on demand

RULE 3: COMPRESSION
- Old sessions → summary
- Recent sessions → full detail
- Archive very old sessions

RULE 4: PRIORITIZATION
- Current work → high priority
- Recent decisions → medium priority
- Old history → low priority

RULE 5: CROSS-SESSION
- Carry context to new sessions
- Maintain continuity
- Link related sessions
```

## Execution

### Step 1: Save Session Data
```javascript
async function saveSession(session) {
  const sessionData = {
    id: session.id,
    timestamp: new Date().toISOString(),
    project: session.project,
    phase: session.phase,
    task: session.task,
    decisions: session.decisions,
    constraints: session.constraints,
    progress: session.progress,
    files: session.files,
    messages: session.messages,
    context: session.context
  };
  
  // Save to session history
  await saveToFile(`production/sessions/${session.id}.json`, sessionData);
  
  // Update session index
  await updateSessionIndex(sessionData);
}
```

### Step 2: Create Session Index
```markdown
# Session Index

## Active Sessions

| Session ID | Project | Phase | Last Activity | Status |
|------------|---------|-------|---------------|--------|
| {id_1} | {project} | {phase} | {date} | Active |
| {id_2} | {project} | {phase} | {date} | Paused |

## Session History

| Session ID | Project | Phase | Date | Duration | Summary |
|------------|---------|-------|------|----------|---------|
| {id_1} | {project} | {phase} | {date} | {duration} | {summary} |
| {id_2} | {project} | {phase} | {date} | {duration} | {summary} |

## Project Sessions

### {project_name}
- Total Sessions: {count}
- Total Duration: {duration}
- Last Session: {date}
- Status: {status}
```

### Step 3: Smart Context Loading
```javascript
async function loadSessionContext(sessionId) {
  // Load session data
  const sessionData = await readFromFile(`production/sessions/${sessionId}.json`);
  
  // Prioritize context
  const prioritized = prioritizeContext(sessionData);
  
  // Load only high priority first
  const highPriority = prioritized.filter(p => p.priority === 'high');
  
  // Load medium priority if needed
  const mediumPriority = prioritized.filter(p => p.priority === 'medium');
  
  // Load low priority on demand
  const lowPriority = prioritized.filter(p => p.priority === 'low');
  
  return {
    immediate: highPriority,
    onDemand: mediumPriority,
    archive: lowPriority
  };
}

function prioritizeContext(sessionData) {
  const prioritized = [];
  
  // High priority: Current work
  if (sessionData.progress) {
    prioritized.push({
      type: 'progress',
      data: sessionData.progress,
      priority: 'high'
    });
  }
  
  // High priority: Active decisions
  if (sessionData.decisions) {
    prioritized.push({
      type: 'decisions',
      data: sessionData.decisions,
      priority: 'high'
    });
  }
  
  // Medium priority: Constraints
  if (sessionData.constraints) {
    prioritized.push({
      type: 'constraints',
      data: sessionData.constraints,
      priority: 'medium'
    });
  }
  
  // Medium priority: Files
  if (sessionData.files) {
    prioritized.push({
      type: 'files',
      data: sessionData.files,
      priority: 'medium'
    });
  }
  
  // Low priority: Old messages
  if (sessionData.messages) {
    prioritized.push({
      type: 'messages',
      data: sessionData.messages,
      priority: 'low'
    });
  }
  
  // Low priority: Full context
  if (sessionData.context) {
    prioritized.push({
      type: 'context',
      data: sessionData.context,
      priority: 'low'
    });
  }
  
  return prioritized;
}
```

### Step 4: Session Compression
```javascript
async function compressSession(sessionData) {
  const compressed = {
    ...sessionData,
    messages: compressMessages(sessionData.messages),
    context: compressContext(sessionData.context),
    files: compressFiles(sessionData.files)
  };
  
  return compressed;
}

function compressMessages(messages) {
  // Keep recent messages in full
  const recent = messages.slice(-20);
  
  // Summarize older messages
  const older = messages.slice(0, -20);
  const summarized = summarizeMessages(older);
  
  return {
    recent: recent,
    summarized: summarized
  };
}

function compressContext(context) {
  // Keep essential context
  return {
    project: context.project,
    phase: context.phase,
    decisions: context.decisions,
    constraints: context.constraints,
    summary: generateSummary(context)
  };
}

function compressFiles(files) {
  // Keep only file paths and summaries
  return files.map(file => ({
    path: file.path,
    purpose: file.purpose,
    lastModified: file.lastModified
  }));
}
```

### Step 5: Cross-Session Loading
```markdown
# Cross-Session Loading

## When Starting New Session

1. DETECT PROJECT
   - Which project is this?
   - What phase is it in?
   - What was last worked on?

2. LOAD RELEVANT HISTORY
   - Load last session for this project
   - Load relevant decisions
   - Load relevant constraints

3. LOAD CONTEXT
   - Load high priority context immediately
   - Load medium priority on demand
   - Load low priority if needed

4. MAINTAIN CONTINUITY
   - Link to previous session
   - Continue from checkpoint
   - Preserve all decisions

## Session Linking

### Previous Session
- Session ID: {id}
- Phase: {phase}
- Task: {task}
- Progress: {progress}

### Current Session
- Session ID: {id}
- Phase: {phase}
- Task: {task}
- Starting From: {checkpoint}

### Link
- Link Type: {continue/restart/resume}
- Link Reason: {reason}
- Link Context: {context}
```

### Step 6: Session History Database
```javascript
// Session History Database

const sessionDB = {
  // Save session
  save: async (session) => {
    const data = {
      id: session.id,
      timestamp: new Date().toISOString(),
      project: session.project,
      phase: session.phase,
      task: session.task,
      duration: calculateDuration(session),
      summary: generateSummary(session),
      decisions: session.decisions,
      constraints: session.constraints,
      progress: session.progress,
      files: session.files,
      messages: session.messages
    };
    
    await saveToFile(`production/sessions/${session.id}.json`, data);
    await updateIndex(data);
  },
  
  // Load session
  load: async (sessionId) => {
    const data = await readFromFile(`production/sessions/${sessionId}.json`);
    return data;
  },
  
  // Get project sessions
  getProjectSessions: async (project) => {
    const index = await readFromFile('production/sessions/index.json');
    return index.filter(s => s.project === project);
  },
  
  // Get recent sessions
  getRecentSessions: async (count = 5) => {
    const index = await readFromFile('production/sessions/index.json');
    return index.slice(-count);
  },
  
  // Compress old sessions
  compressOld: async (daysOld = 7) => {
    const sessions = await getAllSessions();
    const oldSessions = sessions.filter(s => {
      const age = Date.now() - new Date(s.timestamp).getTime();
      return age > daysOld * 24 * 60 * 60 * 1000;
    });
    
    for (const session of oldSessions) {
      const compressed = await compressSession(session);
      await saveCompressed(session.id, compressed);
    }
  }
};
```

### Step 7: Smart Resume
```markdown
# Smart Resume

## Resume Strategy

### If Same Project, Same Phase
- Load full context
- Continue from checkpoint
- No compression needed

### If Same Project, Different Phase
- Load project context only
- Load relevant decisions
- Compress old phase data

### If Different Project
- Load project context
- Load relevant decisions
- Compress old project data

### If Long Time Since Last Session
- Load summary only
- Load key decisions
- Full compression

## Resume Options

### Option 1: Full Resume
- Load everything
- Full context
- For: Active work

### Option 2: Smart Resume
- Load relevant context only
- Compressed history
- For: Resuming after break

### Option 3: Summary Resume
- Load summary only
- Key decisions only
- For: Long time since last session

### Option 4: Fresh Start
- Don't load old context
- Start fresh
- For: New project
```

### Step 8: Session Cleanup
```javascript
async function cleanupSessions() {
  const sessions = await getAllSessions();
  
  for (const session of sessions) {
    const age = Date.now() - new Date(session.timestamp).getTime();
    const daysOld = age / (24 * 60 * 60 * 1000);
    
    if (daysOld > 30) {
      // Archive old sessions
      await archiveSession(session.id);
    } else if (daysOld > 7) {
      // Compress old sessions
      const compressed = await compressSession(session);
      await saveCompressed(session.id, compressed);
    }
  }
}
```

## Output
- Session data persisted
- Smart context loading
- Cross-session continuity
- Compression for old data
- No data loss
