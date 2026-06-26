# choose-domain

Help select project domain and define the core problem space.

## When to Use
- Starting a new project
- Pivoting product direction
- Validating market fit
- Defining scope

## Execution

### Step 1: Explore Domains
```
ASK USER:
1. What industry? (SaaS, e-commerce, fintech, health, education)
2. Who are the users? (B2B, B2C, developers)
3. What problem exists?
4. Existing solutions and gaps?
```

### Step 2: Analyze Options
```
FOR EACH domain option:
- Market size (TAM, SAM, SOM)
- Competition level
- Technical complexity
- Revenue potential
- Personal interest/expertise

CREATE comparison matrix:
| Domain | Market | Competition | Complexity | Revenue | Score |
|--------|--------|-------------|------------|---------|-------|
| SaaS   | Large  | High        | Medium     | High    | 4.2   |
```

### Step 3: Define Domain Boundaries
```markdown
## Domain: [Selected Domain]

### Core Problem
[Clear problem statement]

### Target Users
- Primary: [User persona]
- Secondary: [User persona]

### Key Workflows
1. [Primary workflow]
2. [Secondary workflow]

### Out of Scope
- [Not building this]
- [Not building that]
```

### Step 4: Create Domain Model
```markdown
## Entities

### User
- Properties: id, name, email, role
- Relations: has many Orders

### Order
- Properties: id, status, total, createdAt
- Relations: belongs to User, has many Items

### Item
- Properties: id, name, price, quantity
- Relations: belongs to Order
```

## Output
- Domain selection rationale
- Target user personas
- Core workflows defined
- Domain model sketch
