# dispatch-matrix

Master dispatch logic that determines when and which agents to involve at each skill.

## When to Use
- Skill execution
- Agent routing
- Team coordination
- Workflow orchestration

## Dispatch Matrix

```
SKILL → AGENT DISPATCH:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PHASE 0: DISCOVERY
─────────────────────────────────────────────────────────────
SKILL           │ DISPATCH TO                    │ WHEN
────────────────┼────────────────────────────────┼──────────────
start           │ (none - user only)             │ Never
brainstorm      │ product-director               │ Always
                │ lead-engineer                  │ Always
                │ design-lead                    │ If UI/UX needed
                │ data-lead                      │ If data-heavy
────────────────┼────────────────────────────────┼──────────────
choose-domain   │ product-director               │ Always
choose-stack    │ lead-engineer                  │ Always
                │ technical-director             │ Complex decisions
choose-frontend │ ui-engineer                    │ Always
                │ design-lead                    │ If design-heavy
choose-messaging│ messaging-lead                 │ Always
                │ event-driven-architect         │ If event-driven
─────────────────────────────────────────────────────────────

PHASE 1: PRODUCT
─────────────────────────────────────────────────────────────
SKILL           │ DISPATCH TO                    │ WHEN
────────────────┼────────────────────────────────┼──────────────
create-prd      │ product-director               │ Always
                │ lead-engineer                  │ Technical scope
                │ design-lead                    │ UX requirements
                │ security-lead                  │ Security requirements
────────────────┼────────────────────────────────┼──────────────
user-stories    │ product-manager                │ Always
                │ lead-engineer                  │ Technical stories
                │ qa-lead                        │ Acceptance criteria
────────────────┼────────────────────────────────┼──────────────
create-epics    │ product-manager                │ Always
feature-prioritize│ product-director              │ Always
sprint-plan     │ product-manager                │ Always
                │ lead-engineer                  │ Technical capacity
─────────────────────────────────────────────────────────────

PHASE 2: DESIGN
─────────────────────────────────────────────────────────────
SKILL           │ DISPATCH TO                    │ WHEN
────────────────┼────────────────────────────────┼──────────────
design-system   │ design-lead                    │ Always
                │ design-system-engineer         │ Implementation
wireframe       │ ux-designer                    │ Always
                │ ui-engineer                    │ Technical feasibility
ux-flow         │ ux-designer                    │ Always
create-style-guide│ design-lead                  │ Always
font-setup      │ ui-engineer                    │ Always
setup-styling   │ ui-engineer                    │ Always
responsive-design│ ui-engineer                   │ Always
mobile-design   │ mobile-specialist              │ If mobile
ui-review       │ design-lead                    │ Always
                │ ux-designer                    │ Always
─────────────────────────────────────────────────────────────

PHASE 3: ARCHITECTURE
─────────────────────────────────────────────────────────────
SKILL           │ DISPATCH TO                    │ WHEN
────────────────┼────────────────────────────────┼──────────────
create-arch     │ lead-engineer                  │ Always
                │ technical-director             │ Complex systems
api-design      │ api-engineer                   │ Always
                │ lead-engineer                  │ API standards
database-design │ postgres-specialist            │ If PostgreSQL
                │ data-engineer                  │ Complex schemas
event-driven    │ event-driven-architect         │ Always
                │ messaging-lead                 │ Messaging decisions
arch-decision   │ technical-director             │ Always
                │ lead-engineer                  │ Always
─────────────────────────────────────────────────────────────

PHASE 4-6: BUILD
─────────────────────────────────────────────────────────────
SKILL           │ DISPATCH TO                    │ WHEN
────────────────┼────────────────────────────────┼──────────────
create-worker   │ cloudflare-specialist          │ Always
create-durable  │ durable-objects-specialist     │ Always
create-d1       │ cloudflare-specialist          │ Always
create-r2       │ cloudflare-specialist          │ Always
create-cron     │ cloudflare-specialist          │ Always
create-pages    │ cloudflare-specialist          │ Always
workers-deploy  │ cloudflare-specialist          │ Always
create-ai       │ ai-engineer                    │ Always
────────────────┼────────────────────────────────┼──────────────
create-event    │ event-driven-architect         │ Always
create-handler  │ messaging-specialist           │ Always
create-queue    │ messaging-specialist           │ Always
create-dlq      │ messaging-specialist           │ Always
create-kafka    │ kafka-specialist               │ Always
create-nats     │ nats-specialist                │ Always
create-rabbitmq │ rabbitmq-specialist            │ Always
create-redis    │ redis-streams-specialist       │ Always
create-sqs      │ sqs-sns-specialist             │ Always
create-pubsub   │ pubsub-specialist              │ Always
────────────────┼────────────────────────────────┼──────────────
create-nextjs   │ nextjs-specialist              │ Always
create-react    │ react-specialist               │ Always
create-vue      │ vue-specialist                 │ Always
create-svelte   │ svelte-specialist              │ Always
create-angular  │ angular-specialist             │ Always
create-remix    │ remix-specialist               │ Always
create-astro    │ astro-specialist               │ Always
create-landing  │ ui-engineer                    │ Always
create-pricing  │ ui-engineer                    │ Always
create-admin    │ ui-engineer                    │ Always
─────────────────────────────────────────────────────────────

PHASE 7: DOCKER/DEPLOY
─────────────────────────────────────────────────────────────
SKILL           │ DISPATCH TO                    │ WHEN
────────────────┼────────────────────────────────┼──────────────
create-docker   │ docker-specialist              │ Always
create-compose  │ docker-specialist              │ Always
create-ci-cd    │ ci-cd-engineer                 │ Always
create-k8s      │ k8s-specialist                 │ Always
docker-deploy   │ docker-specialist              │ Always
auto-deploy     │ devops-engineer                │ Always
auto-cicd       │ devops-engineer                │ Always
─────────────────────────────────────────────────────────────

PHASE 8: OPTIMIZATION
─────────────────────────────────────────────────────────────
SKILL           │ DISPATCH TO                    │ WHEN
────────────────┼────────────────────────────────┼──────────────
security-audit  │ security-engineer              │ Always
perf-audit      │ lead-engineer                  │ Always
code-review     │ lead-engineer                  │ Always
refactor-detect │ lead-engineer                  │ Always
refactor-apply  │ lead-engineer                  │ Always
─────────────────────────────────────────────────────────────

PHASE 9-16: DATA, GROWTH, QUALITY, etc.
─────────────────────────────────────────────────────────────
SKILL           │ DISPATCH TO                    │ WHEN
────────────────┼────────────────────────────────┼──────────────
data-model      │ data-engineer                  │ Always
create-etl      │ data-engineer                  │ Always
create-warehouse│ data-engineer                  │ Always
create-rag      │ ml-engineer                    │ Always
────────────────┼────────────────────────────────┼──────────────
pricing-strategy│ growth-lead                    │ Always
referral-program│ growth-lead                    │ Always
onboarding-flow │ product-manager                │ Always
create-landing  │ ui-engineer                    │ Always
create-ab-test  │ growth-lead                    │ Always
─────────────────────────────────────────────────────────────
```

