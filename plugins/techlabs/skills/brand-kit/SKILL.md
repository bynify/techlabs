# brand-kit

Create brand guidelines including logo, colors, typography, and visual identity.

## When to Use
- New project branding
- Rebrand initiatives
- Design system foundation
- Marketing asset creation

## Execution

### Step 1: Gather Brand Requirements
```
ASK USER:
1. Brand personality? (professional, playful, minimal, bold)
2. Target audience?
3. Competitors to differentiate from?
4. Preferred colors?
5. Industry?
```

### Step 2: Define Color Palette
```typescript
// design-tokens/colors.ts
export const colors = {
  primary: {
    50: '#eff6ff',
    100: '#dbeafe',
    200: '#bfdbfe',
    300: '#93c5fd',
    400: '#60a5fa',
    500: '#3b82f6', // Main primary
    600: '#2563eb',
    700: '#1d4ed8',
    800: '#1e40af',
    900: '#1e3a8a',
  },
  neutral: {
    50: '#fafafa',
    100: '#f4f4f5',
    200: '#e4e4e7',
    300: '#d4d4d8',
    400: '#a1a1aa',
    500: '#71717a',
    600: '#52525b',
    700: '#3f3f46',
    800: '#27272a',
    900: '#18181b',
  },
  semantic: {
    success: '#22c55e',
    warning: '#f59e0b',
    error: '#ef4444',
    info: '#3b82f6',
  },
};
```

### Step 3: Define Typography
```typescript
// design-tokens/typography.ts
export const typography = {
  fontFamily: {
    sans: ['Inter', 'system-ui', 'sans-serif'],
    mono: ['JetBrains Mono', 'monospace'],
  },
  fontSize: {
    xs: ['0.75rem', { lineHeight: '1rem' }],
    sm: ['0.875rem', { lineHeight: '1.25rem' }],
    base: ['1rem', { lineHeight: '1.5rem' }],
    lg: ['1.125rem', { lineHeight: '1.75rem' }],
    xl: ['1.25rem', { lineHeight: '1.75rem' }],
    '2xl': ['1.5rem', { lineHeight: '2rem' }],
    '3xl': ['1.875rem', { lineHeight: '2.25rem' }],
    '4xl': ['2.25rem', { lineHeight: '2.5rem' }],
  },
};
```

### Step 4: Create Brand Guide Document
```markdown
# Brand Guidelines

## Logo
- Primary: Full logo on light background
- Inverse: White logo on dark background
- Icon: Mark only (favicon, app icon)

## Colors
- Primary: #3b82f6 (used for CTAs, links)
- Neutral: #18181b (headings), #52525b (body)

## Typography
- Headings: Inter Bold
- Body: Inter Regular
- Code: JetBrains Mono

## Spacing
- Use 4px base unit
- Sections: 64px, 32px, 16px, 8px
```

## Output
- Color palette
- Typography scale
- Logo guidelines
- Brand guide document
- CSS custom properties
