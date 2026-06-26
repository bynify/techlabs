# billing-setup

Implement billing with Stripe subscriptions, invoices, and payment processing.

## When to Use
- Adding subscription billing
- Implementing payment flows
- Setting up invoicing
- Handling webhooks

## Execution

### Step 1: Configure Stripe
```
ASK USER:
1. Pricing model? (per-seat, usage, flat)
2. Trial period needed?
3. Payment methods? (card, bank transfer)
4. Currency? (USD, EUR, IDR)
```

### Step 2: Create Billing Schema
```sql
CREATE TABLE customers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) UNIQUE,
  stripe_customer_id VARCHAR(255) UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID REFERENCES customers(id),
  stripe_subscription_id VARCHAR(255) UNIQUE,
  status VARCHAR(50) NOT NULL,
  price_id VARCHAR(255) NOT NULL,
  current_period_start TIMESTAMPTZ,
  current_period_end TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### Step 3: Implement Checkout
```typescript
import Stripe from 'stripe';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!);

export async function createCheckoutSession(userId: string, priceId: string) {
  const customer = await getOrCreateStripeCustomer(userId);
  
  const session = await stripe.checkout.sessions.create({
    customer: customer.id,
    mode: 'subscription',
    line_items: [{ price: priceId, quantity: 1 }],
    success_url: `${process.env.APP_URL}/billing/success?session_id={CHECKOUT_SESSION_ID}`,
    cancel_url: `${process.env.APP_URL}/billing`,
    subscription_data: {
      trial_period_days: 14,
    },
  });

  return session.url;
}
```

### Step 4: Handle Webhooks
```typescript
// POST /api/webhooks/stripe
export async function handleStripeWebhook(request: Request) {
  const body = await request.text();
  const sig = request.headers.get('stripe-signature')!;
  
  const event = stripe.webhooks.constructEvent(body, sig, process.env.STRIPE_WEBHOOK_SECRET!);

  switch (event.type) {
    case 'checkout.session.completed':
      await handleCheckoutComplete(event.data.object);
      break;
    case 'customer.subscription.updated':
      await handleSubscriptionUpdate(event.data.object);
      break;
    case 'customer.subscription.deleted':
      await handleSubscriptionCanceled(event.data.object);
      break;
    case 'invoice.payment_failed':
      await handlePaymentFailed(event.data.object);
      break;
  }

  return Response.json({ received: true });
}
```

### Step 5: Add Customer Portal
```typescript
export async function createPortalSession(userId: string) {
  const customer = await getStripeCustomer(userId);
  
  const session = await stripe.billingPortal.sessions.create({
    customer: customer.id,
    return_url: `${process.env.APP_URL}/billing`,
  });

  return session.url;
}
```

## Output
- Billing schema
- Checkout flow
- Subscription management
- Webhook handler
- Customer portal
