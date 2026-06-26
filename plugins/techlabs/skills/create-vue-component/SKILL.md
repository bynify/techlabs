# create-vue-component

Create Vue component/page with proper typing, state management, and accessibility.

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
interface User {
  id: string;
  name: string;
  email: string;
  role: string;
}

interface Props {
  users: User[];
  loading?: boolean;
}

const props = withDefaults(defineProps<Props>(), { loading: false });
const emit = defineEmits<{
  edit: [id: string];
  delete: [id: string];
}>();

const search = ref("");
const filtered = computed(() =>
  props.users.filter(u => u.name.toLowerCase().includes(search.value.toLowerCase()))
);
</script>

<template>
  <div>
    <input v-model="search" placeholder="Search..." class="border p-2 rounded w-full" />
    
    <div v-if="loading">Loading...</div>
    <div v-else class="space-y-2 mt-4">
      <div v-for="user in filtered" :key="user.id" class="border p-4 rounded flex justify-between">
        <div>
          <h3 class="font-semibold">{{ user.name }}</h3>
          <p class="text-gray-600">{{ user.email }}</p>
        </div>
        <div class="flex gap-2">
          <button @click="emit(edit, user.id)">Edit</button>
          <button @click="emit(delete, user.id)">Delete</button>
        </div>
      </div>
    </div>
  </div>
</template>
```

### Step 3: Add Types
```typescript
// src/types/create-vue-component.ts
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
