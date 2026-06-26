# api-docs

Generate and maintain API documentation with OpenAPI/Swagger.

## When to Use
- API documentation
- Developer onboarding
- Partner integration
- API versioning

## Agents to Dispatch
- api-engineer: API documentation
- lead-engineer: Documentation standards

## Execution

### Step 1: Define API Structure
```yaml
# openapi.yaml
openapi: 3.0.3
info:
  title: API
  version: 1.0.0
  description: |
    # API Documentation
    
    ## Authentication
    All endpoints require JWT token.
    
    ## Rate Limiting
    - 100 requests/minute
    - 1000 requests/hour

paths:
  /users:
    get:
      summary: List users
      tags: [Users]
      parameters:
        - name: page
          in: query
          schema:
            type: integer
            default: 1
        - name: limit
          in: query
          schema:
            type: integer
            default: 10
      responses:
        '200':
          description: Users list
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UserList'
```

### Step 2: Generate Documentation
```bash
# Using Swagger UI
npm install swagger-ui-express
npx swagger-jsdoc -o swagger.json

# Using Redoc
npx @redocly/cli build-docs openapi.yaml

# Using Stoplight
npx @stoplight/spectral-cli lint openapi.yaml
```

### Step 3: Create Endpoints
```typescript
// api-docs endpoint
app.get('/api-docs', (req, res) => {
  res.sendFile('swagger-ui.html');
});

// OpenAPI JSON
app.get('/api-docs.json', (req, res) => {
  res.json(swaggerSpec);
});
```

### Step 4: Document Examples
```yaml
# Request example
requestBody:
  content:
    application/json:
      example:
        name: John Doe
        email: john@example.com
        password: securePassword123

# Response example
responses:
  '200':
    content:
      application/json:
        example:
          id: 1
          name: John Doe
          email: john@example.com
          createdAt: 2024-01-15T00:00:00Z
```

### Step 5: API Versioning
```yaml
# Version strategy
/openapi.yaml (current version)
/openapi/v1.yaml (v1)
/openapi/v2.yaml (v2)

# URL versioning
/api/v1/users
/api/v2/users

# Header versioning
Accept: application/vnd.api.v1+json
```

### Step 6: Documentation Standards
```markdown
# API Documentation Standards

## Endpoint Documentation
- Summary (1 line)
- Description (1-2 sentences)
- Tags (category)
- Parameters (with examples)
- Request body (with schema)
- Response (with examples)
- Error responses
- Rate limits
- Authentication requirements

## Naming Conventions
- Resources: plural nouns (users, orders)
- Actions: verbs (create, update, delete)
- Filtering: query params (?status=active)
- Pagination: page, limit
```

## Output
- OpenAPI spec created
- Swagger UI configured
- Documentation hosted
- Versioning strategy
- Documentation standards
