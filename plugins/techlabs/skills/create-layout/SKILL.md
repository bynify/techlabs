# create-layout

Create page layout patterns.

## Execution

### Step 1: App Layout (SaaS Dashboard)
```typescript
// components/layouts/app-layout.tsx
"use client"

import { Sidebar } from "@/components/sidebar"
import { Header } from "@/components/header"

export function AppLayout({ children }) {
  return (
    <div className="flex h-screen">
      <Sidebar />
      <div className="flex-1 flex flex-col">
        <Header />
        <main className="flex-1 overflow-auto p-6">
          {children}
        </main>
      </div>
    </div>
  )
}
```

### Step 2: Marketing Layout
```typescript
// components/layouts/marketing-layout.tsx
import { Header } from "@/components/marketing/header"
import { Footer } from "@/components/marketing/footer"

export function MarketingLayout({ children }) {
  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      <main className="flex-1">{children}</main>
      <Footer />
    </div>
  )
}
```

### Step 3: Auth Layout
```typescript
// components/layouts/auth-layout.tsx
export function AuthLayout({ children }) {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="w-full max-w-md p-8 bg-white rounded-lg shadow">
        <div className="text-center mb-6">
          <Logo className="mx-auto h-12 w-auto" />
        </div>
        {children}
      </div>
    </div>
  )
}
```

### Step 4: Breadcrumbs
```typescript
// components/breadcrumbs.tsx
import Link from "next/link"

export function Breadcrumbs({ items }) {
  return (
    <nav className="flex items-center space-x-2 text-sm text-gray-600">
      {items.map((item, i) => (
        <span key={i} className="flex items-center">
          {i > 0 && <span className="mx-2">/</span>}
          {item.href ? (
            <Link href={item.href} className="hover:text-gray-900">
              {item.label}
            </Link>
          ) : (
            <span className="text-gray-900">{item.label}</span>
          )}
        </span>
      ))}
    </nav>
  )
}
```

## Output
- App layout (sidebar + content)
- Marketing layout (header + content + footer)
- Auth layout (centered card)
- Breadcrumbs component
