# search-setup

Implement full-text search with Elasticsearch or Algolia.

## Execution

### Step 1: Index Setup
```typescript
const indexSchema = {
  properties: {
    title: { type: 'text', analyzer: 'standard' },
    content: { type: 'text', analyzer: 'standard' },
    tags: { type: 'keyword' },
    created_at: { type: 'date' },
  },
};
```

### Step 2: Search Query
```typescript
async function search(query: string, filters?: Record<string, any>) {
  const body: any = {
    query: {
      bool: {
        must: [{ multi_match: { query, fields: ['title^3', 'content'] } }],
      },
    },
    highlight: { fields: { content: {} } },
  };

  if (filters) {
    body.query.bool.filter = Object.entries(filters).map(([key, value]) => ({
      term: { [key]: value },
    }));
  }

  return client.search({ index: 'documents', body });
}
```

### Step 3: Autocomplete
```typescript
async function autocomplete(prefix: string) {
  return client.search({
    index: 'documents',
    body: {
      suggest: {
        autocomplete: {
          prefix,
          completion: { field: 'suggest', size: 5 },
        },
      },
    },
  });
}
```

## Output
- Search index
- Query functions
- Autocomplete
- UI integration
