# create-kafka-topic

Create a Kafka topic with proper configuration.

## Execution

### Step 1: Gather Requirements
```
ASK USER:
1. Topic name (following naming convention)
2. Message schema
3. Partition count
4. Retention policy
5. Consumer groups
```

### Step 2: Design Topic
```
DESIGN:
- Topic name: {domain}.{entity}.{version}
- Partitions: Based on throughput needs
- Replication: 3 (production), 1 (development)
- Retention: Based on data needs
```

### Step 3: Create Schema
```
CREATE docs/event-catalog/{topic-name}.json:
{
  "topic": "orders.order.created.v1",
  "schema": {
    "type": "object",
    "properties": {
      "order_id": {"type": "string"},
      "customer_id": {"type": "string"},
      "total": {"type": "number"},
      "created_at": {"type": "string", "format": "date-time"}
    },
    "required": ["order_id", "customer_id", "total", "created_at"]
  },
  "partitions": 6,
  "retention_ms": 604800000
}
```

### Step 4: Create Producer/Consumer Code
```
CREATE src/messaging/{topic-name}/:
- producer.go - Message producer
- consumer.go - Message consumer
- schema.go - Schema validation
```

### Step 5: Create Tests
```
CREATE src/messaging/{topic-name}/test:
- producer_test.go - Producer tests
- consumer_test.go - Consumer tests
```

### Step 6: Document
```
UPDATE docs/event-catalog/index.md:
- Add topic to catalog
- Document usage patterns
```

## Output
- Created docs/event-catalog/{topic-name}.json
- Created src/messaging/{topic-name}/
- Created tests
- Updated event catalog
