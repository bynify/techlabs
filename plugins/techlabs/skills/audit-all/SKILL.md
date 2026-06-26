# audit-all

Run comprehensive audit across security, performance, compliance, and code.

## When to Use
- Pre-launch audit
- Regular health check
- Security assessment
- Compliance verification

## What This Does

Chains 4 audit skills:

```
FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STEP 1: /security-audit
  → Security vulnerabilities
  → OWASP compliance

STEP 2: /perf-audit
  → Performance bottlenecks
  → Optimization opportunities

STEP 3: /compliance-audit
  → GDPR/HIPAA/SOC2 compliance
  → Audit trail

STEP 4: /code-review
  → Code quality
  → Best practices
```

## Execution

### Step 1: Security Audit
```
RUN /security-audit

CHECK:
- [ ] No hardcoded secrets
- [ ] Input validation
- [ ] Authentication
- [ ] Authorization
- [ ] OWASP Top 10

REPORT:
- Critical: X
- High: X
- Medium: X
- Low: X

CHECKPOINT:
"Security audit complete. Continue to performance?"
```

### Step 2: Performance Audit
```
RUN /perf-audit

CHECK:
- [ ] Response times
- [ ] Database queries
- [ ] Memory usage
- [ ] CPU usage
- [ ] Bundle size

REPORT:
- Response time: Xms
- Slow queries: X
- Memory leaks: X

CHECKPOINT:
"Performance audit complete. Continue to compliance?"
```

### Step 3: Compliance Audit
```
RUN /compliance-audit

CHECK:
- [ ] Data protection
- [ ] Privacy policy
- [ ] Consent management
- [ ] Audit logging
- [ ] Data retention

REPORT:
- GDPR: X/100
- HIPAA: X/100
- SOC2: X/100

CHECKPOINT:
"Compliance audit complete. Continue to code review?"
```

### Step 4: Code Review
```
RUN /code-review

CHECK:
- [ ] Code quality
- [ ] Best practices
- [ ] Documentation
- [ ] Test coverage
- [ ] Type safety

REPORT:
- Quality score: X/100
- Issues found: X

CHECKPOINT:
"All audits complete. Show summary?"
```

### Step 5: Generate Summary
```markdown
# Comprehensive Audit Report

## Date: 2024-01-15

## Overall Score: 82/100

## Audit Results

| Audit | Score | Critical | High | Medium | Low |
|-------|-------|----------|------|--------|-----|
| Security | 85/100 | 0 | 1 | 3 | 5 |
| Performance | 78/100 | 0 | 2 | 4 | 2 |
| Compliance | 80/100 | 0 | 1 | 2 | 3 |
| Code Review | 85/100 | 0 | 0 | 2 | 4 |

## Critical Issues
1. [Security] SQL injection vulnerability
   - File: src/api/users.ts
   - Fix: Use parameterized queries

## High Priority Issues
1. [Security] Missing rate limiting
2. [Performance] N+1 query detected
3. [Compliance] Missing audit log

## Recommendations
1. Fix critical issues before launch
2. Address high priority within 1 week
3. Schedule medium priority fixes
4. Low priority can wait

## Next Steps
1. Fix critical issues
2. Re-run audit
3. Deploy to production
```

## Output
- Security audit complete
- Performance audit complete
- Compliance audit complete
- Code review complete
- Summary report generated
