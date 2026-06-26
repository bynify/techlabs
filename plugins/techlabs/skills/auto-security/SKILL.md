# auto-security

Automated security scanning and hardening.

## When to Use
- Pre-deployment checks
- Periodic security audits
- New dependency additions

## Execution

### Step 1: Dependency Scan
```bash
npm audit
govulncheck ./...
pip-audit
```

### Step 2: Secret Detection
```bash
trufflehog filesystem . --only-verified
```

### Step 3: Security Headers
```typescript
app.use(helmet());
app.use(cors({ origin: process.env.ALLOWED_ORIGINS?.split(',') }));
```

### Step 4: Generate Report
```
SECURITY SCAN RESULTS:
- Dependencies: 0 critical, 2 high, 5 moderate
- Secrets: None detected
- Headers: All configured
- OWASP: 9/10 checks passed
```

## Output
- Dependency scan
- Secret detection
- Security headers
- Report
