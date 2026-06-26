# seo-schema

Add structured data (JSON-LD) for rich search results.

## Execution

### Step 1: Identify Schema Type
```
TYPES:
- Article (blog posts)
- Product (e-commerce)
- FAQ (help pages)
- Organization (company)
- BreadcrumbList (navigation)
```

### Step 2: Generate Schema
```typescript
function generateSchema(type: string, data: any) {
  const schemas = {
    article: {
      '@context': 'https://schema.org',
      '@type': 'Article',
      headline: data.title,
      datePublished: data.date,
      author: { '@type': 'Person', name: data.author },
    },
    product: {
      '@context': 'https://schema.org',
      '@type': 'Product',
      name: data.name,
      offers: { '@type': 'Offer', price: data.price, priceCurrency: 'USD' },
    },
  };
  return schemas[type];
}
```

### Step 3: Validate
```bash
npx schema-dts-validator schema.json
```

## Output
- Schema markup
- Validation
- Page integration
