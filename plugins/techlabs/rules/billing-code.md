# Billing Code Rules

Applies to: `src/billing/**`

## Requirements
- Idempotency for all operations
- Webhook signature verification
- Invoice trail and audit logging
- Tax handling
- Subscription lifecycle management

## Patterns
- Use idempotency keys for API calls
- Verify webhook signatures
- Log all billing events
- Handle subscription state transitions

## Anti-patterns
- Do not skip webhook verification
- Do not assume payment success
- Do not double-charge on retries
