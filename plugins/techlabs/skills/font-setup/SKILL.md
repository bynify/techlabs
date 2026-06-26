# font-setup

Setup custom fonts and icon system.

## When to Use
- New project setup
- Brand refresh
- Typography improvement
- Icon system standardization

## Execution

### Step 1: Add Google Fonts
```typescript
// app/layout.tsx
import { Inter, Roboto } from "next/font/google"

const inter = Inter({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-inter",
})

export default function RootLayout({ children }) {
  return (
    <html lang="en" className={inter.variable}>
      <body className="font-sans">{children}</body>
    </html>
  )
}
```

### Step 2: Configure Font Variables
```css
/* globals.css */
:root {
  --font-sans: var(--font-inter), system-ui, sans-serif;
  --font-mono: var(--font-jetbrains), monospace;
}
```

### Step 3: Typography Scale
```typescript
// tailwind.config.ts
theme: {
  fontSize: {
    'xs': ['0.75rem', { lineHeight: '1rem' }],
    'sm': ['0.875rem', { lineHeight: '1.25rem' }],
    'base': ['1rem', { lineHeight: '1.5rem' }],
    'lg': ['1.125rem', { lineHeight: '1.75rem' }],
    'xl': ['1.25rem', { lineHeight: '1.75rem' }],
    '2xl': ['1.5rem', { lineHeight: '2rem' }],
    '3xl': ['1.875rem', { lineHeight: '2.25rem' }],
    '4xl': ['2.25rem', { lineHeight: '2.5rem' }],
  },
}
```

### Step 4: Icon System
```bash
# Lucide React (recommended)
npm install lucide-react

# Usage
import { Home, Settings, User } from "lucide-react"

<Home className="h-5 w-5" />
<Settings className="h-5 w-5 text-gray-500" />
```

## Output
- Custom fonts configured
- Typography scale defined
- Icon system setup
