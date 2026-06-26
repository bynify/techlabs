# e2e-setup

Setup end-to-end testing framework with Cypress or Playwright.

## When to Use
- New project setup
- Critical user flows
- Regression testing
- CI/CD integration

## Agents to Dispatch
- lead-engineer: Test architecture
- quality-lead: Test strategy

## Execution

### Step 1: Choose Framework
```
FRAMEWORK COMPARISON:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Cypress:
- Easy setup
- Great debugging
- Good for SPA
- Limited multi-tab

Playwright:
- Multi-browser
- Multi-tab support
- API testing
- Faster execution
```

### Step 2: Install & Configure
```bash
# Cypress
npm install -D cypress
npx cypress open

# Playwright
npm init playwright@latest
```

### Step 3: Create Test Structure
```
tests/
├── e2e/
│   ├── auth/
│   │   ├── login.cy.ts
│   │   ├── signup.cy.ts
│   │   └── logout.cy.ts
│   ├── dashboard/
│   │   └── dashboard.cy.ts
│   └── api/
│       └── users.cy.ts
├── fixtures/
│   └── users.json
└── support/
    ├── commands.ts
    └── e2e.ts
```

### Step 4: Write Example Tests
```typescript
// tests/e2e/auth/login.cy.ts
describe('Login', () => {
  beforeEach(() => {
    cy.visit('/login');
  });

  it('should login with valid credentials', () => {
    cy.get('[data-cy="email"]').type('user@example.com');
    cy.get('[data-cy="password"]').type('password123');
    cy.get('[data-cy="submit"]').click();
    
    cy.url().should('include', '/dashboard');
    cy.get('[data-cy="user-menu"]').should('exist');
  });

  it('should show error for invalid credentials', () => {
    cy.get('[data-cy="email"]').type('wrong@example.com');
    cy.get('[data-cy="password"]').type('wrongpassword');
    cy.get('[data-cy="submit"]').click();
    
    cy.get('[data-cy="error"]').should('contain', 'Invalid credentials');
  });
});
```

### Step 5: Configure CI/CD
```yaml
# .github/workflows/e2e.yml
name: E2E Tests

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  e2e:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Start application
        run: npm run dev &
      
      - name: Wait for app
        run: npx wait-on http://localhost:3000
      
      - name: Run E2E tests
        run: npx playwright test
      
      - name: Upload results
        if: failure()
        uses: actions/upload-artifact@v4
        with:
          name: playwright-report
          path: playwright-report/
```

### Step 6: Best Practices
```markdown
# E2E Testing Best Practices

## Test Structure
- One test per user flow
- Use data-cy attributes for selectors
- Avoid brittle selectors (CSS classes)
- Use page object pattern

## Test Data
- Use fixtures for test data
- Clean up after tests
- Use unique data per test
- Mock external services

## CI/CD
- Run on every PR
- Parallelize tests
- Use artifacts for debugging
- Set appropriate timeouts
```

## Output
- Test framework installed
- Test structure created
- Example tests written
- CI/CD configured
- Best practices documented
