# Messaging Code Rules

Applies to: `src/messaging/**`

## Requirements
- Idempotency for consumers
- Dead letter queue configuration
- Consumer group management
- Schema versioning
- Error handling and retry logic

## Patterns
- Use idempotency keys for message processing
- Configure dead letter queues
- Monitor consumer lag
- Use schema registry for message formats

## Anti-patterns
- Do not process messages without acknowledgment
- Do not ignore failed messages
- Do not skip monitoring
