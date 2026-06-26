# webhook-setup

Implement webhook sending and receiving.

## When to Use
- Webhook setup
- Event notifications
- Third-party integration
- Real-time updates

## Execution

### Step 1: Sender
```typescript
async function sendWebhook(url: string, event: string, payload: any) {
  const signature = crypto
    .createHmac('sha256', WEBHOOK_SECRET)
    .update(JSON.stringify(payload))
    .digest('hex');

  await fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Webhook-Signature': signature,
    },
    body: JSON.stringify({ event, payload, timestamp: Date.now() }),
  });
}
```

### Step 2: Receiver
```typescript
app.post('/webhooks/stripe', (req, res) => {
  const sig = req.headers['stripe-signature'];
  const event = stripe.webhooks.constructEvent(req.body, sig, WEBHOOK_SECRET);

  switch (event.type) {
    case 'payment_intent.succeeded':
      handlePaymentSuccess(event.data.object);
      break;
  }

  res.json({ received: true });
});
```

### Step 3: Retry Logic
```
RETRY:
- Attempt 1: immediate
- Attempt 2: 5 minutes
- Attempt 3: 30 minutes
- Attempt 4: 2 hours
- Attempt 5: DLQ
```

## Output
- Webhook sender
- Webhook receiver
- Signature verification
- Retry logic
