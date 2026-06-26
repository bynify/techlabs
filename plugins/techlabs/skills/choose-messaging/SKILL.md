# choose-messaging

Select the right message broker based on project requirements.

## When to Use
- Designing event-driven systems
- Choosing between Kafka, RabbitMQ, NATS, etc.
- Scaling communication between services

## Execution

### Step 1: Analyze Requirements
```
ASK USER:
1. Message volume? (low/medium/high/very high)
2. Ordering important?
3. Exactly-once needed?
4. Streaming or task queue?
5. Multi-consumer patterns?
```

### Step 2: Compare Options
```
| Feature          | Kafka  | RabbitMQ | NATS  | Redis Pub/Sub | SQS/SNS |
|------------------|--------|----------|-------|---------------|---------|
| Throughput       | High   | Medium   | High  | Medium        | Medium  |
| Ordering         | Per-partition | Per-queue | No | No          | FIFO    |
| Exactly-once     | ✅     | ❌       | ❌    | ❌            | ✅ FIFO |
| Message replay   | ✅     | ❌       | ❌    | ❌            | ❌      |
| Streaming        | ✅     | ❌       | ✅    | ❌            | ❌      |
| Managed option   | ✅     | ✅       | ✅    | ✅            | ✅      |
```

### Step 3: Decision Matrix
```
IF volume > 100k/sec OR event_sourcing:
  → Kafka

IF task_queue AND reliability_critical:
  → RabbitMQ

IF simple_pub_sub AND low_latency:
  → NATS

IF already_using_redis AND simple_needs:
  → Redis Pub/Sub

IF aws_native AND managed_service:
  → SQS/SNS
```

### Step 4: Create Implementation Plan
```
RECOMMENDED: [Selected]

Setup:
1. [Infrastructure step]
2. [Client setup]
3. [First topic/queue]

Considerations:
- [Scaling strategy]
- [Monitoring approach]
- [Cost estimate]
```

## Output
- Messaging system recommendation
- Comparison matrix
- Implementation plan
- Cost estimates
