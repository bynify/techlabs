# seo-programmatic

Generate SEO pages at scale from data.

## When to Use
- Programmatic SEO
- Template pages
- Dynamic content
- Scale content

## Execution

### Step 1: Template Design
```typescript
const template = {
  slug: '/tools/{tool_name}',
  title: '{tool_name} - Best Practices & Examples',
  description: 'Learn how to use {tool_name} effectively...',
};
```

### Step 2: Data Source
```typescript
const tools = await fetchTools(); // From API or database

const pages = tools.map(tool => ({
  slug: template.slug.replace('{tool_name}', tool.slug),
  title: template.title.replace('{tool_name}', tool.name),
  content: generateContent(tool),
}));
```

### Step 3: Generate
```typescript
async function generatePages(pages: Page[]) {
  for (const page of pages) {
    await createPage(page);
    await submitToSitemap(page.slug);
  }
}
```

## Output
- Page templates
- Data sources
- Generation script
- Sitemap integration
