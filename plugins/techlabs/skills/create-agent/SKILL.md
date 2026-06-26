# create-agent

Build AI agent with tool use, memory, and orchestration.

## When to Use
- Creating conversational agents
- Building tool-using AI
- Implementing multi-step reasoning
- Orchestrating workflows

## Execution

### Step 1: Define Agent Purpose
```
ASK USER:
1. What does the agent do?
2. What tools does it need?
3. What's the conversation flow?
4. Memory requirements? (short-term, long-term)
```

### Step 2: Define Tools
```typescript
// src/agent/tools.ts
import { z } from 'zod';

const searchTool = {
  name: 'search',
  description: 'Search the knowledge base',
  parameters: z.object({
    query: z.string().describe('Search query'),
    limit: z.number().default(5),
  }),
  execute: async ({ query, limit }) => {
    const results = await vectorStore.search(query, limit);
    return results;
  },
};

const calculatorTool = {
  name: 'calculator',
  description: 'Perform calculations',
  parameters: z.object({
    expression: z.string().describe('Math expression to evaluate'),
  }),
  execute: async ({ expression }) => {
    return { result: evaluate(expression) };
  },
};

export const tools = [searchTool, calculatorTool];
```

### Step 3: Create Agent Loop
```typescript
// src/agent/agent.ts
async function runAgent(task: string, tools: Tool[]) {
  const messages = [
    { role: 'system', content: SYSTEM_PROMPT },
    { role: 'user', content: task },
  ];

  for (let step = 0; step < MAX_STEPS; step++) {
    const response = await llm.chat({ messages, tools });

    if (response.toolCalls) {
      for (const call of response.toolCalls) {
        const tool = tools.find(t => t.name === call.name);
        const result = await tool.execute(call.params);
        messages.push({
          role: 'tool',
          content: JSON.stringify(result),
        });
      }
    } else {
      return response.content;
    }
  }
}
```

### Step 4: Add Memory
```typescript
// src/agent/memory.ts
interface ConversationMemory {
  messages: Message[];
  summary?: string;
}

async function getMemory(sessionId: string): Promise<ConversationMemory> {
  const stored = await kv.get(`memory:${sessionId}`);
  if (stored) return JSON.parse(stored);
  return { messages: [] };
}

async function saveMemory(sessionId: string, memory: ConversationMemory) {
  await kv.put(`memory:${sessionId}`, JSON.stringify(memory));
}
```

## Output
- Tool definitions with Zod schemas
- Agent execution loop
- Memory management
- Error handling
