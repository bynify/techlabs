# audit-trail

Implement audit logging for compliance and security tracking.

## When to Use
- Security compliance
- Activity tracking
- Forensic analysis
- Regulatory requirements

## Agents to Dispatch
- security-lead: Security logging
- data-engineer: Log management
- devops-lead: Infrastructure logging

## Execution

### Step 1: Define Audit Events
```
AUDIT EVENTS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

AUTH EVENTS:
- user.login.success
- user.login.failure
- user.logout
- user.password_change
- user.mfa_enabled
- user.mfa_disabled

DATA EVENTS:
- data.create
- data.read
- data.update
- data.delete
- data.export

ADMIN EVENTS:
- admin.user_created
- admin.user_deleted
- admin.role_changed
- admin.settings_changed

SYSTEM EVENTS:
- system.config_changed
- system.backup_completed
- system.deployment
```

### Step 2: Implement Audit Logger
```typescript
// lib/audit-logger.ts
import { db } from './database';

interface AuditEvent {
  action: string;
  userId: string;
  resource: string;
  resourceId: string;
  details: Record<string, any>;
  ipAddress: string;
  userAgent: string;
  timestamp: Date;
}

export async function logAudit(event: AuditEvent) {
  await db.auditLog.create({
    data: {
      action: event.action,
      userId: event.userId,
      resource: event.resource,
      resourceId: event.resourceId,
      details: event.details,
      ipAddress: event.ipAddress,
      userAgent: event.userAgent,
      timestamp: event.timestamp
    }
  });
}

// Usage
await logAudit({
  action: 'user.login.success',
  userId: user.id,
  resource: 'user',
  resourceId: user.id,
  details: { method: 'password' },
  ipAddress: req.ip,
  userAgent: req.headers['user-agent'],
  timestamp: new Date()
});
```

### Step 3: Audit Middleware
```typescript
// middleware/audit.ts
export function auditMiddleware(action: string) {
  return async (req, res, next) => {
    // Log before
    await logAudit({
      action,
      userId: req.user?.id,
      resource: req.params.resource,
      resourceId: req.params.id,
      details: { body: req.body },
      ipAddress: req.ip,
      userAgent: req.headers['user-agent'],
      timestamp: new Date()
    });
    
    next();
  };
}

// Usage
router.post('/users', auditMiddleware('data.create'), createUser);
router.put('/users/:id', auditMiddleware('data.update'), updateUser);
router.delete('/users/:id', auditMiddleware('data.delete'), deleteUser);
```

### Step 4: Audit Query
```typescript
// Query audit logs
async function getAuditLogs(filters: {
  userId?: string;
  action?: string;
  startDate?: Date;
  endDate?: Date;
  resource?: string;
}) {
  return db.auditLog.findMany({
    where: {
      userId: filters.userId,
      action: filters.action,
      resource: filters.resource,
      timestamp: {
        gte: filters.startDate,
        lte: filters.endDate
      }
    },
    orderBy: { timestamp: 'desc' }
  });
}
```

### Step 5: Audit Report
```markdown
# Audit Report

## Period: 2024-01-01 to 2024-01-31

## Summary
- Total events: 15,000
- Unique users: 500
- Failed logins: 45
- Data exports: 12

## Events by Type
| Event | Count | % |
|-------|-------|---|
| user.login.success | 5,000 | 33% |
| data.read | 4,500 | 30% |
| data.update | 3,000 | 20% |
| data.create | 1,500 | 10% |
| data.delete | 500 | 3% |
| admin.* | 500 | 3% |

## Security Events
- Failed logins: 45 (0.3%)
- Password changes: 150
- MFA enabled: 25

## Compliance
- GDPR requests: 2
- Data exports: 12
- Data deletions: 5
```

## Output
- Audit events defined
- Audit logger implemented
- Middleware configured
- Query API available
- Reports generated
