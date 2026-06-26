# create-astro-component

Create Astro component with props, slots, and islands.

## When to Use
- Content-focused components
- Partial hydration
- Static + interactive

## Execution

### Step 1: Create Component
```astro
---
// src/components/UserCard.astro
interface Props {
  name: string;
  email: string;
  avatar?: string;
}

const { name, email, avatar } = Astro.props;
---

<div class="border rounded-lg p-4">
  {avatar && <img src={avatar} alt={name} class="w-12 h-12 rounded-full" />}
  <h3 class="font-semibold mt-2">{name}</h3>
  <p class="text-gray-600">{email}</p>
  <slot />
</div>
```

### Step 2: Use with Client Island
```astro
---
import UserCard from "../components/UserCard.astro";
import UserActions from "../components/UserActions"; // React component
---

<UserCard name="John" email="john@example.com">
  <UserActions client:visible userId="123" />
</UserCard>
```

## Output
- Component file
- Props interface
- Slot support
- Client directive usage
