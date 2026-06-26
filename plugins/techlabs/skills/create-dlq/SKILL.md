# create-dlq

Dead letter queue pattern for failed message processing with retry and alerting.

## When to Use
- Message processing failures
- Poison messages
- Unprocessable events
- Error tracking

## Execution

### Step 1: Configure DLQ
```
FOR EACH queue/topic:
- Set max retries (default 3)
- Configure DLQ topic
- Add failure alerting
```

### Step 2: Implement DLQ Handler
```typescript
async function processWithDLQ(message: Message) {
  let retryCount = 0;

  while (retryCount <= MAX_RETRIES) {
    try {
      await processMessage(message);
      await acknowledge(message);
      return;
    } catch (error) {
      retryCount++;
      if (retryCount > MAX_RETRIES) {
        await sendToDLQ(message, error, retryCount);
        await alertOpsTeam(message, error);
      } else {
        await sleep(Math.pow(2, retryCount) * 1000); // Exponential backoff
      }
    }
  }
}

async function sendToDLQ(message: Message, error: Error, retries: number) {
  await dlq.produce({
    original: message,
    error: {
      message: error.message,
      stack: error.stack,
      retries,
      timestamp: new Date().toISOString(),
    },
  });
}
```

### Step 3: DLQ Monitoring
```
ALERTS:
- DLQ depth > 10 → Warning
- DLQ depth > 100 → Critical
- DLQ growth rate > 10/min → Alert

DASHBOARD:
- Messages processed vs failed
- DLQ depth over time
- Top failure reasons
```

### Step 4: DLQ Replay Tool
```typescript
async function replayDLQMessages(from: Date, to: Date) {
  const messages = await dlq.query({ from, to });
  for (const msg of messages) {
    try {
      await processMessage(msg.original);
      await dlq.delete(msg.id);
    } catch (error) {
      console.log(`Replay failed for ${msg.id}:`, error);
    }
  }
}
```

## Output
- DLQ configuration
- Processing with retries
- Monitoring and alerting
- Replay tool
