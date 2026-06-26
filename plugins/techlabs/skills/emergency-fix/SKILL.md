# emergency-fix

Fix critical bug quickly with minimal ceremony.

## When to Use
- Production bug
- Security vulnerability
- Service down
- Critical issue

## What This Does

Chains 4 skills with fast-track:

```
FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STEP 1: /change-request (fast-track)
  → Skip full analysis
  → Classify as emergency
  → Jump to fix

STEP 2: /dispatch-story
  → Route to correct specialist

STEP 3: /dev-story
  → Implement fix

STEP 4: /review-gate (fast-track)
  → Quick security check
  → Skip full QA
  → Deploy immediately
```

## Execution

### Step 1: Classify Emergency
```
ASK USER:
1. What's the issue?
2. How critical? (service down/security/data loss/minor)
3. Current impact?
4. Who reported?

CLASSIFY:
- SERVICE DOWN → P0, immediate
- SECURITY VULNERABILITY → P0, immediate
- DATA LOSS → P0, immediate
- MINOR BUG → P1, can wait
```

### Step 2: Fast-track Change Request
```
SKIP:
- Full impact analysis
- Multiple options consideration
- Stakeholder approval

DO:
- Create emergency story
- Mark as P0
- Assign to specialist immediately
```

### Step 3: Quick Dispatch
```
DETECT:
- What component is affected?
- Who's the right specialist?

DISPATCH:
- Backend issue → go-specialist
- Frontend issue → ui-engineer
- Security issue → security-engineer
- Infrastructure → docker-specialist
```

### Step 4: Implement Fix
```
STORY:
- Title: [Emergency] Fix [issue]
- Points: 1 (always)
- Priority: P0
- Type: hotfix

IMPLEMENT:
- Fix the issue
- Run minimal tests
- Skip full QA
```

### Step 5: Fast-track Review
```
SKIP:
- Full code review
- Comprehensive testing
- Documentation update

DO:
- Security check (if security issue)
- Quick functional test
- Deploy immediately
```

### Step 6: Deploy
```
DEPLOY:
- Hotfix to production
- Monitor for 15 minutes
- Verify fix works

POST-FIX:
- Update changelog
- Notify stakeholders
- Create follow-up story for full fix (if needed)
```

## Output
- Issue fixed
- Hotfix deployed
- Minimal ceremony
- Follow-up story created (if full fix needed)
