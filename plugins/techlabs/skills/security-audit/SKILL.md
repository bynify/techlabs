# security-audit

OWASP checklist and dependency scan for security vulnerabilities.

## When to Use

## Agents to Dispatch
- security-engineer: Security review
- lead-engineer: Code review
- Before production releases
- After adding new features
- Periodic security reviews
- Post-incident audits

## Execution

### Step 1: Dependency Scan
```bash
# npm
npm audit
npm audit fix

# Go
govulncheck ./...

# Python
pip-audit

# Docker
trivy image app:latest
```

### Step 2: OWASP Top 10 Checklist
```
CHECK FOR:

1. Broken Access Control
   - [ ] Authorization on all endpoints
   - [ ] No IDOR vulnerabilities
   - [ ] CORS configured correctly

2. Cryptographic Failures
   - [ ] No passwords in plaintext
   - [ ] TLS 1.2+ enforced
   - [ ] Sensitive data encrypted at rest

3. Injection
   - [ ] Parameterized queries (no string concatenation)
   - [ ] Input validation with Zod
   - [ ] Output encoding

4. Insecure Design
   - [ ] Threat modeling done
   - [ ] Security requirements defined

5. Security Misconfiguration
   - [ ] Default credentials changed
   - [ ] Debug mode off in production
   - [ ] Security headers set

6. Vulnerable Components
   - [ ] Dependencies up to date
   - [ ] No known CVEs

7. Auth Failures
   - [ ] Rate limiting on auth endpoints
   - [ ] Brute force protection
   - [ ] Secure password requirements

8. Data Integrity Failures
   - [ ] Signed/verified JWTs
   - [ ] Integrity checks on updates

9. Logging Failures
   - [ ] Auth events logged
   - [ ] No sensitive data in logs

10. SSRF
    - [ ] URLs validated
    - [ ] Internal network blocked
```

### Step 3: Static Analysis
```bash
# TypeScript/JavaScript
npx eslint --rule '{"no-eval": "error"}' src/

# Go
gosec ./...

# Secrets detection
trufflehog filesystem . --only-verified
```

### Step 4: Generate Report
```markdown
# Security Audit Report

## Summary
- Total findings: X
- Critical: X
- High: X
- Medium: X
- Low: X

## Findings

### [CRITICAL] SQL Injection in /api/search
**Location:** src/api/search.ts:42
**Risk:** Database compromise
**Fix:** Use parameterized query
```

## Output
- Dependency scan results
- OWASP checklist status
- SAST results
- Remediation plan
