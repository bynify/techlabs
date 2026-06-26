# api-test

Create comprehensive API tests with unit, integration, and contract tests.

## When to Use
- Testing API endpoints
- Validating request/response contracts
- Checking error handling
- Load testing preparation

## Execution

### Step 1: Identify Endpoints
```
SCAN:
- src/api/ or src/routes/ for handlers
- OpenAPI spec for endpoints
- Existing test patterns
```

### Step 2: Create Unit Tests
```typescript
// src/api/__tests__/users.test.ts
import { describe, it, expect } from 'vitest';
import { createUserHandler } from '../users/handler';
import { mockDB } from './mocks';

describe('POST /users', () => {
  it('should create user with valid data', async () => {
    const req = { name: 'Test', email: 'test@example.com' };
    const response = await createUserHandler(req, mockDB);
    expect(response.status).toBe(201);
    expect(response.body).toHaveProperty('id');
  });

  it('should reject duplicate email', async () => {
    mockDB.findUserByEmail.mockResolvedValue({ id: '1' });
    const req = { name: 'Test', email: 'existing@example.com' };
    const response = await createUserHandler(req, mockDB);
    expect(response.status).toBe(409);
  });
});
```

### Step 3: Create Integration Tests
```typescript
import { describe, it, expect, beforeAll, afterAll } from 'vitest';
import { createApp } from '../app';

let app: ReturnType<typeof createApp>;

beforeAll(async () => {
  app = await createApp({ db: testDB });
});

describe('Users API', () => {
  it('should create and retrieve user', async () => {
    const createRes = await app.inject({
      method: 'POST',
      url: '/api/v1/users',
      payload: { name: 'Test', email: 'test@example.com' },
    });
    expect(createRes.statusCode).toBe(201);
    
    const { id } = createRes.json();
    const getRes = await app.inject({ method: 'GET', url: `/api/v1/users/${id}` });
    expect(getRes.statusCode).toBe(200);
    expect(getRes.json().name).toBe('Test');
  });
});
```

### Step 4: Add Contract Tests
```typescript
import { Pact } from '@pact-foundation/pact';

describe('API Contract', () => {
  it('should match expected response format', async () => {
    const provider = new Pact({ consumer: 'Frontend', provider: 'API' });
    await provider.addInteraction({
      state: 'user exists',
      uponReceiving: 'GET /users/123',
      withRequest: { method: 'GET', path: '/api/v1/users/123' },
      willRespondWith: {
        status: 200,
        body: { id: '123', name: 'Test' },
      },
    });
    // Test against pact
  });
});
```

### Step 5: Validate Error Paths
```
TEST FOR EACH endpoint:
- Missing required fields → 400
- Invalid data format → 400
- Resource not found → 404
- Unauthorized access → 401
- Forbidden action → 403
- Rate limit exceeded → 429
```

## Output
- Unit tests for handlers
- Integration tests for full flow
- Contract tests for consumers
- Error path coverage
