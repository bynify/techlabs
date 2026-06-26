# compliance-check

Verify compliance with GDPR, SOC2, HIPAA, and other regulations.

## When to Use
- New feature launches
- Audit preparation
- Data handling changes

## Execution

### Step 1: GDPR Checklist
```
- [ ] Consent collected before data processing
- [ ] Privacy policy accessible
- [ ] Data subject rights implemented (access, delete, portability)
- [ ] Data retention policy defined
- [ ] DPO appointed (if required)
- [ ] Data processing records maintained
```

### Step 2: Data Flow Audit
```
MAP data flows:
- Collection points
- Storage locations
- Processing activities
- Third-party sharing
- Retention periods
```

### Step 3: Technical Controls
```typescript
// Data retention
async function enforceRetention() {
  const expired = await db.query(
    'DELETE FROM analytics WHERE created_at < NOW() - INTERVAL \'2 years\' RETURNING id'
  );
}

// Right to deletion
async function handleDeletionRequest(userId: string) {
  await db.query('DELETE FROM users WHERE id = $1', [userId]);
  await db.query('DELETE FROM orders WHERE user_id = $1', [userId]);
  await auditLog('user_deleted', { userId });
}
```

## Output
- Compliance checklist
- Data flow map
- Technical controls
- Gap analysis
