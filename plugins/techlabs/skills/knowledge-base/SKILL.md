# knowledge-base

Build comprehensive knowledge base from latest documentation for project stack.

## When to Use
- After stack selection
- Before development starts
- When agents need documentation
- When stack updates available

## Agents to Dispatch
- technical-director: Knowledge validation
- security-lead: Security knowledge
- performance-lead: Performance knowledge

## Enforcement

```
⚠️ MANDATORY: Knowledge base must be built before development

KNOWLEDGE BASE ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

KNOWLEDGE BASE MUST INCLUDE:
1. Backend Documentation
   - Language documentation (Go/Python/Node/Rust)
   - Framework documentation
   - Best practices
   - Common patterns
   - Error handling
   - Testing patterns

2. Frontend Documentation
   - Framework documentation (Next.js/React/Vue/Svelte)
   - Component patterns
   - State management
   - Routing
   - Styling
   - Testing

3. Database Documentation
   - Database documentation (PostgreSQL/MongoDB/Redis)
   - Schema design
   - Query optimization
   - Indexing
   - Backup/Recovery
   - Security

4. Infrastructure Documentation
   - Cloud platform (Cloudflare/AWS/GCP)
   - Deployment (Docker/K8s)
   - CI/CD
   - Monitoring
   - Logging
   - Security

5. Security Documentation
   - Authentication patterns
   - Authorization patterns
   - Data protection
   - Compliance
   - Best practices

6. Performance Documentation
   - Caching strategies
   - Load balancing
   - Database optimization
   - API optimization
   - Monitoring

MUST BE:
- Latest documentation (not outdated)
- Comprehensive (not summary)
- Specific to stack (not generic)
- Processed (not raw search results)
- Organized (easy to find)
- Final (ready to use)

BLOCK IF:
- Documentation outdated
- Documentation incomplete
- Documentation too generic
- Documentation not processed
```

## Execution

### Step 1: Load Project Context
```
READ:
- docs/stack-reference/backend-stack.md
- docs/stack-reference/frontend-stack.md
- docs/stack-reference/frontend-deployment.md
- production/project-context.json

EXTRACT:
- Backend stack (Go/Python/Node/Rust)
- Frontend stack (Next.js/React/Vue/Svelte)
- Database (PostgreSQL/MongoDB/Redis)
- Messaging (Kafka/RabbitMQ/NATS)
- Infrastructure (Cloudflare/AWS/GCP)
- Authentication (JWT/OAuth/Session)
```

