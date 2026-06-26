# referral-program

Build referral program with tracking and rewards.

## When to Use

## Agents to Dispatch
- growth-lead: Referral logic
- data-engineer: Tracking
- Growth initiatives
- Viral loops
- Customer acquisition
- Retention programs

## Execution

### Step 1: Referral Schema
```sql
CREATE TABLE referrals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  referrer_id UUID REFERENCES users(id),
  referred_id UUID REFERENCES users(id),
  status VARCHAR(50) DEFAULT 'pending',
  reward_amount DECIMAL(10,2),
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### Step 2: Tracking
```typescript
app.post('/api/referrals', async (req, res) => {
  const { referralCode } = req.body;
  const referrer = await db.users.findByReferralCode(referralCode);
  
  if (!referrer) return res.status(404).json({ error: 'Invalid code' });
  
  await db.referrals.create({
    referrer_id: referrer.id,
    referred_id: req.user.id,
  });
  
  res.json({ success: true });
});
```

### Step 3: Rewards
```typescript
async function processReferralReward(referralId: string) {
  const referral = await db.referrals.findById(referralId);
  await db.users.addCredit(referral.referrer_id, 25);
  await db.users.addCredit(referral.referred_id, 25);
  await db.referrals.updateStatus(referralId, 'completed');
}
```

## Output
- Referral schema
- Tracking logic
- Reward system
