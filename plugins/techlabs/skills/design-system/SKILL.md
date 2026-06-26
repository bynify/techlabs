# design-system

Create design system with tokens, components, and documentation.

## When to Use
- New project branding
- Component library
- Design consistency

## Execution

### Step 1: Define Tokens
```css
:root {
  --color-primary-50: #eff6ff;
  --color-primary-500: #3b82f6;
  --color-primary-900: #1e3a8a;
  
  --spacing-xs: 4px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  
  --font-size-xs: 0.75rem;
  --font-size-sm: 0.875rem;
  --font-size-base: 1rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.25rem;
  
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-full: 9999px;
}
```

### Step 2: Component Specs
```typescript
interface ButtonProps {
  variant: 'primary' | 'secondary' | 'ghost' | 'danger';
  size: 'sm' | 'md' | 'lg';
  loading?: boolean;
  disabled?: boolean;
}
```

### Step 3: Documentation
```markdown
# Design System

## Colors
Use primary-500 for CTAs, primary-900 for headings.

## Typography
- Headings: Inter Bold
- Body: Inter Regular
- Code: JetBrains Mono

## Spacing
Use multiples of 4px base unit.
```

## Output
- Design tokens
- Component specs
- Usage documentation
- Storybook setup
