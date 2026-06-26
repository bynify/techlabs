# create-llm-integration

Integrate LLM APIs with proper error handling, streaming, and cost tracking.

## When to Use
- Adding AI features
- Building chatbots
- Text generation workflows

## Execution

### Step 1: Setup Client
```typescript
import OpenAI from "openai";

const client = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

interface ChatOptions {
  model?: string;
  temperature?: number;
  maxTokens?: number;
  stream?: boolean;
}
```

### Step 2: Chat Function
```typescript
async function chat(messages: Message[], options: ChatOptions = {}) {
  const response = await client.chat.completions.create({
    model: options.model || "gpt-4",
    messages,
    temperature: options.temperature || 0.7,
    max_tokens: options.maxTokens || 1024,
  });

  // Track cost
  const usage = response.usage;
  await trackCost({
    model: options.model,
    inputTokens: usage.prompt_tokens,
    outputTokens: usage.completion_tokens,
  });

  return response.choices[0].message.content;
}
```

### Step 3: Streaming
```typescript
async function* streamChat(messages: Message[]) {
  const stream = await client.chat.completions.create({
    model: "gpt-4",
    messages,
    stream: true,
  });

  for await (const chunk of stream) {
    const content = chunk.choices[0]?.delta?.content;
    if (content) yield content;
  }
}
```

### Step 4: Error Handling
```typescript
async function safeChat(messages: Message[]) {
  try {
    return await chat(messages);
  } catch (error) {
    if (error.status === 429) {
      // Rate limited
      await sleep(60000);
      return chat(messages);
    }
    throw error;
  }
}
```

## Output
- LLM client setup
- Chat function with streaming
- Cost tracking
- Error handling
