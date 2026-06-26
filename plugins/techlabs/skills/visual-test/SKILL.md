# visual-test

Visual regression testing for UI consistency.

## When to Use
- UI changes
- Design updates
- Cross-browser testing
- Responsive testing

## Execution

### Step 1: Setup Visual Testing
```bash
# Install Playwright
npm init playwright@latest

# Or Cypress visual testing
npm install cypress-image-snapshot
```

### Step 2: Create Visual Tests
```typescript
// tests/visual/homepage.spec.ts
import { test, expect } from '@playwright/test';

test('homepage visual test', async ({ page }) => {
  await page.goto('/');
  await expect(page).toHaveScreenshot('homepage.png');
});

test('homepage mobile visual test', async ({ page }) => {
  await page.setViewportSize({ width: 375, height: 812 });
  await page.goto('/');
  await expect(page).toHaveScreenshot('homepage-mobile.png');
});

test('dashboard visual test', async ({ page }) => {
  await page.goto('/dashboard');
  await expect(page).toHaveScreenshot('dashboard.png', {
    maxDiffPixelRatio: 0.01
  });
});
```

### Step 3: Run Visual Tests
```bash
# Update baselines
npx playwright test --update-snapshots

# Run visual tests
npx playwright test --project=visual

# Compare screenshots
npx playwright show-trace trace.zip
```

### Step 4: Review Differences
```markdown
# Visual Test Report

## Changes Detected
| Page | Change | Severity |
|------|--------|----------|
| Homepage | Button color | Minor |
| Dashboard | Layout shift | Major |

## Screenshots
- Baseline: homepage.png
- Current: homepage-current.png
- Diff: homepage-diff.png
```

## Output
- Visual tests created
- Baselines established
- Tests executed
- Differences reviewed
