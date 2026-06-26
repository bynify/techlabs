# create-nextjs-api

Create Next.js API component/page with proper typing, state management, and accessibility.

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
```typescript
// app/api/users/route.ts
import { NextRequest, NextResponse } from "next/server";
import { z } from "zod";

const userSchema = z.object({
  name: z.string().min(1).max(100),
  email: z.string().email(),
});

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const page = parseInt(searchParams.get("page") || "1");
  const limit = parseInt(searchParams.get("limit") || "10");

  const users = await db.users.findMany({
    skip: (page - 1) * limit,
    take: limit,
  });

  return NextResponse.json({ data: users, page, limit });
}

export async function POST(request: NextRequest) {
  const body = await request.json();
  const result = userSchema.safeParse(body);

  if (!result.success) {
    return NextResponse.json({ errors: result.error.flatten() }, { status: 400 });
  }

  const user = await db.users.create({ data: result.data });
  return NextResponse.json(user, { status: 201 });
}
```

### Step 3: Add Types
```typescript
// src/types/create-nextjs-api.ts
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
