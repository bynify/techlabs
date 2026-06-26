# event-tracking

Implement analytics event tracking for user behavior.

## When to Use
- Event tracking
- Analytics setup
- User behavior
- Conversion tracking

## Execution

### Step 1: Define Events
```typescript
const events = {
  page_view: { path: string, referrer?: string },
  button_click: { button_id: string, page: string },
  form_submit: { form_id: string, success: boolean },
  purchase: { amount: number, currency: string, items: number },
};
```

### Step 2: Track Function
```typescript
function track(event: string, properties: Record<string, unknown>) {
  analytics.track(event, {
    ...properties,
    timestamp: Date.now(),
    userId: getCurrentUserId(),
  });
}
```

### Step 3: Page Views
```typescript
useEffect(() => {
  track('page_view', { path: pathname });
}, [pathname]);
```

## Output
- Event definitions
- Track function
- Page view tracking
