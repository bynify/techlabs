# choose-frontend

Select the right frontend framework based on project requirements.

## When to Use
- Starting new projects
- Evaluating framework migrations
- Technology selection

## Execution

### Step 1: Gather Requirements
```
ASK USER:
1. Rendering needs? (SSR, SSG, CSR, hybrid)
2. Team experience? (React, Vue, Svelte, Angular)
3. SEO critical?
4. Real-time features?
5. Mobile app needed? (React Native, Expo)
```

### Step 2: Compare Frameworks
```
| Feature         | Next.js | Nuxt | SvelteKit | Remix | Astro |
|-----------------|---------|------|-----------|-------|-------|
| SSR/SSG         | ✅      | ✅   | ✅        | ✅    | ✅    |
| React ecosystem | ✅      | ❌   | ❌        | ✅    | ✅    |
| Vue ecosystem   | ❌      | ✅   | ❌        | ❌    | ✅    |
| Learning curve  | Medium  | Med  | Low       | Med   | Low   |
| Edge runtime    | ✅      | ✅   | ✅        | ✅    | ✅    |
```

### Step 3: Make Recommendation
```
IF team_knows == "react" AND needs_ssr:
  RECOMMEND: Next.js

IF team_knows == "vue":
  RECOMMEND: Nuxt

IF focus == "content" AND minimal_js:
  RECOMMEND: Astro

IF focus == "form_heavy" AND progressive_enhancement:
  RECOMMEND: Remix

IF focus == "simplicity" AND small_bundle:
  RECOMMEND: SvelteKit
```

### Step 4: Create Setup Guide
```bash
# Next.js
npx create-next-app@latest app --typescript --tailwind --app

# Nuxt
npx nuxi@latest init app

# SvelteKit
npm create svelte@latest app

# Astro
npm create astro@latest app
```

## Output
- Framework recommendation with rationale
- Comparison matrix
- Setup instructions
- Migration path (if existing project)
