# create-cron

Create Cron Job with proper configuration and error handling.

## When to Use
- Async processing needs
- Event-driven workflows
- Reliable message delivery

## Execution

### Step 1: Gather Requirements
```
ASK USER:
1. Message/event type?
2. Throughput requirements?
3. Ordering needs?
4. Retry strategy?
```

### Step 2: Configure
```typescript
// Implementation specific to queue type
// Follows patterns from create-kafka-topic for Kafka
// Follows patterns from create-sqs-queue for SQS
```

### Step 3: Add Error Handling
- Dead letter queue for failed messages
- Exponential backoff for retries
- Idempotency keys for deduplication

### Step 4: Monitor
- Queue depth alerts
- Processing rate metrics
- Error rate tracking

## Output
- Queue/topic configuration
- Producer code
- Consumer code with DLQ
- Monitoring setup
