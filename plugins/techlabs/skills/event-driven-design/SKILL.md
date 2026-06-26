# event-driven-design

Design event-driven architecture with proper boundaries, schemas, and reliability patterns.

## When to Use
- Microservices communication
- Async workflows
- Event sourcing
- Decoupling services

## Execution

### Step 1: Identify Events
```
ASK USER:
1. What business events occur?
2. Which services produce events?
3. Which services consume events?
4. Ordering requirements?
5. Delivery guarantees needed?
```

### Step 2: Event Catalog
```markdown
# Event Catalog

## order.created
- **Producer:** Order Service
- **Consumers:** Inventory, Payment, Notification
- **Payload:** { orderId, userId, items, total }
- **Guarantees:** At-least-once
- **Ordering:** Per-user (partition by userId)

## order.paid
- **Producer:** Payment Service
- **Consumers:** Fulfillment, Analytics
- **Payload:** { orderId, paymentId, amount, method }
- **Guarantees:** Exactly-once
- **Ordering:** Per-order

## order.shipped
- **Producer:** Fulfillment Service
- **Consumers:** Notification, Analytics
- **Payload:** { orderId, trackingNumber, carrier }
- **Guarantees:** At-least-once
```

### Step 3: Event Schema
```typescript
// Base event interface
interface DomainEvent {
  id: string;                    // Unique event ID
  type: string;                  // Event type (order.created)
  aggregateId: string;           // Entity ID (orderId)
  aggregateType: string;         // Entity type (order)
  version: number;               // Schema version
  timestamp: string;             // ISO 8601
  source: string;                // Producer service
  payload: unknown;              // Event data
  metadata: {
    correlationId?: string;      // Request trace
    causationId?: string;        // Previous event ID
    userId?: string;             // User who triggered
  };
}

// Specific event
interface OrderCreatedEvent extends DomainEvent {
  type: 'order.created';
  payload: {
    orderId: string;
    userId: string;
    items: Array<{
      productId: string;
      quantity: number;
      price: number;
    }>;
    total: number;
    currency: string;
  };
}
```

### Step 4: Service Boundaries
```
BOUNDARY MAP:

┌─────────────┐
│   Order     │
│   Service   │
└──────┬──────┘
       │ order.created
       ▼
┌──────────────┐     ┌──────────────┐
│  Inventory   │     │   Payment    │
│   Service    │     │   Service    │
└──────┬───────┘     └──────┬───────┘
       │ stock.reserved     │ payment.processed
       ▼                    ▼
┌─────────────────────────────────────┐
│         Notification Service        │
└─────────────────────────────────────┘
```

### Step 5: Reliability Patterns
```
PATTERNS:

1. Outbox Pattern
   - Write event + business data in same transaction
   - Poll outbox table and publish events
   - Guarantees: Exactly-once delivery

2. Idempotency
   - Each event has unique ID
   - Consumers track processed event IDs
   - Skip duplicate events

3. Dead Letter Queue
   - Failed events go to DLQ
   - Alert on DLQ growth
   - Manual or automatic retry

4. Ordering
   - Use partition key (userId, orderId)
   - Events in same partition are ordered
   - Cross-partition: eventual consistency
```

### Step 6: Generate Documentation
```markdown
# Event-Driven Architecture

## Overview
[Service map diagram]

## Event Catalog
[Table from Step 2]

## Event Schemas
[TypeScript interfaces from Step 3]

## Reliability
- Outbox pattern for producers
- Idempotency for consumers
- Dead letter queue for failures

## Monitoring
- Event throughput per topic
- Consumer lag
- DLQ depth
- Processing latency
```

## Output
- Event catalog
- Service boundaries
- Event schemas
- Reliability patterns
- Monitoring plan
