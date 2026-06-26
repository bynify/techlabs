# create-pricing-page

Build conversion-optimized pricing page with clear tiers and CTAs.

## When to Use

## Agents to Dispatch
- ui-engineer: Pricing page
- growth-lead: Pricing strategy
- Launch pricing
- Pricing page redesign
- A/B testing pricing

## Execution

### Step 1: Define Pricing Structure
```
ASK USER:
1. Pricing tiers?
2. Differentiators per tier?
3. Discount strategy?
4. CTA for each tier?
```

### Step 2: Create Pricing Component
```tsx
function PricingCard({ tier, features, price, isPopular }: Props) {
  return (
    <div className={cn("rounded-lg border p-6", isPopular && "border-blue-500 ring-2")}>
      {isPopular && <span className="text-blue-600 text-sm font-medium">Most Popular</span>}
      <h3 className="text-xl font-bold mt-2">{tier}</h3>
      <div className="mt-4">
        <span className="text-4xl font-bold">${price}</span>
        <span className="text-gray-500">/month</span>
      </div>
      <ul className="mt-6 space-y-3">
        {features.map(f => <li key={f}>✓ {f}</li>)}
      </ul>
    </div>
  );
}
```

## Output
- Pricing component
- Tier configuration
- Schema markup
- FAQ section
