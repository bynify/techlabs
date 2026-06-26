# dispatch-story

Route user stories to the appropriate specialist agent based on story type and stack.

## When to Use
- Story assignment
- Specialist routing
- Team allocation
- Work distribution

## Dispatch Rules

```
STORY TYPE DETECTION:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Keywords in story → Agent Assignment

BACKEND:
  "api", "endpoint", "service", "backend" → python-specialist / go-specialist
  "database", "schema", "migration"       → postgres-specialist
  "redis", "cache", "session"             → redis-specialist
  "queue", "message", "event"             → rabbitmq-specialist / kafka-specialist

FRONTEND:
  "ui", "page", "component", "form"       → nextjs-specialist / react-specialist
  "vue", "nuxt"                           → vue-specialist
  "svelte", "kit"                         → svelte-specialist
  "mobile", "ios", "android"              → react-native-specialist

INFRASTRUCTURE:
  "deploy", "docker", "container"         → docker-specialist
  "kubernetes", "k8s", "pod"              → k8s-specialist
  "ci/cd", "pipeline", "workflow"         → ci-cd-engineer
  "terraform", "iac", "infra"             → terraform-specialist

CLOUDFLARE:
  "worker", "serverless", "edge"          → cloudflare-specialist
  "durable", "websocket", "stateful"      → durable-objects-specialist
  "storage", "r2", "blob"                 → r2-specialist

SECURITY:
  "auth", "login", "jwt", "oauth"         → auth-engineer
  "security", "vulnerability"             → security-engineer
  "encryption", "hashing"                 → security-engineer

DATA:
  "analytics", "tracking", "metrics"      → data-engineer
  "etl", "pipeline", "transform"          → data-engineer
  "warehouse", "bi", "dashboard"          → data-analyst

AI/ML:
  "ai", "llm", "gpt", "model"            → ai-engineer
  "embedding", "vector", "rag"            → ml-engineer
```

## Execution

### Step 1: Load Story
```
READ:
- production/stories/{story-id}.md

EXTRACT:
- Story title
- Description
- Acceptance criteria
- Labels/tags
- Dependencies
```

### Step 2: Detect Story Type
```javascript
function detectStoryType(story) {
  const text = `${story.title} ${story.description} ${story.labels.join(' ')}`.toLowerCase();
  
  const patterns = {
    // Backend
    'backend-api': /api|endpoint|rest|graphql|service/,
    'database': /database|schema|migration|sql|table/,
    'redis': /redis|cache|session|pub.?sub/,
    'messaging': /queue|message|event|kafka|rabbitmq|nats/,
    
    // Frontend
    'frontend': /ui|page|component|form|button|modal|dashboard/,
    'nextjs': /next|nextjs|next\.js/,
    'react': /react|jsx|tsx/,
    'vue': /vue|nuxt|vue\.js/,
    'svelte': /svelte|sveltekit/,
    'mobile': /mobile|ios|android|react.?native|expo/,
    
    // Infrastructure
    'docker': /docker|container|image|compose/,
    'kubernetes': /kubernetes|k8s|pod|deployment|helm/,
    'cicd': /ci.?cd|pipeline|github.?action|workflow/,
    'terraform': /terraform|iac|infrastructure.?as.?code/,
    
    // Cloudflare
    'cloudflare': /worker|serverless|edge|cloudflare/,
    'durable': /durable|websocket|stateful/,
    'storage': /r2|blob|storage|s3/,
    
    // Security
    'auth': /auth|login|jwt|oauth|session/,
    'security': /security|vulnerability|xss|csrf/,
    
    // Data
    'data': /analytics|tracking|metrics|telemetry/,
    'etl': /etl|pipeline|transform|warehouse/,
    
    // AI
    'ai': /ai|llm|gpt|openai|claude|gemini/,
    'ml': /embedding|vector|rag|machine.?learning/,
  };
  
  for (const [type, pattern] of Object.entries(patterns)) {
    if (pattern.test(text)) return type;
  }
  
  return 'general';
}
```

