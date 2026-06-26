# create-react-component

Create React component/page with proper typing, state management, and accessibility.

## When to Use

## Agents to Dispatch
- react-specialist: React implementation
- ui-engineer: Component design
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
// src/components/UserCard.tsx
import { memo, useState } from "react";

interface User {
  id: string;
  name: string;
  email: string;
  avatar?: string;
  role: "admin" | "user" | "viewer";
}

interface UserCardProps {
  user: User;
  onEdit: (id: string) => void;
  onDelete: (id: string) => void;
}

export const UserCard = memo(function UserCard({ user, onEdit, onDelete }: UserCardProps) {
  const [isDeleting, setIsDeleting] = useState(false);

  const handleDelete = async () => {
    setIsDeleting(true);
    try {
      await onDelete(user.id);
    } finally {
      setIsDeleting(false);
    }
  };

  return (
    <div className="border rounded-lg p-4 shadow-sm">
      {user.avatar && <img src={user.avatar} alt="" className="w-12 h-12 rounded-full" />}
      <h3 className="font-semibold text-lg mt-2">{user.name}</h3>
      <p className="text-gray-600">{user.email}</p>
      <span className="text-xs bg-gray-100 px-2 py-1 rounded">{user.role}</span>
      <div className="mt-4 flex gap-2">
        <button onClick={() => onEdit(user.id)} className="btn-secondary">Edit</button>
        <button onClick={handleDelete} disabled={isDeleting} className="btn-danger">
          {isDeleting ? "Deleting..." : "Delete"}
        </button>
      </div>
    </div>
  );
});
```

### Step 3: Add Types
```typescript
// src/types/create-react-component.ts
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
