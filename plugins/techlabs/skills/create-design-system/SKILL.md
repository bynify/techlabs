# create-design-system

Create comprehensive design system.

## Execution

### Step 1: Define Design Tokens
```typescript
// lib/design-tokens.ts
export const tokens = {
  colors: {
    primary: {
      50: "#eff6ff",
      100: "#dbeafe",
      500: "#3b82f6",
      900: "#1e3a8a",
    },
    neutral: {
      50: "#fafafa",
      100: "#f4f4f5",
      900: "#18181b",
    },
    // ...
  },
  spacing: {
    xs: "4px",
    sm: "8px",
    md: "16px",
    lg: "24px",
    xl: "32px",
  },
  borderRadius: {
    sm: "4px",
    md: "8px",
    lg: "12px",
    full: "9999px",
  },
  shadows: {
    sm: "0 1px 2px 0 rgb(0 0 0 / 0.05)",
    md: "0 4px 6px -1px rgb(0 0 0 / 0.1)",
    lg: "0 10px 15px -3px rgb(0 0 0 / 0.1)",
  },
}
```

### Step 2: Create Component Library
```
components/ui/
├── button.tsx
├── input.tsx
├── select.tsx
├── checkbox.tsx
├── switch.tsx
├── card.tsx
├── dialog.tsx
├── dropdown-menu.tsx
├── toast.tsx
└── tooltip.tsx
```

### Step 3: Document Usage
```markdown
# Design System

## Colors
- Primary: Buttons, links, active states
- Neutral: Text, borders, backgrounds
- Semantic: Success, warning, error

## Spacing
- xs: 4px (tight)
- sm: 8px (small)
- md: 16px (default)
- lg: 24px (comfortable)
- xl: 32px (spacious)

## Typography
- Headings: Bold, tight tracking
- Body: Regular, normal tracking
- Captions: Small, light color
```

### Step 4: Setup Storybook (Optional)
```bash
npm install -D @storybook/react @storybook/react-vite
npx storybook@latest init
```

## Output
- Design tokens file
- Component library
- Documentation
- Storybook (optional)