### Step 3: Select Specialist Agent
```javascript
function selectAgent(storyType, story) {
  const agentMap = {
    // Backend
    'backend-api': story.stack === 'go' ? 'go-specialist' : 'python-specialist',
    'database': 'postgres-specialist',
    'redis': 'redis-specialist',
    'messaging': story.messaging === 'kafka' ? 'kafka-specialist' : 'rabbitmq-specialist',
    
    // Frontend
    'frontend': 'ui-engineer',
    'nextjs': 'nextjs-specialist',
    'react': 'react-specialist',
    'vue': 'vue-specialist',
    'svelte': 'svelte-specialist',
    'mobile': 'react-native-specialist',
    
    // Infrastructure
    'docker': 'docker-specialist',
    'kubernetes': 'k8s-specialist',
    'cicd': 'ci-cd-engineer',
    'terraform': 'terraform-specialist',
    
    // Cloudflare
    'cloudflare': 'cloudflare-specialist',
    'durable': 'durable-objects-specialist',
    'storage': 'cloudflare-specialist',
    
    // Security
    'auth': 'auth-engineer',
    'security': 'security-engineer',
    
    // Data
    'data': 'data-engineer',
    'etl': 'data-engineer',
    
    // AI
    'ai': 'ai-engineer',
    'ml': 'ml-engineer',
    
    // Default
    'general': 'lead-engineer',
  };
  
  return agentMap[storyType] || 'lead-engineer';
}
```

### Step 4: Load Agent Context
```javascript
async function loadAgentContext(agentName, story) {
  // Load agent definition
  const agent = await readFile(`agents/${agentName}.md`);
  
  // Load relevant skills
  const skills = await loadRelevantSkills(agentName, story);
  
  // Load Knowledge Base (if available)
  const knowledgeBase = await loadKnowledgeBase();
  const relevantDocs = knowledgeBase ? getRelevantDocs(story.type, knowledgeBase) : [];
  
  // Load story context
  const context = {
    story: story,
    prd: await readFile('docs/PRD.md'),
    architecture: await readFile('docs/architecture.md'),
    stack: await readFile('docs/stack-reference/'),
    knowledgeBase: relevantDocs  // Agent gets relevant docs
  };
  
  return { agent, skills, context };
}

function getRelevantDocs(storyType, knowledgeBase) {
  const docs = [];
  
  // Backend stories get backend docs
  if (['backend-api', 'database', 'redis', 'messaging'].includes(storyType)) {
    docs.push(...knowledgeBase.backend);
    docs.push(...knowledgeBase.database);
  }
  
  // Frontend stories get frontend docs
  if (['frontend', 'nextjs', 'react', 'vue', 'svelte'].includes(storyType)) {
    docs.push(...knowledgeBase.frontend);
  }
  
  // Security stories get security docs
  if (['auth', 'security'].includes(storyType)) {
    docs.push(...knowledgeBase.security);
  }
  
  // Performance stories get performance docs
  if (['performance'].includes(storyType)) {
    docs.push(...knowledgeBase.performance);
  }
  
  // All stories get infrastructure docs
  docs.push(...knowledgeBase.infrastructure);
  
  return docs;
}
```

### Step 5: Dispatch with Instructions
```
⚠️ ANOMALY PREVENTION: Multi-Agent Dispatch

CHECK if story needs multiple agents:
- Story has frontend AND backend components?
- Story needs infra AND application changes?
- Story touches multiple domains?

IF multi-agent needed:
  → DISPATCH to PRIMARY agent first
  → DISPATCH to SECONDARY agent for support
  → OR: SPLIT story into agent-specific stories
```

```markdown
# Dispatch to: go-specialist (PRIMARY)
# Support: ui-engineer (SECONDARY)

## Story: AUTH-001 - Implement JWT Authentication

## Context Loaded:
- Primary Agent: go-specialist.md
- Secondary Agent: ui-engineer.md
- Skills: add-jwt, create-api-endpoint, auth-setup
- PRD: docs/PRD.md (auth requirements)
- Architecture: docs/architecture.md (service design)

## Instructions:
1. Read story requirements
2. Implement per acceptance criteria
3. Follow agent code standards
4. Run tests before marking complete
5. Update story status when done

## Acceptance Criteria:
- [ ] JWT token generation (go-specialist)
- [ ] Token validation middleware (go-specialist)
- [ ] Login page (ui-engineer)
- [ ] Error handling (go-specialist)
- [ ] Unit tests (≥80% coverage)

## Handoff:
- After implementation → run review-gate
- If review fails → fix issues and re-submit
- If review passes → story ready for QA
```

### Step 6: Update Dispatch Log
```json
// production/sprint/dispatch-log.json
{
  "sprintId": "2024-S1",
  "dispatches": [
    {
      "storyId": "AUTH-001",
      "storyType": "auth",
      "agent": "go-specialist",
      "dispatchedAt": "2024-01-15T10:00:00Z",
      "status": "in-progress"
    },
    {
      "storyId": "UI-001",
      "storyType": "nextjs",
      "agent": "nextjs-specialist",
      "dispatchedAt": "2024-01-15T10:05:00Z",
      "status": "completed"
    }
  ]
}
```

## Output
- Story type detected
- Specialist agent selected
- Agent context loaded
- Dispatch instructions generated
- Dispatch logged
