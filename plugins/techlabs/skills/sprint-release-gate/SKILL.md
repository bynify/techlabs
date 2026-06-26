# sprint-release-gate

Enforce E2E tests, stress tests, and full QA before sprint can be marked done.

## When to Use
- Sprint completion
- Pre-production release
- Quality gate enforcement

## Agents to Dispatch
- quality-lead: Test orchestration
- lead-engineer: Technical verification
- devops-lead: Deployment verification

## Enforcement

```
⚠️ MANDATORY: Sprint cannot be done without passing all gates

SPRINT RELEASE GATES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

GATE 1: E2E Tests
  - All critical user flows tested
  - Cross-browser testing
  - Mobile testing
  - Pass rate: 100%

GATE 2: Stress Tests
  - Load testing passed
  - Performance within limits
  - No memory leaks
  - Response time < 500ms

GATE 3: Security Tests
  - Security audit passed
  - No critical vulnerabilities
  - OWASP compliance

GATE 4: Documentation
  - All tech plans complete
  - All review docs complete
  - All QA reports complete
  - Changelog updated

GATE 5: Deployment Ready
  - Build succeeds
  - Staging deployment works
  - Rollback plan documented

GATE 6: Stakeholder Approval
  - Product owner approval
  - Tech lead approval
```

## Execution

### Step 1: Load Sprint Status
```
CHECK:
- All stories done?
- All documentation complete?
- Any blockers remaining?
```

### Step 2: Run E2E Tests
```javascript
async function runE2ETests() {
  console.log("=== GATE 1: E2E TESTS ===");
  
  const result = await runSkill('e2e-setup', {
    scope: 'all',
    browsers: ['chrome', 'firefox', 'safari'],
    devices: ['desktop', 'mobile']
  });
  
  if (!result.passed) {
    return {
      gate: 'e2e',
      status: 'FAILED',
      failures: result.failures
    };
  }
  
  return {
    gate: 'e2e',
    status: 'PASSED',
    coverage: result.coverage
  };
}
```

### Step 3: Run Stress Tests
```javascript
async function runStressTests() {
  console.log("=== GATE 2: STRESS TESTS ===");
  
  const result = await runSkill('load-test', {
    concurrent: 1000,
    duration: '5m',
    threshold: {
      responseTime: 500,
      errorRate: 0.01
    }
  });
  
  if (!result.passed) {
    return {
      gate: 'stress',
      status: 'FAILED',
      failures: result.failures
    };
  }
  
  return {
    gate: 'stress',
    status: 'PASSED',
    metrics: result.metrics
  };
}
```

### Step 4: Run Security Tests
```javascript
async function runSecurityTests() {
  console.log("=== GATE 3: SECURITY TESTS ===");
  
  const result = await runSkill('security-audit', {
    scope: 'full',
    level: 'critical'
  });
  
  if (result.critical > 0) {
    return {
      gate: 'security',
      status: 'FAILED',
      critical: result.critical
    };
  }
  
  return {
    gate: 'security',
    status: 'PASSED',
    score: result.score
  };
}
```

### Step 5: Verify Documentation
```javascript
async function verifyDocumentation() {
  console.log("=== GATE 4: DOCUMENTATION ===");
  
  const result = await runSkill('sprint-docs', {
    action: 'verify'
  });
  
  if (!result.complete) {
    return {
      gate: 'docs',
      status: 'FAILED',
      missing: result.missing
    };
  }
  
  return {
    gate: 'docs',
    status: 'PASSED',
    complete: true
  };
}
```

### Step 6: Verify Deployment Ready
```javascript
async function verifyDeploymentReady() {
  console.log("=== GATE 5: DEPLOYMENT READY ===");
  
  const result = await runSkill('release-checklist', {
    scope: 'sprint'
  });
  
  if (!result.ready) {
    return {
      gate: 'deployment',
      status: 'FAILED',
      issues: result.issues
    };
  }
  
  return {
    gate: 'deployment',
    status: 'PASSED',
    ready: true
  };
}
```

### Step 7: Get Stakeholder Approval
```javascript
async function getStakeholderApproval() {
  console.log("=== GATE 6: STAKEHOLDER APPROVAL ===");
  
  const approval = await askUser({
    question: "All gates passed. Approve sprint completion?",
    options: [
      "Approve - Sprint done",
      "Reject - Need fixes",
      "Defer to next sprint"
    ]
  });
  
  return {
    gate: 'approval',
    status: approval.includes('Approve') ? 'PASSED' : 'FAILED',
    decision: approval
  };
}
```

### Step 8: Run All Gates
```javascript
async function runSprintReleaseGates() {
  console.log("╔══════════════════════════════════════════╗");
  console.log("║   SPRINT RELEASE GATES - MANDATORY      ║");
  console.log("╚══════════════════════════════════════════╝");
  
  const gates = [
    await runE2ETests(),
    await runStressTests(),
    await runSecurityTests(),
    await verifyDocumentation(),
    await verifyDeploymentReady(),
    await getStakeholderApproval()
  ];
  
  const allPassed = gates.every(g => g.status === 'PASSED');
  
  // Generate report
  const report = {
    sprint: currentSprint,
    date: new Date(),
    gates: gates,
    overallStatus: allPassed ? 'APPROVED' : 'REJECTED',
    timestamp: new Date().toISOString()
  };
  
  // Save report
  await saveToFile(`production/sprint/gates-${currentSprint}.json`, report);
  
  if (allPassed) {
    console.log("\n✅ ALL GATES PASSED - SPRINT APPROVED");
    return true;
  } else {
    console.log("\n❌ GATES FAILED - SPRINT NOT APPROVED");
    const failed = gates.filter(g => g.status === 'FAILED');
    failed.forEach(g => console.log(`  - ${g.gate}: FAILED`));
    return false;
  }
}
```

### Step 9: Generate Gate Report
```markdown
# Sprint Release Gate Report

## Sprint: {sprint-id}
## Date: {date}

## Gate Results

| Gate | Status | Details |
|------|--------|---------|
| E2E Tests | ✅ PASSED | 45/45 tests passing |
| Stress Tests | ✅ PASSED | 1000 concurrent, <500ms |
| Security | ✅ PASSED | 0 critical vulnerabilities |
| Documentation | ✅ PASSED | All docs complete |
| Deployment | ✅ PASSED | Build succeeds, staging works |
| Approval | ✅ PASSED | Product owner approved |

## Overall: ✅ SPRINT APPROVED

## Metrics
- Test coverage: 87%
- Performance score: 92/100
- Security score: 95/100
- Documentation score: 100%

## Next Steps
1. Deploy to staging
2. Final smoke test
3. Deploy to production
4. Monitor for issues
```

## Output
- All gates executed
- Gate report generated
- Sprint approved/rejected
- Next steps defined
