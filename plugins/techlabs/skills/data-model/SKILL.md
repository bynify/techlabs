# data-model

Define data models with types, validation, and relationships.

## When to Use
- Starting new features
- API contract design
- Type safety enforcement

## Execution

### Step 1: Define Models
```typescript
// src/models/user.ts
import { z } from 'zod';

export const UserSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  name: z.string().min(1).max(100),
  role: z.enum(['admin', 'user', 'viewer']),
  createdAt: z.string().datetime(),
  updatedAt: z.string().datetime(),
});

export type User = z.infer<typeof UserSchema>;

export const CreateUserSchema = UserSchema.omit({ id: true, createdAt: true, updatedAt: true });
export type CreateUser = z.infer<typeof CreateUserSchema>;
```

### Step 2: Add Relationships
```typescript
export const OrderSchema = z.object({
  id: z.string().uuid(),
  userId: z.string().uuid(),
  status: z.enum(['pending', 'processing', 'completed', 'cancelled']),
  total: z.number().positive(),
  items: z.array(z.object({
    productId: z.string().uuid(),
    quantity: z.number().int().positive(),
    price: z.number().positive(),
  })),
});
```

### Step 3: Create Validations
```typescript
export function validateUser(data: unknown): User {
  return UserSchema.parse(data);
}

export function validateCreateUser(data: unknown): CreateUser {
  return CreateUserSchema.parse(data);
}
```

## Output
- Type definitions
- Zod schemas
- Validation functions
- Relationship mapping
