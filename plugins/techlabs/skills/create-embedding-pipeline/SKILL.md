# create-embedding-pipeline

Build embedding generation and indexing pipeline for vector search.

## When to Use
- Setting up semantic search
- Building RAG systems
- Content indexing
- Document search

## Execution

### Step 1: Choose Embedding Model
```
OPTIONS:
- OpenAI text-embedding-3-small: Best quality, $0.02/1M tokens
- OpenAI text-embedding-3-large: Highest quality, $0.13/1M tokens
- Cohere embed-v3: Good for multilingual
- sentence-transformers: Free, self-hosted
```

### Step 2: Create Ingestion Pipeline
```typescript
// src/embeddings/ingest.ts
import { RecursiveCharacterTextSplitter } from 'langchain/text_splitter';

const splitter = new RecursiveCharacterTextSplitter({
  chunkSize: 1000,
  chunkOverlap: 200,
});

interface Document {
  id: string;
  content: string;
  metadata: Record<string, unknown>;
}

async function ingestDocuments(docs: Document[]) {
  for (const doc of docs) {
    // Chunk
    const chunks = await splitter.splitText(doc.content);
    
    // Embed in batches
    const embeddings = await embedBatch(chunks);
    
    // Store
    await vectorStore.upsert(
      chunks.map((chunk, i) => ({
        id: `${doc.id}:${i}`,
        values: embeddings[i],
        metadata: {
          ...doc.metadata,
          text: chunk,
          documentId: doc.id,
          chunkIndex: i,
        },
      }))
    );
  }
}
```

### Step 3: Create Embedding Function
```typescript
async function embedBatch(texts: string[]): Promise<number[][]> {
  const response = await openai.embeddings.create({
    model: 'text-embedding-3-small',
    input: texts,
  });
  return response.data.map(e => e.embedding);
}

async function embedSingle(text: string): Promise<number[]> {
  const [embedding] = await embedBatch([text]);
  return embedding;
}
```

### Step 4: Add Incremental Updates
```typescript
async function watchAndEmbed() {
  const watcher = chok.watch('./documents', { persistent: true });
  
  watcher.on('add', async (path) => {
    const content = await fs.readFile(path, 'utf-8');
    await ingestDocuments([{
      id: path,
      content,
      metadata: { path, addedAt: new Date() },
    }]);
  });

  watcher.on('change', async (path) => {
    await vectorStore.deleteByMetadata({ documentId: path });
    const content = await fs.readFile(path, 'utf-8');
    await ingestDocuments([{
      id: path,
      content,
      metadata: { path, updatedAt: new Date() },
    }]);
  });
}
```

## Output
- Embedding generation
- Chunking pipeline
- Vector store integration
- Incremental updates
