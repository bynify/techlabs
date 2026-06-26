# e2e-setup

End-to-end testing with Playwright or Cypress.

## When to Use
- Critical path testing
- Regression prevention
- CI integration

## Execution

### Step 1: Setup Playwright
```bash
npm init playwright@latest
```

### Step 2: Write Tests
```typescript
// tests/e2e/auth.spec.ts
import { test, expect } from '@playwright/test';

test('user can login', async ({ page }) => {
  await page.goto('/login');
  await page.fill('[name=email]', 'user@example.com');
  await page.fill('[name=password]', 'password123');
  await page.click('button[type=submit]');
  await expect(page).toHaveURL('/dashboard');
});

test('user sees error on invalid credentials', async ({ page }) => {
  await page.goto('/login');
  await page.fill('[name=email]', 'wrong@example.com');
  await page.fill('[name=password]', 'wrong');
  await page.click('button[type=submit]');
  await expect(page.locator('.error')).toBeVisible();
});
```

### Step 3: CI Config
```yaml
# .github/workflows/e2e.yml
- name: Run E2E tests
  run: npx playwright test
- name: Upload results
  if: always()
  uses: actions/upload-artifact@v4
  with:
    name: playwright-report
    path: playwright-report/
```

## Output
- Playwright setup
- Test suite
- CI configuration
- Report artifacts
