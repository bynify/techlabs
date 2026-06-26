# data-retention

Implement data retention policies for compliance and storage optimization.

## When to Use
- Compliance requirements
- Storage optimization
- Data cleanup
- GDPR compliance

## Agents to Dispatch
- data-engineer: Data management
- security-lead: Compliance
- devops-lead: Storage management

## Execution

### Step 1: Define Retention Policies
```markdown
# Data Retention Policy

## User Data
| Data Type | Retention | Action |
|-----------|-----------|--------|
| Account data | Active + 30 days | Anonymize |
| Session data | 30 days | Delete |
| Login history | 90 days | Archive |
| Activity logs | 1 year | Archive |

## Transaction Data
| Data Type | Retention | Action |
|-----------|-----------|--------|
| Orders | 7 years | Archive |
| Payments | 7 years | Archive |
| Refunds | 7 years | Archive |

## System Data
| Data Type | Retention | Action |
|-----------|-----------|--------|
| Logs | 30 days | Delete |
| Metrics | 90 days | Aggregate |
| Backups | 30 days | Delete |
```

### Step 2: Implement Cleanup Jobs
```typescript
// Cron job for data cleanup
async function cleanupExpiredData() {
  // 1. Delete expired sessions
  await db.sessions.deleteMany({
    expiresAt: { $lt: new Date() }
  });
  
  // 2. Anonymize old user data
  await db.users.updateMany({
    lastLogin: { $lt: subDays(new Date(), 365) },
    status: 'inactive'
  }, {
    $set: {
      email: 'anonymized@example.com',
      name: 'Anonymized User'
    }
  });
  
  // 3. Archive old logs
  await db.logs.aggregate([
    { $match: { createdAt: { $lt: subDays(new Date(), 30) } } },
    { $out: 'logs_archive' }
  ]);
  
  // 4. Delete old logs
  await db.logs.deleteMany({
    createdAt: { $lt: subDays(new Date(), 30) }
  });
}
```

### Step 3: Right to be Forgotten (GDPR)
```typescript
// GDPR: Right to be forgotten
async function deleteUser(userId: string) {
  // 1. Verify user request
  const user = await db.users.findById(userId);
  if (!user) throw new Error('User not found');
  
  // 2. Anonymize personal data
  await db.users.update(userId, {
    email: `deleted-${userId}@example.com`,
    name: 'Deleted User',
    phone: null,
    address: null
  });
  
  // 3. Delete related data
  await db.sessions.deleteMany({ userId });
  await db.activity.deleteMany({ userId });
  
  // 4. Keep transaction data (legal requirement)
  // Mark as deleted but retain for compliance
  await db.orders.updateMany(
    { userId },
    { $set: { userDeleted: true } }
  );
  
  // 5. Log deletion for audit
  await db.auditLog.create({
    action: 'USER_DELETED',
    userId,
    timestamp: new Date()
  });
}
```

### Step 4: Cron Schedule
```json
{
  "jobs": [
    {
      "name": "cleanup-sessions",
      "schedule": "0 2 * * *",
      "script": "cleanup-sessions.js"
    },
    {
      "name": "archive-logs",
      "schedule": "0 3 * * *",
      "script": "archive-logs.js"
    },
    {
      "name": "anonymize-inactive",
      "schedule": "0 4 * * 0",
      "script": "anonymize-inactive.js"
    }
  ]
}
```

### Step 5: Monitoring
```yaml
# Monitor data retention
metrics:
  - data_retention_expired_count
  - data_retention_archived_count
  - data_retention_deleted_count
  
alerts:
  - DataRetentionJobFailed
  - DataRetentionHighVolume
```

## Output
- Retention policies defined
- Cleanup jobs implemented
- GDPR compliance implemented
- Monitoring configured