### Step 2: Search Documentation (TOOL CALLS)
```
FOR EACH STACK COMPONENT:

1. BACKEND DOCUMENTATION
   ┌─────────────────────────────────────────────────────────┐
   │ IF Go:                                                    │
   │ - Search: "Go 1.22 documentation"                        │
   │ - Search: "Go best practices 2024"                       │
   │ - Search: "Go project structure"                         │
   │ - Search: "Go error handling patterns"                   │
   │ - Search: "Go testing best practices"                    │
   │ - Search: "Go concurrency patterns"                      │
   │                                                          │
   │ IF Python:                                                │
   │ - Search: "Python 3.12 documentation"                    │
   │ - Search: "FastAPI best practices"                       │
   │ - Search: "Python project structure"                     │
   │ - Search: "Python error handling"                        │
   │ - Search: "Python testing pytest"                        │
   │                                                          │
   │ IF Node.js:                                               │
   │ - Search: "Node.js 22 documentation"                     │
   │ - Search: "Express.js best practices"                    │
   │ - Search: "Node.js project structure"                    │
   │ - Search: "Node.js error handling"                       │
   │ - Search: "Node.js testing Jest"                         │
   │                                                          │
   │ IF Rust:                                                  │
   │ - Search: "Rust 2024 documentation"                      │
   │ - Search: "Rust best practices"                          │
   │ - Search: "Rust project structure"                       │
   │ - Search: "Rust error handling"                          │
   │ - Search: "Rust testing"                                 │
   └─────────────────────────────────────────────────────────┘

2. FRONTEND DOCUMENTATION
   ┌─────────────────────────────────────────────────────────┐
   │ IF Next.js:                                               │
   │ - Search: "Next.js 14 documentation"                     │
   │ - Search: "Next.js app router"                           │
   │ - Search: "Next.js server components"                    │
   │ - Search: "Next.js best practices"                       │
   │ - Search: "Next.js testing"                              │
   │                                                          │
   │ IF React:                                                 │
   │ - Search: "React 18 documentation"                       │
   │ - Search: "React hooks"                                  │
   │ - Search: "React best practices"                         │
   │ - Search: "React testing"                                │
   │                                                          │
   │ IF Vue:                                                   │
   │ - Search: "Vue 3 documentation"                          │
   │ - Search: "Vue composition API"                          │
   │ - Search: "Vue best practices"                           │
   │                                                          │
   │ IF Svelte:                                                │
   │ - Search: "Svelte 5 documentation"                       │
   │ - Search: "SvelteKit"                                    │
   │ - Search: "Svelte best practices"                        │
   └─────────────────────────────────────────────────────────┘

3. DATABASE DOCUMENTATION
   ┌─────────────────────────────────────────────────────────┐
   │ IF PostgreSQL:                                            │
   │ - Search: "PostgreSQL 16 documentation"                  │
   │ - Search: "PostgreSQL best practices"                    │
   │ - Search: "PostgreSQL indexing"                          │
   │ - Search: "PostgreSQL query optimization"                │
   │ - Search: "PostgreSQL security"                          │
   │                                                          │
   │ IF MongoDB:                                               │
   │ - Search: "MongoDB 7 documentation"                      │
   │ - Search: "MongoDB best practices"                       │
   │ - Search: "MongoDB schema design"                        │
   │ - Search: "MongoDB indexing"                             │
   │                                                          │
   │ IF Redis:                                                 │
   │ - Search: "Redis 7 documentation"                        │
   │ - Search: "Redis best practices"                         │
   │ - Search: "Redis data structures"                        │
   │ - Search: "Redis caching patterns"                       │
   └─────────────────────────────────────────────────────────┘

4. INFRASTRUCTURE DOCUMENTATION
   ┌─────────────────────────────────────────────────────────┐
   │ IF Cloudflare:                                            │
   │ - Search: "Cloudflare Workers documentation"             │
   │ - Search: "Cloudflare D1 database"                       │
   │ - Search: "Cloudflare R2 storage"                        │
   │ - Search: "Cloudflare KV"                                │
   │ - Search: "Cloudflare Durable Objects"                   │
   │                                                          │
   │ IF AWS:                                                   │
   │ - Search: "AWS Lambda documentation"                     │
   │ - Search: "AWS RDS"                                      │
   │ - Search: "AWS S3"                                       │
   │ - Search: "AWS best practices"                           │
   │                                                          │
   │ IF Docker:                                                │
   │ - Search: "Docker best practices"                        │
   │ - Search: "Docker multi-stage builds"                    │
   │ - Search: "Docker security"                              │
   │                                                          │
   │ IF Kubernetes:                                            │
   │ - Search: "Kubernetes best practices"                    │
   │ - Search: "Kubernetes deployment"                        │
   │ - Search: "Kubernetes security"                          │
   └─────────────────────────────────────────────────────────┘

5. SECURITY DOCUMENTATION
   ┌─────────────────────────────────────────────────────────┐
   │ - Search: "JWT best practices 2024"                      │
   │ - Search: "OAuth 2.0 documentation"                      │
   │ - Search: "OWASP Top 10 2024"                            │
   │ - Search: "API security best practices"                  │
   │ - Search: "Data encryption best practices"               │
   │ - Search: "GDPR compliance"                              │
   │ - Search: "SOC2 compliance"                              │
   └─────────────────────────────────────────────────────────┘

6. PERFORMANCE DOCUMENTATION
   ┌─────────────────────────────────────────────────────────┐
   │ - Search: "API performance optimization"                 │
   │ - Search: "Database query optimization"                  │
   │ - Search: "Caching strategies"                           │
   │ - Search: "Load balancing"                               │
   │ - Search: "CDN best practices"                           │
   │ - Search: "Monitoring and observability"                 │
   └─────────────────────────────────────────────────────────┘
```

