# create-remix-route

Create Remix component/page with proper typing, state management, and accessibility.

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
// app/routes/users.tsx
import type { LoaderFunctionArgs, ActionFunctionArgs } from "@remix-run/node";
import { json, redirect } from "@remix-run/node";
import { useLoaderData, Form, useNavigation } from "@remix-run/react";

export async function loader({ request }: LoaderFunctionArgs) {
  const userId = await requireUser(request);
  const users = await db.users.findByOrg(userId);
  return json({ users });
}

export async function action({ request }: ActionFunctionArgs) {
  const formData = await request.formData();
  const intent = formData.get("intent");

  if (intent === "delete") {
    await db.users.delete(formData.get("id") as string);
  }

  return redirect("/users");
}

export default function UsersPage() {
  const { users } = useLoaderData<typeof loader>();
  const navigation = useNavigation();

  return (
    <div>
      <h1>Users</h1>
      {users.map((user) => (
        <div key={user.id} className="flex justify-between items-center p-4 border">
          <span>{user.name}</span>
          <Form method="post">
            <input type="hidden" name="intent" value="delete" />
            <input type="hidden" name="id" value={user.id} />
            <button type="submit" disabled={navigation.state === "submitting"}>
              Delete
            </button>
          </Form>
        </div>
      ))}
    </div>
  );
}
```

### Step 3: Add Types
```typescript
// src/types/create-remix-route.ts
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
