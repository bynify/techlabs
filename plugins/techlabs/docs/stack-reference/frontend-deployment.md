# Frontend Deployment Reference

Deployment options for frontend frameworks to Cloudflare Pages and other platforms.

## Cloudflare Pages Deployment

### Next.js → Cloudflare Pages

```bash
# Install adapter
npm install -D @cloudflare/next-on-pages

# Build
npx @cloudflare/next-on-pages

# Deploy
npx wrangler pages deploy .vercel/output/static
```

```toml
# wrangler.toml
name = "my-nextjs-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = ".vercel/output/static"
compatibility_flags = ["nodejs_compat"]

[vars]
NEXT_PUBLIC_API_URL = "https://api.example.com"
```

### React (Vite) → Cloudflare Pages

```bash
# Build
npm run build

# Deploy
npx wrangler pages deploy ./dist
```

```toml
# wrangler.toml
name = "my-react-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = "./dist"
```

### Vue (Vite) → Cloudflare Pages

```bash
# Build
npm run build

# Deploy
npx wrangler pages deploy ./dist
```

```toml
# wrangler.toml
name = "my-vue-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = "./dist"
```

### Nuxt → Cloudflare Pages

```bash
# Install preset
npm install -D nitro-cloudflare-dev

# Build with preset
NITRO_PRESET=cloudflare_pages npx nuxi build

# Deploy
npx wrangler pages deploy .output/public
```

```toml
# wrangler.toml
name = "my-nuxt-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = ".output/public"
```

### SvelteKit → Cloudflare Pages

```bash
# Install adapter
npm install -D @sveltejs/adapter-cloudflare

# Build
npm run build

# Deploy
npx wrangler pages deploy .svelte-kit/cloudflare
```

```toml
# wrangler.toml
name = "my-svelte-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = ".svelte-kit/cloudflare"
```

### Astro → Cloudflare Pages

```bash
# Install adapter
npm install -D @astrojs/cloudflare

# Build
npm run build

# Deploy
npx wrangler pages deploy ./dist
```

```toml
# wrangler.toml
name = "my-astro-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = "./dist"
```

### Remix → Cloudflare Pages

```bash
# Install adapter
npm install -D @remix-run/cloudflare-pages

# Build
npm run build

# Deploy
npx wrangler pages deploy ./build/client
```

```toml
# wrangler.toml
name = "my-remix-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = "./build/client"
```

### Angular → Cloudflare Pages

```bash
# Build
ng build --configuration=production

# Deploy
npx wrangler pages deploy ./dist/my-app
```

```toml
# wrangler.toml
name = "my-angular-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = "./dist/my-app"
```

## GitHub Actions Auto-Deploy

```yaml
# .github/workflows/deploy-pages.yml
name: Deploy to Cloudflare Pages

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build
        run: npm run build
      
      - name: Deploy to Cloudflare Pages
        uses: cloudflare/wrangler-action@v3
        with:
          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          command: pages deploy ./dist
```

## Preview Deployments

```yaml
# .github/workflows/preview.yml
name: Preview Deployment

on:
  pull_request:
    branches: [main]

jobs:
  preview:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build
        run: npm run build
      
      - name: Deploy Preview
        uses: cloudflare/wrangler-action@v3
        with:
          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          command: pages deploy ./dist --branch ${{ github.head_ref }}
```

## Custom Domain Setup

```bash
# Add custom domain
npx wrangler pages domain add my-app example.com

# DNS records to add:
# CNAME: www → my-app.pages.dev
# CNAME: @ → my-app.pages.dev
```

## Environment Variables

```toml
# wrangler.toml - Production
[vars]
ENVIRONMENT = "production"
API_URL = "https://api.example.com"

# Secrets (set via CLI)
# npx wrangler pages secret put API_KEY
# npx wrangler pages secret put DATABASE_URL
```

## Stack Comparison

| Stack | CF Pages | Vercel | Netlify | AWS | Self-hosted |
|-------|----------|--------|---------|-----|-------------|
| Next.js | ✅ | ✅ | ✅ | ✅ | ✅ |
| React | ✅ | ✅ | ✅ | ✅ | ✅ |
| Vue | ✅ | ✅ | ✅ | ✅ | ✅ |
| Nuxt | ✅ | ✅ | ✅ | ✅ | ✅ |
| SvelteKit | ✅ | ✅ | ✅ | ✅ | ✅ |
| Astro | ✅ | ✅ | ✅ | ✅ | ✅ |
| Remix | ✅ | ✅ | ✅ | ✅ | ✅ |
| Angular | ✅ | ✅ | ✅ | ✅ | ✅ |
