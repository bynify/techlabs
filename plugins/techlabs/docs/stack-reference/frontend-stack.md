# Frontend Stack Reference

Frontend frameworks, UI libraries, styling, and deployment options.

## Frontend Frameworks

### React Ecosystem

| Framework | SSR/SSG | Type | Learning Curve | Ecosystem |
|-----------|---------|------|----------------|-----------|
| Next.js | ✅ | Full-stack | Medium | Huge |
| Remix | ✅ | Full-stack | Medium | Growing |
| Gatsby | SSG | Static | Medium | Declining |
| Astro | SSG | Islands | Low | Growing |
| Vite + React | SPA | Client | Low | Huge |

### Vue Ecosystem

| Framework | SSR/SSG | Type | Learning Curve | Ecosystem |
|-----------|---------|------|----------------|-----------|
| Nuxt | ✅ | Full-stack | Medium | Large |
| VitePress | SSG | Static | Low | Medium |
| Quasar | ✅ | SPA/PWA/SSR | Medium | Large |
| Vite + Vue | SPA | Client | Low | Large |

### Svelte Ecosystem

| Framework | SSR/SSG | Type | Learning Curve | Ecosystem |
|-----------|---------|------|----------------|-----------|
| SvelteKit | ✅ | Full-stack | Low | Growing |
| Svelte | SPA | Client | Low | Growing |

### Angular

| Framework | SSR/SSG | Type | Learning Curve | Ecosystem |
|-----------|---------|------|----------------|-----------|
| Angular | ✅ | Full-stack | High | Enterprise |
| Analog | ✅ | Full-stack | Medium | Growing |

### Other

| Framework | SSR/SSG | Type | Learning Curve | Ecosystem |
|-----------|---------|------|----------------|-----------|
| Solid | ✅ | Reactive | Medium | Growing |
| Qwik | ✅ | Resumable | Medium | New |

## UI Component Libraries

### React

| Library | Components | Styling | TypeScript | Accessibility |
|---------|------------|---------|------------|---------------|
| shadcn/ui | 50+ | Tailwind | ✅ | ✅ |
| Radix UI | 30+ | Unstyled | ✅ | ✅ |
| MUI | 100+ | CSS-in-JS | ✅ | ✅ |
| Ant Design | 100+ | Less | ✅ | ✅ |
| Chakra UI | 70+ | Emotion | ✅ | ✅ |
| Headless UI | 20+ | Unstyled | ✅ | ✅ |
| React Aria | 40+ | Unstyled | ✅ | ✅ |

### Vue

| Library | Components | Styling | TypeScript | Accessibility |
|---------|------------|---------|------------|---------------|
| Nuxt UI | 50+ | Tailwind | ✅ | ✅ |
| Vuetify | 80+ | Material | ✅ | ✅ |
| PrimeVue | 100+ | Multiple | ✅ | ✅ |
| Element Plus | 100+ | CSS | ✅ | ✅ |
| Headless UI | 20+ | Unstyled | ✅ | ✅ |

### Svelte

| Library | Components | Styling | TypeScript | Accessibility |
|---------|------------|---------|------------|---------------|
| Skeleton | 50+ | Tailwind | ✅ | ✅ |
| Melt UI | 20+ | Unstyled | ✅ | ✅ |
| Bits UI | 20+ | Unstyled | ✅ | ✅ |
| Flowbite Svelte | 40+ | Tailwind | ✅ | ✅ |

### Angular

| Library | Components | Styling | TypeScript | Accessibility |
|---------|------------|---------|------------|---------------|
| Angular Material | 50+ | Material | ✅ | ✅ |
| PrimeNG | 100+ | Multiple | ✅ | ✅ |
| Ng Zorro | 100+ | Ant Design | ✅ | ✅ |

## Styling Solutions

### CSS Frameworks

| Framework | Type | Performance | Learning Curve |
|-----------|------|-------------|----------------|
| Tailwind CSS | Utility-first | High | Low |
| Bootstrap | Component | Medium | Low |
| Bulma | Component | Medium | Low |
| Foundation | Component | Medium | Medium |
| UnoCSS | Atomic | Very High | Medium |

### CSS-in-JS

| Library | Performance | SSR | TypeScript |
|---------|-------------|-----|------------|
| Styled Components | Medium | ✅ | ✅ |
| Emotion | Medium | ✅ | ✅ |
| Stitches | High | ✅ | ✅ |
| Vanilla Extract | High | ✅ | ✅ |
| Panda CSS | High | ✅ | ✅ |

### Tailwind + UI

```bash
# shadcn/ui (recommended)
npx shadcn-ui@latest init
npx shadcn-ui@latest add button card dialog

# Radix UI + Tailwind
npm install @radix-ui/react-dialog @radix-ui/react-dropdown-menu

# Headless UI + Tailwind
npm install @headlessui/react

# DaisyUI
npm install daisyui
```

