# create-ai-binding

Integrate Cloudflare Workers AI with LLM inference, embeddings, and image generation.

## When to Use
- Adding AI features to Workers
- Using LLMs at the edge
- Generating embeddings
- Image generation

## Execution

### Step 1: Configure Binding
```toml
# wrangler.toml
[ai]
binding = "AI"
```

### Step 2: Chat Completion
```typescript
// src/ai/chat.ts
export interface Env {
  AI: Ai;
}

async function chat(env: Env, messages: { role: string; content: string }[]) {
  const response = await env.AI.run('@cf/meta/llama-3-8b-instruct', {
    messages,
    max_tokens: 1024,
    temperature: 0.7,
  });

  return response.response;
}

// Usage in worker
if (url.pathname === '/api/chat') {
  const { messages } = await request.json();
  const reply = await chat(env, messages);
  return Response.json({ reply });
}
```

### Step 3: Embeddings
```typescript
async function getEmbedding(env: Env, text: string): Promise<number[]> {
  const response = await env.AI.run('@cf/baai/bge-base-en-v1.5', {
    text: [text],
  });
  return response.data[0];
}

// Store in Vectorize
async function indexDocument(env: Env, doc: { id: string; text: string }) {
  const embedding = await getEmbedding(env, doc.text);
  await env.VECTORIZE.upsert([{
    id: doc.id,
    values: embedding,
    metadata: { text: doc.text },
  }]);
}
```

### Step 4: Image Generation
```typescript
async function generateImage(env: Env, prompt: string): Promise<Response> {
  const response = await env.AI.run('@cf/stabilityai/stable-diffusion-xl-base-1.0', {
    prompt,
  });
  return new Response(response, {
    headers: { 'Content-Type': 'image/png' },
  });
}
```

## Output
- wrangler.toml with AI binding
- Chat completion handler
- Embedding pipeline
- Image generation endpoint
