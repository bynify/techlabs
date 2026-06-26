# api-test

API testing with automated test suites.

## When to Use
- API validation
- Integration testing
- Regression testing
- Pre-deployment checks


## Agents to Dispatch
- api-engineer: API testing
- quality-lead: Test strategy

## Execution

### Step 1: Define Test Cases
```yaml
# Test cases for /api/users
GET /api/users:
  - 200: List users
  - 401: Unauthorized
  - 403: Forbidden

POST /api/users:
  - 201: Create user
  - 400: Validation error
  - 409: Duplicate email

GET /api/users/:id:
  - 200: Get user
  - 404: Not found
```

### Step 2: Write API Tests
```typescript
// tests/api/users.test.ts
import request from 'supertest';
import app from '../../src/app';

describe('Users API', () => {
  let authToken: string;

  beforeEach(async () => {
    const res = await request(app)
      .post('/api/auth/login')
      .send({ email: 'test@example.com', password: 'password' });
    authToken = res.body.token;
  });

  describe('GET /api/users', () => {
    it('should list users', async () => {
      const res = await request(app)
        .get('/api/users')
        .set('Authorization', `Bearer ${authToken}`);
      
      expect(res.status).toBe(200);
      expect(res.body.data).toBeInstanceOf(Array);
    });

    it('should require auth', async () => {
      const res = await request(app)
        .get('/api/users');
      
      expect(res.status).toBe(401);
    });
  });

  describe('POST /api/users', () => {
    it('should create user', async () => {
      const res = await request(app)
        .post('/api/users')
        .set('Authorization', `Bearer ${authToken}`)
        .send({
          name: 'Test User',
          email: 'new@example.com',
          password: 'password123'
        });
      
      expect(res.status).toBe(201);
      expect(res.body.name).toBe('Test User');
    });

    it('should validate email', async () => {
      const res = await request(app)
        .post('/api/users')
        .set('Authorization', `Bearer ${authToken}`)
        .send({
          name: 'Test User',
          email: 'invalid',
          password: 'password123'
        });
      
      expect(res.status).toBe(400);
    });
  });
});
```

### Step 3: Run Tests
```bash
# Run API tests
npm test -- --testPathPattern=api

# Run with coverage
npm test -- --coverage --testPathPattern=api

# Run specific test
npm test -- --testNamePattern="Users API"
```

### Step 4: Generate Report
```markdown
# API Test Report

## Summary
- Tests: 25
- Passed: 24
- Failed: 1
- Coverage: 87%

## Failures
1. POST /api/users - Timeout after 5s
   - Cause: Database slow
   - Fix: Add index

## Coverage by Endpoint
| Endpoint | Tests | Coverage |
|----------|-------|----------|
| GET /api/users | 3 | 100% |
| POST /api/users | 4 | 100% |
| GET /api/users/:id | 3 | 100% |
| PUT /api/users/:id | 4 | 100% |
| DELETE /api/users/:id | 2 | 100% |
```

## Output
- Test cases defined
- API tests written
- Tests executed
- Report generated