## Dispatch Rules

### Rule 1: Always Dispatch
```
IF skill requires specialist knowledge:
  → Load agent definition
  → Load agent skills
  → Execute with agent context
```

### Rule 2: Conditional Dispatch
```
IF task involves specific technology:
  → Check stack configuration
  → Dispatch to matching specialist

EXAMPLE:
  IF stack == "go" AND task == "backend":
    → Dispatch to go-specialist
  ELSE IF stack == "python" AND task == "backend":
    → Dispatch to python-specialist
```

### Rule 3: Multi-Agent Dispatch
```
IF task requires multiple perspectives:
  → Dispatch to multiple agents
  → Collect feedback from each
  → Merge recommendations

EXAMPLE:
  create-architecture:
    → lead-engineer (technical design)
    → security-lead (security review)
    → data-lead (data modeling)
```

### Rule 4: Review Dispatch
```
IF task is review/audit:
  → Dispatch to reviewer agent
  → Load original implementation
  → Generate review report

EXAMPLE:
  code-review:
    → lead-engineer (code quality)
    → security-engineer (if security-related)
```

## Implementation

### Step 1: Load Dispatch Matrix
```javascript
function getDispatchAgents(skillName, context) {
  const matrix = loadDispatchMatrix();
  const rules = matrix[skillName] || [];
  
  return rules.filter(rule => {
    // Check conditional rules
    if (rule.condition) {
      return evaluateCondition(rule.condition, context);
    }
    return true; // Always dispatch
  }).map(rule => rule.agent);
}
```

### Step 2: Load Agent Context
```javascript
async function loadAgentForSkill(agentName, skillName, taskContext) {
  // Load agent definition
  const agent = await readFile(`agents/${agentName}.md`);
  
  // Load relevant skills for this task
  const relevantSkills = agent.skills.filter(s => 
    s.applicableTo.includes(skillName)
  );
  
  return {
    agent,
    skills: relevantSkills,
    context: taskContext,
  };
}
```

### Step 3: Execute with Agent
```javascript
async function executeWithAgent(skill, agent, context) {
  // Prepare execution context
  const execContext = {
    ...context,
    agent: agent.name,
    agentStandards: agent.codeStandards,
    agentExpertise: agent.expertise,
  };
  
  // Execute skill with agent context
  const result = await skill.execute(execContext);
  
  // Log dispatch
  await logDispatch({
    skill: skill.name,
    agent: agent.name,
    result: result.status,
    timestamp: new Date().toISOString(),
  });
  
  return result;
}
```

## Output
- Dispatch matrix defined
- Rules for each skill
- Agent routing logic
- Multi-agent coordination
- Implementation examples
