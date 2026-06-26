# create-event-handler

Build event handlers for async message processing with idempotency.

## When to Use
- Processing queue messages
- Handling webhook events
- Event-driven architectures
- Async workflows

## Execution

### Step 1: Define Event Schema
```typescript
// src/events/schema.ts
export const OrderCreatedEvent = z.object({
  orderId: z.string(),
  userId: z.string(),
  items: z.array(z.object({
    productId: z.string(),
    quantity: z.number(),
    price: z.number(),
  })),
  total: z.number(),
  createdAt: z.string().datetime(),
});

export type OrderCreated = z.infer<typeof OrderCreatedEvent>;
```

### Step 2: Create Handler
```typescript
// src/handlers/order-created.ts
async function handleOrderCreated(event: OrderCreated) {
  // 1. Check idempotency
  if (await isProcessed(event.orderId)) {
    return { status: 'already_processed' };
  }

  // 2. Process
  await inventory.reserve(event.items);
  await payments.charge(event.userId, event.total);
  await notifications.send(event.userId, 'order_confirmed', { orderId: event.orderId });

  // 3. Mark processed
  await markProcessed(event.orderId, 'order_created');

  return { status: 'processed' };
}
```

### Step 3: Add Error Handling
```typescript
async function safeHandler(event: unknown) {
  const parsed = OrderCreatedEvent.safeParse(event);
  if (!parsed.success) {
    console.error('Invalid event:', parsed.error);
    return { status: 'rejected', reason: 'invalid_schema' };
  }

  try {
    return await handleOrderCreated(parsed.data);
  } catch (error) {
    console.error('Handler error:', error);
    throw error; // Let queue retry or send to DLQ
  }
}
```

### Step 4: Event Router
```typescript
// src/events/router.ts
const handlers: Record<string, Function> = {
  'order.created': handleOrderCreated,
  'order.updated': handleOrderUpdated,
  'order.cancelled': handleOrderCancelled,
};

export async function routeEvent(eventType: string, payload: unknown) {
  const handler = handlers[eventType];
  if (!handler) {
    console.warn(`No handler for event: ${eventType}`);
    return { status: 'no_handler' };
  }
  return handler(payload);
}
```

## Output
- Event schemas (Zod)
- Handler implementations
- Idempotency logic
- Event router
