# api-design

Design RESTful APIs with proper resource modeling, versioning, and documentation.

## When to Use
- Designing new API endpoints
- Defining API contracts
- Planning API versioning strategy
- Creating OpenAPI specs

## Execution

### Step 1: Discover Resources
```
ASK USER:
1. What entities exist? (users, orders, products)
2. What relationships between them?
3. What operations needed? (CRUD, custom)
4. Who are the consumers? (frontend, mobile, partners)
```

### Step 2: Design Resource Model
```
FOR EACH resource:
- Resource name (plural, lowercase)
- Properties with types
- Relationships (has-many, belongs-to)
- Operations (GET, POST, PUT, PATCH, DELETE)

EXAMPLE:
/users
  GET /api/v1/users          → list users
  GET /api/v1/users/:id      → get user
  POST /api/v1/users         → create user
  PATCH /api/v1/users/:id    → update user
  DELETE /api/v1/users/:id   → delete user

/users/:id/orders
  GET /api/v1/users/:id/orders → user's orders
```

### Step 3: Define Request/Response Schemas
```typescript
// Request types
interface CreateUserRequest {
  name: string;
  email: string;
  password: string;
}

interface UpdateUserRequest {
  name?: string;
  email?: string;
}

// Response types
interface User {
  id: string;
  name: string;
  email: string;
  createdAt: string;
  updatedAt: string;
}

interface PaginatedResponse<T> {
  data: T[];
  pagination: {
    page: number;
    limit: number;
    total: number;
    totalPages: number;
  };
}
```

### Step 4: Design Error Responses
```typescript
interface ErrorResponse {
  error: {
    code: string;
    message: string;
    details?: Record<string, string>;
  };
}

// Error codes
const ERROR_CODES = {
  VALIDATION_ERROR: 'VALIDATION_ERROR',
  NOT_FOUND: 'NOT_FOUND',
  UNAUTHORIZED: 'UNAUTHORIZED',
  FORBIDDEN: 'FORBIDDEN',
  CONFLICT: 'CONFLICT',
  RATE_LIMITED: 'RATE_LIMITED',
};
```

### Step 5: Generate OpenAPI Spec
```yaml
openapi: 3.0.3
info:
  title: API
  version: 1.0.0
paths:
  /users:
    get:
      summary: List users
      parameters:
        - name: page
          in: query
          schema:
            type: integer
            default: 1
      responses:
        '200':
          description: Users list
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PaginatedUsers'
```

## Output
- Resource model documented
- Request/response schemas defined
- OpenAPI spec generated
- Error codes documented
