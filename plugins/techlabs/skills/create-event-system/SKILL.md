# create-event-system

Implement event-driven architecture with pub/sub, sagas, and event sourcing.

## When to Use
- Decoupling services
- Event sourcing architecture
- Async communication patterns
- Distributed transactions

## Execution

### Step 1: Design Event Catalog
```markdown
| Event | Producer | Consumers | Schema |
|-------|----------|-----------|--------|
| order.created | Order Service | Inventory, Payment | order-v1 |
| order.paid | Payment Service | Fulfillment | order-paid-v1 |
```

### Step 2: Create Event Bus
```typescript
type EventHandler<T> = (event: T) => Promise<void>;

class EventBus {
  private handlers = new Map<string, EventHandler<any>[]>();

  on<T>(event: string, handler: EventHandler<T>) {
    const h = this.handlers.get(event) || [];
    h.push(handler);
    this.handlers.set(event, h);
  }

  async emit<T>(event: string, data: T) {
    const handlers = this.handlers.get(event) || [];
    await Promise.all(handlers.map(h => h(data)));
  }
}

export const bus = new EventBus();
```

### Step 3: Define Event Schemas
```typescript
// src/events/schemas.ts
export const schemas = {
  'order.created': z.object({
    orderId: z.string(),
    userId: z.string(),
    total: z.number(),
    items: z.array(z.object({
      productId: z.string(),
      quantity: z.number(),
    })),
  }),
  'order.paid': z.object({
    orderId: z.string(),
    paymentId: z.string(),
    amount: z.number(),
  }),
};
```

## Output
- Event bus
- Event schemas
- Handler registration
- Saga patterns
