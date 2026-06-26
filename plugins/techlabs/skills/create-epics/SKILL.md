# create-epics

Break down large features into epics with user stories and acceptance criteria.

## When to Use
- Feature planning
- Sprint planning
- Backlog organization
- Product roadmap

## Agents to Dispatch
- product-manager: Epic breakdown
- lead-engineer: Technical feasibility

## Epic Structure

```
EPIC HIERARCHY:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  PRODUCT (PRD)
      │
      ▼
  ┌─────────────────────────────────────────────────────────┐
  │  EPIC: User Authentication                              │
  │  ─────────────────────────────────────────────────────  │
  │  Overview: Complete auth system                         │
  │  Points: 21 total                                       │
  │  Sprint: 1-2                                            │
  │                                                         │
  │  STORIES:                                               │
  │  ┌──────────────────────────────────────────────────┐  │
  │  │ Story 1: Email/Password Signup (5 pts)           │  │
  │  │ Story 2: Login (3 pts)                           │  │
  │  │ Story 3: OAuth Login (8 pts)                     │  │
  │  │ Story 4: RBAC (5 pts)                            │  │
  │  └──────────────────────────────────────────────────┘  │
  │                                                         │
  │  TASKS (per story):                                     │
  │  ┌──────────────────────────────────────────────────┐  │
  │  │ Task 1.1: Database schema (2h)                   │  │
  │  │ Task 1.2: API endpoints (4h)                     │  │
  │  │ Task 1.3: Frontend UI (3h)                       │  │
  │  │ Task 1.4: Tests (2h)                             │  │
  │  └──────────────────────────────────────────────────┘  │
  └─────────────────────────────────────────────────────────┘
```

## Execution

### Step 1: Load Context
```
READ:
- docs/PRD.md (requirements)
- docs/architecture.md (if exists)
- production/session-state/active.md

EXTRACT:
- Features from PRD
- Dependencies between features
- Technical constraints
```

### Step 2: Define Epic Template
```markdown
# Epic: [Name]

## Overview
[1-2 sentence description of what this epic delivers]

## Business Value
- [Why this epic matters]
- [Expected impact]

## Stories
[List of user stories that make up this epic]

## Dependencies
- [Other epics or external dependencies]

## Acceptance Criteria
- [High-level criteria for epic completion]

## Estimate
- Total points: [X]
- Estimated sprints: [Y]
```

### Step 3: Create Epic from PRD
```markdown
# Epic: User Authentication System

## Overview
Complete authentication system with email/password, OAuth, and role-based access control.

## Business Value
- Secure user access to platform
- Enable personalized experiences
- Support enterprise customers with RBAC

## Stories

### Story 1: Email/Password Signup
**As a** new user
**I want to** create an account with email/password
**So that** I can access the platform

**Points:** 5
**Priority:** P0

**Acceptance Criteria:**
- [ ] Email validation (format, uniqueness)
- [ ] Password requirements enforced (8+ chars, uppercase, number)
- [ ] Confirmation email sent
- [ ] Account activated after email confirmation

**Tasks:**
- [ ] Database schema for users (2h)
- [ ] Signup API endpoint (2h)
- [ ] Email service integration (1h)
- [ ] Frontend signup form (2h)
- [ ] Tests (2h)

---

### Story 2: Login
**As a** registered user
**I want to** log in with email/password
**So that** I can access my account

**Points:** 3
**Priority:** P0

**Acceptance Criteria:**
- [ ] Valid credentials grant access
- [ ] Invalid credentials show error
- [ ] Account lockout after 5 failed attempts
- [ ] Session created with JWT

**Tasks:**
- [ ] Login API endpoint (2h)
- [ ] JWT token generation (2h)
- [ ] Frontend login form (2h)
- [ ] Tests (1h)

---

### Story 3: OAuth Login
**As a** user
**I want to** log in with Google/GitHub
**So that** I don't need to remember another password

**Points:** 8
**Priority:** P1

**Acceptance Criteria:**
- [ ] Google OAuth flow works
- [ ] GitHub OAuth flow works
- [ ] Account created on first OAuth login
- [ ] Profile data synced from provider

**Tasks:**
- [ ] OAuth provider setup (2h)
- [ ] OAuth callback handling (3h)
- [ ] Account linking logic (3h)
- [ ] Frontend OAuth buttons (2h)
- [ ] Tests (2h)

---

### Story 4: RBAC
**As an** admin
**I want to** manage user roles
**So that** I can control access

**Points:** 5
**Priority:** P1

**Acceptance Criteria:**
- [ ] Roles: admin, user, viewer
- [ ] Admin can change user roles
- [ ] API endpoints protected by role
- [ ] UI elements hidden based on role

**Tasks:**
- [ ] Role schema (1h)
- [ ] RBAC middleware (2h)
- [ ] Admin API endpoints (2h)
- [ ] Frontend role management (2h)
- [ ] Tests (2h)

## Dependencies
- Email service (for confirmation emails)
- OAuth provider accounts (Google, GitHub)

## Estimate
- Total: 21 points
- Sprints: 2 (Sprint 1: Stories 1-2, Sprint 2: Stories 3-4)
```

