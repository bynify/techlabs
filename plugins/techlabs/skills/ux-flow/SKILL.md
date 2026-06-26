# ux-flow

Design user experience flows for key workflows with edge cases and accessibility.

## When to Use
- Feature design
- Conversion optimization
- User research
- Sprint planning

## Execution

### Step 1: Define Flow
```
ASK USER:
1. What workflow are we designing?
2. Who are the users?
3. What's the entry point?
4. What's the desired outcome?
5. What could go wrong?
```

### Step 2: Create Flow Diagram
```
FLOW: Checkout

ENTRY: Cart Page
│
├─→ Review Items
│   ├─→ Update Quantity
│   └─→ Remove Item
│
├─→ Proceed to Checkout
│   ├─→ [LOGGED IN] → Select saved address
│   └─→ [GUEST] → Enter shipping info
│
├─→ Enter Address
│   ├─→ Autocomplete
│   ├─→ Validation
│   └─→ Save for later
│
├─→ Select Payment
│   ├─→ Credit Card
│   ├─→ PayPal
│   └─→ Apple Pay
│
├─→ Confirm Order
│   └─→ Place Order
│
└─→ Success
    ├─→ Confirmation Page
    ├─→ Email Receipt
    └─→ Track Order
```

### Step 3: Edge Cases
```
ERROR STATES:

1. Payment Declined
   - Show error message
   - Allow retry
   - Suggest alternative payment
   - Save cart for 30 minutes

2. Out of Stock
   - Notify at cart page
   - Suggest alternatives
   - Allow backorder if allowed

3. Address Invalid
   - Inline validation
   - Suggest corrections
   - Manual override option

4. Session Timeout
   - Save progress
   - Redirect to login
   - Restore cart after login

5. Network Error
   - Auto-retry 3 times
   - Queue order for later
   - Show offline indicator
```

### Step 4: Accessibility
```
CHECK:
- [ ] Keyboard navigation works
- [ ] Screen reader announces changes
- [ ] Focus management correct
- [ ] Error messages announced
- [ ] Color not only indicator
```

### Step 5: Wireframe Each Step
```markdown
## Step 1: Cart Review

┌─────────────────────────────────────┐
│ Cart (3 items)                      │
├─────────────────────────────────────┤
│ [Image] Product A         $29.99   │
│         Qty: [1] [-] [+]  $29.99  │
│                                     │
│ [Image] Product B         $19.99   │
│         Qty: [2] [-] [+]  $39.98  │
├─────────────────────────────────────┤
│ Subtotal:          $69.97          │
│ Shipping:           $5.99          │
│ Tax:                $5.60          │
│ Total:             $81.56          │
├─────────────────────────────────────┤
│ [Continue Shopping]  [Checkout →]  │
└─────────────────────────────────────┘

ELEMENTS:
- Product image, name, price
- Quantity controls
- Remove button
- Order summary
- CTAs (secondary + primary)
```

### Step 6: Success Metrics
```
MEASURE:
- Step completion rate
- Drop-off per step
- Time to complete
- Error rate per step
- Support tickets related to flow
```

### Step 7: Generate Report
```markdown
# UX Flow: Checkout

## Summary
- Steps: 5
- Expected time: 2 minutes
- Edge cases: 5 identified

## Flow Map
[Diagram from Step 2]

## Edge Cases
[Table from Step 3]

## Wireframes
[Sketches for each step]

## Recommendations
1. Add address autocomplete (reduce friction)
2. Save cart for guests (recover abandoned carts)
3. Show progress indicator (reduce anxiety)

## Success Metrics
- Target completion rate: >80%
- Target time: <90 seconds
```

## Output
- Flow diagram
- Edge cases documented
- Accessibility checklist
- Wireframes
- Success metrics