## State Management

### React

| Library | Type | Performance | Learning Curve |
|---------|------|-------------|----------------|
| Zustand | Simple | High | Low |
| Jotai | Atomic | High | Low |
| Redux Toolkit | Flux | Medium | Medium |
| React Query | Server | High | Low |
| SWR | Server | High | Low |
| TanStack Query | Server | High | Low |
| Recoil | Atomic | High | Medium |
| XState | State machine | Medium | High |

### Vue

| Library | Type | Performance | Learning Curve |
|---------|------|-------------|----------------|
| Pinia | Store | High | Low |
| Vuex | Store | Medium | Medium |

### Svelte

| Library | Type | Performance | Learning Curve |
|---------|------|-------------|----------------|
| Svelte Store | Built-in | High | Low |

## Form Libraries

### React

| Library | Type | Validation | TypeScript |
|---------|------|------------|------------|
| React Hook Form | Performant | Zod, Yup | ✅ |
| Formik | Full-featured | Yup | ✅ |
| Conform | Progressive | Zod | ✅ |

### Vue

| Library | Type | Validation | TypeScript |
|---------|------|------------|------------|
| VeeValidate | Full-featured | Zod, Yup | ✅ |
| FormKit | Full-featured | Built-in | ✅ |

## Animation Libraries

| Library | Framework | Performance | Learning Curve |
|---------|-----------|-------------|----------------|
| Framer Motion | React | High | Low |
| Motion One | Vanilla | High | Low |
| GSAP | Vanilla | Very High | Medium |
| Lottie | All | High | Low |
| AutoAnimate | All | High | Low |
| Spring | React | High | Medium |

## Data Visualization

| Library | Framework | Features | Learning Curve |
|---------|-----------|----------|----------------|
| Recharts | React | Simple charts | Low |
| Chart.js | Vanilla | Full-featured | Low |
| D3.js | Vanilla | Maximum control | High |
| Nivo | React | Beautiful charts | Low |
| Victory | React | Modular | Medium |
| Apache ECharts | Vanilla | Full-featured | Medium |
| Visx | React | Low-level | High |

## Testing

| Library | Framework | Type | Learning Curve |
|---------|-----------|------|----------------|
| Vitest | All | Unit | Low |
| Jest | All | Unit | Low |
| React Testing Library | React | Integration | Low |
| Cypress | All | E2E | Medium |
| Playwright | All | E2E | Medium |
| Storybook | All | Visual | Medium |

## Deployment Platforms

### Cloudflare Pages

| Framework | Command | Notes |
|-----------|---------|-------|
| Next.js | `npx @cloudflare/next-on-pages` | Full support |
| React (Vite) | `npx wrangler pages deploy ./dist` | Static |
| Vue (Vite) | `npx wrangler pages deploy ./dist` | Static |
| Nuxt | `NITRO_PRESET=cloudflare_pages` | Full support |
| SvelteKit | `@sveltejs/adapter-cloudflare` | Full support |
| Astro | `@astrojs/cloudflare` | Full support |
| Remix | `@remix-run/cloudflare-pages` | Full support |
| Angular | `npx wrangler pages deploy ./dist/app` | Static |

### Vercel

| Framework | Command | Notes |
|-----------|---------|-------|
| Next.js | Native | Best support |
| React | `vercel` | Static |
| Vue | `vercel` | Static |
| SvelteKit | `@sveltejs/adapter-vercel` | Full support |

### Netlify

| Framework | Command | Notes |
|-----------|---------|-------|
| React | `netlify deploy` | Static |
| Vue | `netlify deploy` | Static |
| SvelteKit | `@sveltejs/adapter-netlify` | Full support |
| Astro | `@astrojs/netlify` | Full support |

## Recommended Stacks

### Modern SaaS
```
Framework: Next.js 14 (App Router)
UI: shadcn/ui + Tailwind CSS
Forms: React Hook Form + Zod
State: Zustand + TanStack Query
Animation: Framer Motion
Charts: Recharts
Testing: Vitest + Playwright
Deployment: Cloudflare Pages
```

### Dashboard
```
Framework: React + Vite
UI: shadcn/ui + Tailwind CSS
Forms: React Hook Form + Zod
State: Zustand + TanStack Query
Tables: TanStack Table
Charts: Recharts / Nivo
Testing: Vitest + Cypress
Deployment: Cloudflare Pages
```

### Content Site
```
Framework: Astro + React
UI: shadcn/ui + Tailwind CSS
CMS: MDX / Contentlayer
Animation: GSAP
Testing: Vitest
Deployment: Cloudflare Pages
```

### Enterprise
```
Framework: Next.js 14
UI: Ant Design / MUI
Forms: React Hook Form + Zod
State: Redux Toolkit + RTK Query
Tables: AG Grid
Charts: Apache ECharts
Testing: Jest + Cypress
Deployment: Vercel / AWS
```
