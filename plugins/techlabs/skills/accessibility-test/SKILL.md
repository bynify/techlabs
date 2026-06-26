# accessibility-test

Automated accessibility testing with axe-core and Playwright.

## Execution

### Step 1: Setup
```typescript
import AxeBuilder from '@axe-core/playwright';

export async function runA11yTest(page) {
  const results = await new AxeBuilder({ page })
    .withTags(['wcag2a', 'wcag2aa', 'wcag21aa'])
    .analyze();
  return results;
}
```

### Step 2: Test Suite
```typescript
test('homepage accessible', async ({ page }) => {
  await page.goto('/');
  const results = await runA11yTest(page);
  expect(results.violations).toEqual([]);
});
```

### Step 3: CI Integration
```yaml
- run: npx playwright test tests/a11y/
```

## Output
- axe-core setup
- Test suite
- CI config
