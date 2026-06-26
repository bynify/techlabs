# backup-plan

Create database and system backup strategy with automated backups.

## When to Use
- New project setup
- Production deployment
- Disaster recovery planning
- Data protection compliance

## Agents to Dispatch
- devops-lead: Backup infrastructure
- database-specialist: Database backups
- security-lead: Data encryption

## Execution

### Step 1: Identify Backup Requirements
```
ASK USER:
1. What needs backup?
   - Database (PostgreSQL, MySQL, Redis)
   - Files (uploads, media)
   - Configuration (env, secrets)
   - Application state

2. Backup frequency?
   - Real-time (continuous)
   - Hourly
   - Daily
   - Weekly

3. Retention policy?
   - How long to keep backups?
   - Legal requirements?
   - Compliance needs?

4. Recovery requirements?
   - RPO (Recovery Point Objective)?
   - RTO (Recovery Time Objective)?
```

### Step 2: Database Backup Strategy
```yaml
# PostgreSQL Backup Strategy

## Automated Daily Backup
```bash
#!/bin/bash
# backup-postgres.sh

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backups/postgres"
DB_NAME="myapp"

# Create backup
pg_dump -Fc $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.dump

# Compress
gzip $BACKUP_DIR/$DB_NAME-$DATE.dump

# Upload to S3/R2
aws s3 cp $BACKUP_DIR/$DB_NAME-$DATE.dump.gz s3://backups/postgres/

# Cleanup old backups (keep 30 days)
find $BACKUP_DIR -mtime +30 -delete
```

## Point-in-Time Recovery (WAL Archiving)
```postgresql
-- Enable WAL archiving
ALTER SYSTEM SET archive_mode = on;
ALTER SYSTEM SET archive_command = 'cp %p /backups/wal/%f';
ALTER SYSTEM SET wal_level = replica;
```
```

### Step 3: Redis Backup Strategy
```yaml
# Redis Backup

## RDB Snapshots
```
save 900 1
save 300 10
save 60 10000

dbfilename dump.rdb
dir /var/lib/redis
```

## AOF (Append Only File)
```
appendonly yes
appendfsync everysec
```

## Backup Script
```bash
#!/bin/bash
# backup-redis.sh

DATE=$(date +%Y%m%d_%H%M%S)
REDIS_CLI="redis-cli"

# Trigger BGSAVE
$REDIS_CLI BGSAVE

# Wait for completion
sleep 5

# Copy RDB file
cp /var/lib/redis/dump.rdb /backups/redis/redis-$DATE.rdb

# Upload to S3/R2
aws s3 cp /backups/redis/redis-$DATE.rdb s3://backups/redis/
```
```

### Step 4: File Backup Strategy
```yaml
# File Backup (uploads, media)

## Rclone Backup
```bash
#!/bin/bash
# backup-files.sh

DATE=$(date +%Y%m%d_%H%M%S)

# Sync uploads to R2
rclone sync /app/uploads r2:backups/uploads-$DATE

# Sync configuration
rclone sync /app/config r2:backups/config-$DATE
```

## Cron Schedule
```bash
# Daily backup at 2 AM
0 2 * * * /scripts/backup-files.sh

# Weekly full backup
0 3 * * 0 /scripts/backup-files-full.sh
```
```

### Step 5: Backup Monitoring
```yaml
# Backup Monitoring

## Check Backup Status
```bash
#!/bin/bash
# check-backups.sh

LATEST_BACKUP=$(ls -t /backups/postgres/*.dump.gz | head -1)
BACKUP_AGE=$(($(date +%s) - $(stat -c %Y "$LATEST_BACKUP")))

if [ $BACKUP_AGE -gt 86400 ]; then
  echo "ALERT: Backup older than 24 hours"
  # Send alert
fi
```

## Alert Rules
```yaml
groups:
  - name: backup-alerts
    rules:
      - alert: BackupMissing
        expr: time() - backup_last_success_timestamp > 86400
        for: 1h
        labels:
          severity: critical
        annotations:
          summary: "Backup missing for 24 hours"
          
      - alert: BackupFailed
        expr: backup_last_status == 0
        for: 5m
        labels:
          severity: critical
```
```

### Step 6: Backup Documentation
```markdown
# Backup Plan: [Project Name]

## Database Backups
- **Type:** PostgreSQL
- **Frequency:** Daily at 2 AM
- **Retention:** 30 days
- **Location:** S3/R2 bucket

## File Backups
- **Type:** Uploads, Config
- **Frequency:** Daily at 3 AM
- **Retention:** 90 days
- **Location:** R2 bucket

## Recovery Procedures
- RPO: 24 hours
- RTO: 1 hour

## Contacts
- DBA: [name]
- DevOps: [name]
```

## Output
- Backup strategy documented
- Backup scripts created
- Cron jobs configured
- Monitoring alerts set
- Recovery procedures documented
