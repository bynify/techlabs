# data-recovery

Data recovery procedures for accidental deletion or corruption.

## When to Use
- Accidental data deletion
- Data corruption
- Recovery testing
- Business continuity

## Agents to Dispatch
- data-engineer: Data recovery
- devops-lead: Infrastructure recovery
- security-lead: Security implications

## Execution

### Step 1: Assess Damage
```
QUESTIONS:
1. What data was lost?
2. When was it lost?
3. What's the last good backup?
4. Is there a point-in-time recovery option?
```

### Step 2: Recovery Options
```
RECOVERY OPTIONS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

OPTION 1: Point-in-Time Recovery (PostgreSQL)
- Restore to specific timestamp
- Requires WAL archiving enabled
- Minimal data loss

OPTION 2: Backup Restore
- Restore from last backup
- May lose recent changes
- Simple and reliable

OPTION 3: Logical Recovery
- Recover specific records
- From application logs
- Time-consuming

OPTION 4: Replication Recovery
- Promote replica to primary
- If replica not affected
- Fast recovery
```

### Step 3: Point-in-Time Recovery
```bash
# PostgreSQL Point-in-Time Recovery

# 1. Stop database
sudo systemctl stop postgresql

# 2. Restore base backup
pg_basebackup -D /var/lib/postgresql/data -Ft -z -Xs

# 3. Configure recovery
cat > /var/lib/postgresql/data/postgresql.auto.conf << EOF
restore_command = 'cp /backups/wal/%f %p'
recovery_target_time = '2024-01-15 10:30:00'
recovery_target_action = 'promote'
EOF

# 4. Create recovery signal
touch /var/lib/postgresql/data/recovery.signal

# 5. Start database
sudo systemctl start postgresql

# 6. Verify
psql -c "SELECT * FROM users WHERE id = 123"
```

### Step 4: Backup Restore
```bash
# Restore from backup

# 1. Stop application
sudo systemctl stop app

# 2. Restore database
pg_restore -d myapp /backups/myapp-2024-01-15.dump

# 3. Verify data
psql -c "SELECT COUNT(*) FROM users"

# 4. Start application
sudo systemctl start app

# 5. Monitor
tail -f /var/log/app/error.log
```

### Step 5: Data Verification
```typescript
// Verify recovered data
async function verifyRecovery() {
  const checks = [
    // Check user count
    { query: 'SELECT COUNT(*) FROM users', expected: 1000 },
    // Check recent records
    { query: 'SELECT MAX(created_at) FROM orders', expected: 'recent' },
    // Check data integrity
    { query: 'SELECT COUNT(*) FROM orders WHERE user_id IS NULL', expected: 0 }
  ];
  
  for (const check of checks) {
    const result = await db.query(check.query);
    if (result !== check.expected) {
      console.error(`Check failed: ${check.query}`);
    }
  }
}
```

### Step 6: Recovery Runbook
```markdown
# Data Recovery Runbook

## Emergency Contacts
- DBA: [phone]
- DevOps: [phone]
- CTO: [phone]

## Recovery Steps
1. Assess damage (5 min)
2. Notify stakeholders (5 min)
3. Choose recovery method (5 min)
4. Execute recovery (varies)
5. Verify data (15 min)
6. Resume operations (5 min)

## Recovery Time Objectives
- RPO: 1 hour (point-in-time)
- RTO: 1 hour (full recovery)

## Recovery Testing
- Monthly: Test restore
- Quarterly: Full DR drill
```

## Output
- Damage assessed
- Recovery method chosen
- Recovery executed
- Data verified
- Runbook documented
