# create-pages

Deploy static sites and SSR apps with Cloudflare Pages.

## When to Use
- Static site deployment
- Next.js/Nuxt/SvelteKit deployment
- Preview deployments
- Custom domains

## Execution

### Step 1: Detect Framework
```
SCAN:
- next.config.js → Next.js
- nuxt.config.ts → Nuxt
- svelte.config.js → SvelteKit
- astro.config.mjs → Astro
- None → Static site
```

### Step 2: Configure wrangler.toml
```toml
# Static site
name = "my-site"
compatibility_date = "2024-01-01"
pages_build_output_dir = "./dist"

# Next.js (with @cloudflare/next-on-pages)
name = "my-nextjs-app"
compatibility_date = "2024-01-01"
pages_build_output_dir = ".vercel/output/static"

[vars]
NEXT_PUBLIC_API_URL = "https://api.example.com"
```

### Step 3: Setup Build
```bash
# Static site
npm run build
npx wrangler pages deploy ./dist

# Next.js with @cloudflare/next-on-pages
npm install -D @cloudflare/next-on-pages
npx @cloudflare/next-on-pages
npx wrangler pages deploy .vercel/output/static

# Nuxt with preset
NITRO_PRESET=cloudflare_pages npx nuxi build
npx wrangler pages deploy .output/public
```

### Step 4: Configure Environment
```toml
# wrangler.toml - Environment variables
[vars]
ENVIRONMENT = "production"
API_URL = "https://api.example.com"

# Secrets (set via CLI)
# npx wrangler pages secret put API_KEY
```

### Step 5: Custom Domain
```bash
# Add custom domain
npx wrangler pages domain add my-site example.com

# DNS configuration
# CNAME: www → my-site.pages.dev
```

### Step 6: Preview Deployments
```yaml
# .github/workflows/preview.yml
name: Preview
on:
  pull_request:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci && npm run build
      - uses: cloudflare/wrangler-action@v3
        with:
          command: pages deploy ./dist --branch ${{ github.head_ref }}
```

### Step 7: Validate
```
CHECK:
- Build succeeds
- Pages deployed
- Custom domain working
- SSL certificate valid
- Preview deployments working
```

## Output
- wrangler.toml configured
- Build script updated
- Custom domain setup
- Preview deployments
