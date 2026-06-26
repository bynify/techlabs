# choose-stack

Select the right technology stack for your project.

## When to Use
- New project setup
- Technology evaluation
- Stack migration planning
- Architecture decisions

## Execution

### Step 1: Determine Project Type
```
ASK USER:
1. What type of project? (SaaS, API, CLI, Desktop, Mobile, AI/ML, Data, Messaging)
2. What's your experience level?
3. What's your team size?
4. What's your timeline?
5. What's your budget?
```

### Step 2: Analyze Requirements
```
CONSIDER:
- Performance requirements
- Scalability needs
- Security requirements
- Compliance requirements
- Team expertise
- Community support
- Cost constraints
```

### Step 3: Present Options
```
FOR EACH OPTION:
- Technology name
- Pros
- Cons
- Use cases
- Learning curve
- Community size
- Job market
```

### Step 4: Make Recommendation
```
RECOMMEND:
- Primary stack
- Supporting technologies
- Development tools
- Deployment platform

REFERENCE:
- docs/stack-reference/frontend-deployment.md (frontend deploy)
- docs/stack-reference/backend-stack.md (backend options)
```

### Step 5: Document Decision
```
CREATE docs/adr/{date}-stack-selection.md:
- Context
- Decision
- Consequences
- Alternatives considered
```

## Output
- Stack recommendation
- ADR document
- Updated CLAUDE.md with stack info
