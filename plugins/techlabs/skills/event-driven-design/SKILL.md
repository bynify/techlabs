# event-driven-design

Design event-driven architecture with proper boundaries.

## Execution

### Step 1: Identify Events
```
FOR EACH domain action:
- What happened? (event)
- Who produced it? (source)
- Who consumes it? (handlers)
```

### Step 2: Define Schema
```typescript
interface DomainEvent {
  id: string;
  type: string;
  aggregateId: string;
  payload: unknown;
  timestamp: string;
}
```

### Step 3: Draw Boundaries
```
ORDER SERVICE → order.created → INVENTORY SERVICE
                                PAYMENT SERVICE
                                NOTIFICATION SERVICE
```

## Output
- Event catalog
- Service boundaries
- Schema definitions
