# compliance-audit

Audit compliance with GDPR, HIPAA, SOC2, PCI-DSS requirements.

## When to Use
- Pre-launch compliance check
- Annual compliance audit
- Customer requirements
- Regulatory changes

## Agents to Dispatch
- security-lead: Security compliance
- legal: Legal requirements
- data-officer: Data protection

## Compliance Frameworks

```
FRAMEWORKS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

GDPR (EU Data Protection)
- Data minimization
- Consent management
- Right to be forgotten
- Data portability
- Breach notification (72 hours)

HIPAA (Healthcare)
- PHI encryption
- Access controls
- Audit logging
- Business associate agreements
- Breach notification

SOC 2 (Security)
- Security policies
- Access management
- Change management
- Incident response
- Risk management

PCI DSS (Payments)
- Cardholder data protection
- Encryption
- Access controls
- Monitoring
- Testing
```

## Execution

### Step 1: Run Compliance Check
```bash
# Generate compliance report
npm run compliance:check

# Or manually check
compliance-check --framework gdpr --output report.md
```

### Step 2: Generate Report
```markdown
# Compliance Report: GDPR

## Date: 2024-01-15
## Framework: GDPR

## Summary
- Controls: 47
- Passed: 42
- Failed: 3
- N/A: 2

## Results

### Data Protection ✅
- [x] Data minimization implemented
- [x] Consent management active
- [ ] Right to be forgotten NOT implemented
- [x] Data portability available

### Security ✅
- [x] Encryption at rest
- [x] Encryption in transit
- [x] Access controls
- [x] Audit logging

### Breach Notification ❌
- [ ] 72-hour notification NOT automated
- [x] Incident response plan exists
- [x] Contact list maintained

## Action Items
1. Implement right to be forgotten (Priority: High)
2. Automate breach notification (Priority: High)
3. Review consent forms (Priority: Medium)
```

### Step 3: Fix Non-Compliance
```
FOR EACH failed item:
1. Document the requirement
2. Implement the control
3. Test the control
4. Document evidence
5. Update compliance report
```

### Step 4: Generate Evidence
```markdown
# Compliance Evidence

## GDPR Compliance

### Evidence 1: Consent Management
- File: src/auth/consent.ts
- Description: User consent tracking
- Last tested: 2024-01-15

### Evidence 2: Data Encryption
- Config: database encryption enabled
- Algorithm: AES-256
- Key rotation: Quarterly

### Evidence 3: Audit Logging
- Implementation: Winston logger
- Retention: 1 year
- Access: Security team only
```

### Step 5: Schedule Regular Audits
```yaml
# Compliance Audit Schedule

Daily:
  - Check encryption status
  - Review access logs
  
Weekly:
  - Review user permissions
  - Check backup status
  
Monthly:
  - Full compliance scan
  - Update evidence repository
  
Quarterly:
  - External audit
  - Policy review
  
Annually:
  - Full compliance assessment
  - Penetration testing
```

## Output
- Compliance report generated
- Non-compliance items identified
- Action items documented
- Evidence collected
- Audit schedule created
