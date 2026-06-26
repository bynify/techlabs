# create-rag-pipeline

Build retrieval-augmented generation pipelines with embeddings, vector search, and LLM.

## When to Use

## Agents to Dispatch
- ml-engineer: RAG implementation
- ai-engineer: AI integration
- Q&A over documents
- Knowledge base search
- Context-aware chatbots
- Content recommendation

## Execution

### Step 1: Design Pipeline
```
FLOW:
1. Document ingestion → chunking → embedding → vector store
2. User query → embedding → similarity search → context assembly → LLM
```

### Step 2: Create Document Processor
```typescript
// src/rag/ingest.ts
import { RecursiveCharacterTextSplitter } from 'langchain/text_splitter';

const splitter = new RecursiveCharacterTextSplitter({
  chunkSize: 1000,
  chunkOverlap: 200,
});

interface Document {
  pageContent: string;
  metadata: Record<string, unknown>;
}

async function ingestDocument(doc: Document) {
  const chunks = await splitter.splitDocuments([doc]);
  
  const embeddings = await Promise.all(
    chunks.map(chunk => getEmbedding(chunk.pageContent))
  );

  await vectorStore.upsert(
    chunks.map((chunk, i) => ({
      id: generateId(),
      values: embeddings[i],
      metadata: {
        ...chunk.metadata,
        text: chunk.pageContent,
      },
    }))
  );
}
```

### Step 3: Create Query Handler
```typescript
// src/rag/query.ts
async function ragQuery(question: string): Promise<RagResponse> {
  // 1. Embed the question
  const queryEmbedding = await getEmbedding(question);

  // 2. Search vector store
  const results = await vectorStore.query({
    vector: queryEmbedding,
    topK: 5,
    includeMetadata: true,
  });

  // 3. Assemble context
  const context = results.matches
    .map(m => m.metadata.text)
    .join('\n\n---\n\n');

  // 4. Generate answer
  const answer = await llm.chat({
    model: 'gpt-4',
    messages: [
      {
        role: 'system',
        content: `Answer based ONLY on the context. If unsure, say "I don't know."

Context:
${context}`,
      },
      { role: 'user', content: question },
    ],
  });

  return {
    answer: answer.content,
    sources: results.matches.map(m => ({
      text: m.metadata.text,
      score: m.score,
      source: m.metadata.source,
    })),
  };
}
```

### Step 4: Add Evaluation
```typescript
// src/rag/evaluate.ts
interface TestCase {
  question: string;
  expectedAnswer: string;
  expectedSources?: string[];
}

async function evaluate(testCases: TestCase[]) {
  let correct = 0;
  for (const test of testCases) {
    const result = await ragQuery(test.question);
    const isCorrect = checkAnswer(result.answer, test.expectedAnswer);
    if (isCorrect) correct++;
  }
  return { accuracy: correct / testCases.length };
}
```

## Output
- Document ingestion pipeline
- Vector store integration
- Query handler with citations
- Evaluation suite
