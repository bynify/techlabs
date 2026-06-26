# create-nuxt-page

Create Nuxt component/page with proper typing, state management, and accessibility.

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
```vue
<script setup lang="ts">
definePageMeta({
  middleware: ["auth"],
  layout: "dashboard",
});

const { data: users, pending } = await useFetch("/api/users", {
  query: { page: 1, limit: 10 },
});
</script>

<template>
  <div class="container py-8">
    <h1 class="text-3xl font-bold mb-6">Users</h1>
    <div v-if="pending">Loading...</div>
    <div v-else class="grid gap-4">
      <div v-for="user in users?.data" :key="user.id" class="border p-4 rounded">
        <h3 class="font-semibold">{{ user.name }}</h3>
        <p class="text-gray-600">{{ user.email }}</p>
      </div>
    </div>
  </div>
</template>
```

### Step 3: Add Types
```typescript
// src/types/create-nuxt-page.ts
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
