# create-svelte-component

Create Svelte component/page with proper typing, state management, and accessibility.

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
```svelte
<script lang="ts">
  interface User {
    id: string;
    name: string;
    email: string;
    role: string;
  }

  interface Props {
    users: User[];
    onEdit: (id: string) => void;
    onDelete: (id: string) => void;
  }

  let { users, onEdit, onDelete }: Props = $props();
  let search = $state("");

  let filtered = $derived(
    users.filter(u => u.name.toLowerCase().includes(search.toLowerCase()))
  );
</script>

<div>
  <input bind:value={search} placeholder="Search users..." class="border p-2 rounded w-full" />
  
  {#each filtered as user (user.id)}
    <div class="border p-4 rounded mt-2 flex justify-between items-center">
      <div>
        <h3 class="font-semibold">{user.name}</h3>
        <p class="text-gray-600">{user.email}</p>
        <span class="text-xs bg-gray-100 px-2 py-1 rounded">{user.role}</span>
      </div>
      <div class="flex gap-2">
        <button onclick={() => onEdit(user.id)}>Edit</button>
        <button onclick={() => onDelete(user.id)}>Delete</button>
      </div>
    </div>
  {/each}
</div>
```

### Step 3: Add Types
```typescript
// src/types/create-svelte-component.ts
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
