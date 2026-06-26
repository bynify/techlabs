# onboarding-flow

Design user onboarding for activation, engagement, and retention.

## When to Use

## Agents to Dispatch
- product-manager: User journey
- ui-engineer: UI implementation
- New user experience
- Feature adoption
- Reducing time-to-value

## Execution

### Step 1: Define Activation Moment
```
AHA MOMENT:
- What action signals value?
- When does user "get it"?

EXAMPLES:
- Slack: 2,000 team messages
- Dropbox: 1 file uploaded
- Trello: 1 board created
- Figma: 1 design shared
```

### Step 2: Onboarding Flow Design
```
FLOW:

1. Welcome Screen
   - Product value prop
   - Get started CTA

2. Quick Setup (Optional)
   - Import from existing tool
   - Connect integrations
   - Skip option available

3. Guided Tour
   - Highlight key features
   - Interactive tooltips
   - Progress indicator

4. First Action
   - Promote first value action
   - Provide templates/examples
   - Success celebration

5. Check-in (Day 3-7)
   - Email with tips
   - Help resources
   - Support offer
```

### Step 3: Component Implementation
```typescript
// Onboarding progress component
interface OnboardingStep {
  id: string;
  title: string;
  description: string;
  completed: boolean;
  required: boolean;
}

function OnboardingProgress({ steps }: { steps: OnboardingStep[] }) {
  const completed = steps.filter(s => s.completed).length;
  const progress = (completed / steps.length) * 100;

  return (
    <div>
      <div className="flex justify-between text-sm">
        <span>Getting started</span>
        <span>{completed}/{steps.length}</span>
      </div>
      <div className="h-2 bg-gray-200 rounded">
        <div className="h-2 bg-blue-500 rounded" style={{ width: `${progress}%` }} />
      </div>
    </div>
  );
}
```

### Step 4: Email Sequence
```
DAY 0: Welcome email + quick start guide
DAY 1: Feature spotlight (most relevant to their use case)
DAY 3: Tips and best practices
DAY 7: Check-in + offer help
DAY 14: Advanced features
DAY 30: Feedback request
```

## Output
- Onboarding flow definition
- UI components
- Email sequence
- Activation metrics
