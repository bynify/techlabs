# responsive-design

Implement responsive design patterns.

## Execution

### Step 1: Define Breakpoints
```typescript
// tailwind.config.ts
theme: {
  screens: {
    'sm': '640px',   // mobile landscape
    'md': '768px',   // tablet
    'lg': '1024px',  // desktop
    'xl': '1280px',  // large desktop
    '2xl': '1536px', // extra large
  },
}
```

### Step 2: Create Responsive Layout
```typescript
// Mobile-first approach
<div className="
  grid grid-cols-1 
  md:grid-cols-2 
  lg:grid-cols-3 
  gap-4
">
  <Card />
  <Card />
  <Card />
</div>
```

### Step 3: Mobile Navigation
```typescript
// components/mobile-nav.tsx
"use client"

import { useState } from "react"
import { Menu, X } from "lucide-react"

export function MobileNav() {
  const [open, setOpen] = useState(false)

  return (
    <div className="lg:hidden">
      <button onClick={() => setOpen(!open)}>
        {open ? <X /> : <Menu />}
      </button>
      {open && (
        <nav className="absolute top-full left-0 w-full bg-white">
          {/* Nav items */}
        </nav>
      )}
    </div>
  )
}
```

### Step 4: Responsive Utilities
```typescript
// utils/responsive.ts
export const cn = (...classes) => classes.filter(Boolean).join(" ")

// Usage
<div className={cn(
  "p-4",
  "md:p-6",
  "lg:p-8"
)}>
```

## Output
- Responsive grid layouts
- Mobile navigation
- Responsive utilities
