# create-astro-page

Create Astro page with SSG, content collections, and layouts.

## When to Use

## Agents to Dispatch
- astro-specialist: Astro implementation
- ui-engineer: Page design
- Static pages
- Blog posts
- Documentation

## Execution

### Step 1: Page with Layout
```astro
---
// src/pages/blog/index.astro
import Layout from "../../layouts/Layout.astro";
import { getCollection } from "astro:content";

const posts = await getCollection("blog", ({ data }) => !data.draft);
---

<Layout title="Blog">
  <main class="container py-8">
    <h1 class="text-3xl font-bold mb-6">Blog</h1>
    <div class="grid gap-6">
      {posts.map((post) => (
        <article class="border rounded-lg p-6">
          <h2><a href={`/blog/${post.slug}`}>{post.data.title}</a></h2>
          <time class="text-gray-500">{post.data.date.toLocaleDateString()}</time>
          <p class="mt-2">{post.data.description}</p>
        </article>
      ))}
    </div>
  </main>
</Layout>
```

## Output
- Page component
- Layout integration
- Content collection
- Routing