### Step 4: Create Multiple Epics
```markdown
# Epics for E-commerce Platform

## Epic 1: User Authentication (21 pts)
- Stories: 4
- Sprints: 2
- Priority: P0

## Epic 2: Product Catalog (16 pts)
- Stories: 3
- Sprints: 1-2
- Priority: P0

## Epic 3: Shopping Cart (13 pts)
- Stories: 3
- Sprints: 1
- Priority: P0

## Epic 4: Checkout & Payments (18 pts)
- Stories: 4
- Sprints: 2
- Priority: P1

## Epic 5: Order Management (15 pts)
- Stories: 3
- Sprints: 1-2
- Priority: P1

## Epic 6: User Profile (8 pts)
- Stories: 2
- Sprints: 1
- Priority: P2

## TOTAL: 91 points, ~8 sprints
```

### Step 5: Generate Epic Map
```markdown
# Epic Map: E-commerce Platform

## Phase 1: Foundation (Sprint 1-2)
├── Epic 1: User Authentication (21 pts)
│   ├── Story 1.1: Signup (5 pts)
│   ├── Story 1.2: Login (3 pts)
│   ├── Story 1.3: OAuth (8 pts)
│   └── Story 1.4: RBAC (5 pts)
└── Epic 2: Product Catalog (16 pts)
    ├── Story 2.1: Product List (5 pts)
    ├── Story 2.2: Product Detail (5 pts)
    └── Story 2.3: Search (6 pts)

## Phase 2: Commerce (Sprint 3-4)
├── Epic 3: Shopping Cart (13 pts)
│   ├── Story 3.1: Add to Cart (3 pts)
│   ├── Story 3.2: Cart Management (5 pts)
│   └── Story 3.3: Cart Persistence (5 pts)
└── Epic 4: Checkout (18 pts)
    ├── Story 4.1: Shipping (5 pts)
    ├── Story 4.2: Payment (8 pts)
    └── Story 4.3: Confirmation (5 pts)

## Phase 3: Operations (Sprint 5-6)
├── Epic 5: Orders (15 pts)
│   ├── Story 5.1: Order History (5 pts)
│   ├── Story 5.2: Order Tracking (5 pts)
│   └── Story 5.3: Returns (5 pts)
└── Epic 6: Profile (8 pts)
    ├── Story 6.1: Profile Edit (3 pts)
    └── Story 6.2: Preferences (5 pts)
```

### Step 6: Save Epic Structure
```
SAVE TO:
- production/epics/ (one file per epic)
- production/epics/epic-map.md (overview)

CREATE:
- production/epics/EPIC-001-auth.md
- production/epics/EPIC-002-catalog.md
- production/epics/EPIC-003-cart.md
- production/epics/epic-map.md
```

### Step 7: Pass to User Stories
```
NEXT: /user-stories

INPUT:
- Epic definitions
- Story templates
- Acceptance criteria

OUTPUT:
- Detailed user stories
- Story points
- Dependencies mapped
```

## Output
- Epic definitions with stories
- Story point estimates
- Epic map visualization
- Dependency tracking
- Ready for user-stories skill
