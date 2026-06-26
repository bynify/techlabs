# create-prompt-template

Build structured prompt templates for LLMs with variables, examples, and chaining.

## When to Use
- Creating LLM applications
- Prompt engineering workflows
- Multi-step LLM chains
- Prompt versioning

## Execution

### Step 1: Define Prompt Structure
```typescript
// src/prompts/templates.ts
interface PromptTemplate {
  name: string;
  version: string;
  system: string;
  user: string;
  examples?: { input: string; output: string }[];
}

export const summarizePrompt: PromptTemplate = {
  name: 'summarize',
  version: '1.0',
  system: `You are a helpful assistant that summarizes documents concisely.

Rules:
- Keep key points
- Maintain factual accuracy
- Use bullet points for clarity
- Max 3 sentences for short docs, 5 for long`,
  user: `Summarize this document:

{{document}}`,
  examples: [
    {
      input: 'This is a long technical document about cloud architecture...',
      output: '• Cloud architecture overview\n• Focuses on serverless patterns\n• Recommends event-driven approach',
    },
  ],
};
```

### Step 2: Create Template Engine
```typescript
// src/prompts/engine.ts
function renderTemplate(template: PromptTemplate, vars: Record<string, string>): ChatMessage[] {
  let userContent = template.user;
  
  for (const [key, value] of Object.entries(vars)) {
    userContent = userContent.replace(`{{${key}}}`, value);
  }

  const messages: ChatMessage[] = [
    { role: 'system', content: template.system },
  ];

  // Add few-shot examples
  if (template.examples) {
    for (const example of template.examples.slice(0, 2)) {
      messages.push({ role: 'user', content: example.input });
      messages.push({ role: 'assistant', content: example.output });
    }
  }

  messages.push({ role: 'user', content: userContent });
  return messages;
}
```

### Step 3: Add Chain Support
```typescript
// src/prompts/chains.ts
async function runChain(steps: { template: PromptTemplate; vars: Record<string, string> }[]) {
  const results: string[] = [];

  for (const step of steps) {
    // Inject previous results
    const vars = { ...step.vars, previous_output: results[results.length - 1] || '' };
    const messages = renderTemplate(step.template, vars);
    
    const response = await llm.chat({ messages });
    results.push(response.content);
  }

  return results[results.length - 1];
}
```

### Step 4: Version and Store
```typescript
// src/prompts/registry.ts
const promptRegistry = new Map<string, PromptTemplate>();

function registerPrompt(template: PromptTemplate) {
  promptRegistry.set(`${template.name}:v${template.version}`, template);
}

function getPrompt(name: string, version?: string): PromptTemplate {
  if (version) return promptRegistry.get(`${name}:v${version}`);
  // Get latest
  const versions = [...promptRegistry.keys()]
    .filter(k => k.startsWith(`${name}:`))
    .sort();
  return promptRegistry.get(versions[versions.length - 1]);
}
```

## Output
- Prompt templates
- Template engine
- Chain support
- Version registry