### Step 3: Process Documentation
```javascript
async function processDocumentation(rawDocs) {
  const processed = {
    backend: {},
    frontend: {},
    database: {},
    infrastructure: {},
    security: {},
    performance: {}
  };
  
  // Process backend docs
  for (const doc of rawDocs.backend) {
    processed.backend[doc.topic] = {
      title: doc.title,
      content: doc.content,
      version: doc.version,
      lastUpdated: doc.lastUpdated,
      keyPoints: extractKeyPoints(doc),
      examples: extractExamples(doc),
      bestPractices: extractBestPractices(doc),
      commonPatterns: extractCommonPatterns(doc),
      errorHandling: extractErrorHandling(doc),
      testing: extractTesting(doc)
    };
  }
  
  // Process frontend docs
  for (const doc of rawDocs.frontend) {
    processed.frontend[doc.topic] = {
      title: doc.title,
      content: doc.content,
      version: doc.version,
      lastUpdated: doc.lastUpdated,
      keyPoints: extractKeyPoints(doc),
      examples: extractExamples(doc),
      bestPractices: extractBestPractices(doc),
      components: extractComponents(doc),
      patterns: extractPatterns(doc)
    };
  }
  
  // Process database docs
  for (const doc of rawDocs.database) {
    processed.database[doc.topic] = {
      title: doc.title,
      content: doc.content,
      version: doc.version,
      lastUpdated: doc.lastUpdated,
      keyPoints: extractKeyPoints(doc),
      schemaDesign: extractSchemaDesign(doc),
      indexing: extractIndexing(doc),
      optimization: extractOptimization(doc),
      security: extractSecurity(doc)
    };
  }
  
  // Process infrastructure docs
  for (const doc of rawDocs.infrastructure) {
    processed.infrastructure[doc.topic] = {
      title: doc.title,
      content: doc.content,
      version: doc.version,
      lastUpdated: doc.lastUpdated,
      keyPoints: extractKeyPoints(doc),
      deployment: extractDeployment(doc),
      security: extractSecurity(doc),
      monitoring: extractMonitoring(doc)
    };
  }
  
  // Process security docs
  for (const doc of rawDocs.security) {
    processed.security[doc.topic] = {
      title: doc.title,
      content: doc.content,
      version: doc.version,
      lastUpdated: doc.lastUpdated,
      keyPoints: extractKeyPoints(doc),
      patterns: extractPatterns(doc),
      compliance: extractCompliance(doc),
      bestPractices: extractBestPractices(doc)
    };
  }
  
  // Process performance docs
  for (const doc of rawDocs.performance) {
    processed.performance[doc.topic] = {
      title: doc.title,
      content: doc.content,
      version: doc.version,
      lastUpdated: doc.lastUpdated,
      keyPoints: extractKeyPoints(doc),
      strategies: extractStrategies(doc),
      monitoring: extractMonitoring(doc),
      optimization: extractOptimization(doc)
    };
  }
  
  return processed;
}

function extractKeyPoints(doc) {
  // Extract key points from documentation
  return doc.sections
    .filter(section => section.importance === 'high')
    .map(section => section.keyPoint);
}

function extractExamples(doc) {
  // Extract code examples
  return doc.examples || [];
}

function extractBestPractices(doc) {
  // Extract best practices
  return doc.bestPractices || [];
}

function extractCommonPatterns(doc) {
  // Extract common patterns
  return doc.patterns || [];
}

function extractErrorHandling(doc) {
  // Extract error handling patterns
  return doc.errorHandling || [];
}

function extractTesting(doc) {
  // Extract testing patterns
  return doc.testing || [];
}
```

### Step 4: Create Knowledge Base Structure
```
CREATE DIRECTORY:
- production/knowledge-base/
  - backend/
    - {language}.md
    - {framework}.md
    - best-practices.md
    - patterns.md
    - error-handling.md
    - testing.md
  - frontend/
    - {framework}.md
    - components.md
    - state-management.md
    - routing.md
    - styling.md
    - testing.md
  - database/
    - {database}.md
    - schema-design.md
    - indexing.md
    - optimization.md
    - security.md
  - infrastructure/
    - {platform}.md
    - deployment.md
    - monitoring.md
    - security.md
  - security/
    - authentication.md
    - authorization.md
    - data-protection.md
    - compliance.md
    - best-practices.md
  - performance/
    - caching.md
    - load-balancing.md
    - optimization.md
    - monitoring.md
  - README.md (index)
```

