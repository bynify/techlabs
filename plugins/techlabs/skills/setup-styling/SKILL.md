# setup-styling

Setup styling system with Tailwind CSS, CSS variables, and design tokens.

## Execution

### Step 1: Gather Requirements
```
ASK USER:
- What styling approach? (Tailwind, CSS Modules, styled-components)
- What UI library? (shadcn/ui, Radix, Headless UI)
- What design style? (Minimal, Bold, Corporate, Playful)
```

### Step 2: Install Dependencies
```bash
# Tailwind CSS
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# shadcn/ui (optional)
npx shadcn-ui@latest init
```

### Step 3: Configure Tailwind
```typescript
// tailwind.config.ts
import type { Config } from "tailwindcss"

const config: Config = {
  content: ["./src/**/*.{js,ts,jsx,tsx,mdx}"],
  theme: {
    extend: {
      colors: {
        primary: "hsl(var(--primary))",
        secondary: "hsl(var(--secondary))",
        // ...
      },
    },
  },
  plugins: [],
}
export default config
```

### Step 4: Create CSS Variables
```css
/* globals.css */
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --background: 0 0% 100%;
  --foreground: 222.2 84% 4.9%;
  --primary: 222.2 47.4% 11.2%;
  --primary-foreground: 210 40% 98%;
  /* ... */
}

.dark {
  --background: 222.2 84% 4.9%;
  --foreground: 210 40% 98%;
  /* ... */
}
```

### Step 5: Verify
```
CHECK:
- Tailwind classes working
- CSS variables defined
- Dark mode toggle works
- Responsive breakpoints work
```

## Output
- Tailwind configured
- CSS variables created
- Design tokens defined
