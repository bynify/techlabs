# create-nextjs-page

Create Next.js component/page with proper typing, state management, and accessibility.

## When to Use
- Building UI features
- Adding new pages
- Creating reusable components

## Execution

### Step 1: Define Requirements
```
ASK USER:
1. Component/page purpose?
2. Data requirements?
3. Interactions needed?
4. Auth required?
```

### Step 2: Create Implementation
```tsx
// app/dashboard/page.tsx
import { Suspense } from "react";
import { getServerSession } from "next-auth";
import { redirect } from "next/navigation";

export default async function DashboardPage() {
  const session = await getServerSession();
  if (!session) redirect("/login");

  const stats = await getStats(session.user.id);

  return (
    <div className="container py-8">
      <h1 className="text-3xl font-bold mb-8">Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <StatCard title="Orders" value={stats.orders} />
        <StatCard title="Revenue" value={`$${stats.revenue}`} />
        <StatCard title="Customers" value={stats.customers} />
      </div>
      <Suspense fallback={<div>Loading chart...</div>}>
        <RecentOrdersChart userId={session.user.id} />
      </Suspense>
    </div>
  );
}
```

### Step 3: Add Types
```typescript
// src/types/create-nextjs-page.ts
interface User {
  id: string;
  name: string;
  email: string;
  role: "admin" | "user" | "viewer";
  createdAt: string;
}
```

### Step 4: Add Tests
```typescript
import { render, screen } from "@testing-library/react";
import { UserCard } from "./UserCard";

test("renders user name", () => {
  render(<UserCard user={mockUser} onEdit={vi.fn()} onDelete={vi.fn()} />);
  expect(screen.getByText("Test User")).toBeInTheDocument();
});
```

## Output
- Component/page file
- Type definitions
- Unit tests
- Documentation