### Step 5: Generate Knowledge Base Documents
```markdown
# Backend: {Language}

## Version
{version}

## Last Updated
{date}

## Overview
{overview of the language/framework}

## Key Features
- Feature 1: {description}
- Feature 2: {description}
- Feature 3: {description}

## Project Structure
```
{project structure}
```

## Best Practices

### Practice 1: {name}
**Description:** {description}

**Example:**
```{language}
{code example}
```

**When to use:** {scenario}

### Practice 2: {name}
**Description:** {description}

**Example:**
```{language}
{code example}
```

**When to use:** {scenario}

## Common Patterns

### Pattern 1: {name}
**Description:** {description}

**Implementation:**
```{language}
{code example}
```

**Use case:** {scenario}

### Pattern 2: {name}
**Description:** {description}

**Implementation:**
```{language}
{code example}
```

**Use case:** {scenario}

## Error Handling

### Error Type 1: {name}
**Description:** {description}

**Handling:**
```{language}
{code example}
```

**Best practice:** {description}

### Error Type 2: {name}
**Description:** {description}

**Handling:**
```{language}
{code example}
```

**Best practice:** {description}

## Testing

### Unit Testing
**Framework:** {framework}

**Example:**
```{language}
{test example}
```

**Best practices:**
- Best practice 1: {description}
- Best practice 2: {description}

### Integration Testing
**Framework:** {framework}

**Example:**
```{language}
{test example}
```

**Best practices:**
- Best practice 1: {description}
- Best practice 2: {description}

## Performance Tips
- Tip 1: {description}
- Tip 2: {description}
- Tip 3: {description}

## Security Considerations
- Consideration 1: {description}
- Consideration 2: {description}
- Consideration 3: {description}

## Resources
- Official Documentation: {url}
- Best Practices Guide: {url}
- Community Resources: {url}
```

### Step 6: Create README Index
```markdown
# Knowledge Base

## Overview
This knowledge base contains comprehensive documentation for the project stack.

## Last Updated
{date}

## Stack Components

### Backend
| Component | Version | Documentation |
|-----------|---------|---------------|
| {language} | {version} | [Link](backend/{language}.md) |
| {framework} | {version} | [Link](backend/{framework}.md) |

### Frontend
| Component | Version | Documentation |
|-----------|---------|---------------|
| {framework} | {version} | [Link](frontend/{framework}.md) |

### Database
| Component | Version | Documentation |
|-----------|---------|---------------|
| {database} | {version} | [Link](database/{database}.md) |

### Infrastructure
| Component | Version | Documentation |
|-----------|---------|---------------|
| {platform} | {version} | [Link](infrastructure/{platform}.md) |

## Topics

### Security
- [Authentication](security/authentication.md)
- [Authorization](security/authorization.md)
- [Data Protection](security/data-protection.md)
- [Compliance](security/compliance.md)
- [Best Practices](security/best-practices.md)

### Performance
- [Caching](performance/caching.md)
- [Load Balancing](performance/load-balancing.md)
- [Optimization](performance/optimization.md)
- [Monitoring](performance/monitoring.md)

## How to Use

### For Developers
1. Read the relevant stack documentation
2. Follow best practices
3. Use common patterns
4. Handle errors properly
5. Write tests

### For Security Review
1. Read security documentation
2. Check compliance requirements
3. Validate security patterns
4. Review data protection

### For Performance Review
1. Read performance documentation
2. Check caching strategies
3. Validate optimization
4. Monitor performance

## Updates
- {date}: Initial knowledge base created
- {date}: Updated {component} documentation
```

### Step 7: Multi-Agent Validation
```
VALIDATE WITH:

TECHNICAL-DIRECTOR:
- "Documentation is comprehensive"
- "Best practices are current"
- "Patterns are correct"

SECURITY-LEAD:
- "Security documentation is complete"
- "Compliance requirements are clear"
- "Best practices are secure"

PERFORMANCE-LEAD:
- "Performance documentation is complete"
- "Optimization strategies are correct"
- "Monitoring is adequate"

ALL MUST AGREE
```

### Step 8: Save & Make Accessible
```
SAVE TO:
- production/knowledge-base/

UPDATE AGENTS:
- All agents can access knowledge base
- Agents load relevant docs
- No need to search again

UPDATE PROJECT CONTEXT:
- project-context.knowledgeBase = true
- project-context.knowledgeBasePath = "production/knowledge-base/"
```

## Output
- Knowledge base built
- Documentation processed
- Organized by stack component
- Accessible to all agents
- Ready for development
