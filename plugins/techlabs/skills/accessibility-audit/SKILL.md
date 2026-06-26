# accessibility-audit

WCAG 2.1 AA compliance audit with automated and manual testing.

## When to Use
- Pre-launch checks
- Compliance requirements
- User complaints about a11y

## Execution

### Step 1: Automated Scan
```bash
# Lighthouse
npx lighthouse https://example.com --only-categories=accessibility

# axe-core
npx @axe-core/cli https://example.com
```

### Step 2: Manual Checklist
```
KEYBOARD:
- [ ] All interactive elements focusable
- [ ] Focus order logical
- [ ] Skip navigation link
- [ ] No keyboard traps
- [ ] Visible focus indicators

SCREEN READER:
- [ ] All images have alt text
- [ ] Form inputs have labels
- [ ] ARIA landmarks used
- [ ] Dynamic content announced

VISUAL:
- [ ] Color contrast ≥ 4.5:1
- [ ] Text resizable to 200%
- [ ] No information by color alone
```

### Step 3: Generate Report
```markdown
# Accessibility Audit Report

## Score: 85/100

### Critical Issues (3)
1. Missing alt text on hero image
2. Form inputs without labels
3. Color contrast fails on footer links

### Recommendations
1. Add descriptive alt text
2. Associate labels with inputs
3. Darken footer link colors
```

## Output
- Audit report
- Issue list with severity
- Remediation plan
