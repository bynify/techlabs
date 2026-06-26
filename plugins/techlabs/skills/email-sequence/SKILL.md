# email-sequence

Build automated email sequences for onboarding, engagement, and retention.

## When to Use
- User onboarding
- Drip campaigns
- Re-engagement

## Execution

### Step 1: Define Sequence
```
SEQUENCE: Onboarding
TRIGGER: User signup

Day 0: Welcome email
Day 1: Getting started guide
Day 3: Feature highlight
Day 7: Check-in + help resources
Day 14: Advanced features
Day 30: Feedback request
```

### Step 2: Email Template
```html
<!DOCTYPE html>
<html>
<body>
  <h1>Welcome to {{product_name}}!</h1>
  <p>Hi {{first_name}},</p>
  <p>Thanks for signing up. Here's how to get started:</p>
  <ol>
    <li>Complete your profile</li>
    <li>Create your first project</li>
    <li>Invite your team</li>
  </ol>
  <a href="{{cta_url}}" style="background:#3b82f6;color:white;padding:12px 24px;">
    Get Started
  </a>
</body>
</html>
```

### Step 3: Trigger Logic
```typescript
async function sendOnboardingEmail(userId: string, day: number) {
  const template = onboardingSequence[day];
  const user = await db.users.findById(userId);
  
  await email.send({
    to: user.email,
    subject: template.subject,
    html: renderTemplate(template.html, { first_name: user.name, ...template.vars }),
  });
}
```

## Output
- Email sequence definition
- Templates
- Trigger logic
- Analytics tracking
