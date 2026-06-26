# create-epics

Break down large features into epics and user stories.

## When to Use
- Sprint planning
- Feature planning
- Backlog organization

## Execution

### Step 1: Define Epic
```markdown
# Epic: User Authentication System

## Overview
Complete authentication system with login, signup, OAuth, and RBAC.

## User Stories

### Story 1: Email/Password Signup
**As a** new user
**I want to** create an account with email/password
**So that** I can access the platform

**Acceptance Criteria:**
- [ ] Email validation (format, uniqueness)
- [ ] Password requirements enforced (8+ chars, uppercase, number)
- [ ] Confirmation email sent
- [ ] Account activated after email confirmation

### Story 2: Login
**As a** registered user
**I want to** log in with email/password
**So that** I can access my account

**Acceptance Criteria:**
- [ ] Valid credentials grant access
- [ ] Invalid credentials show error
- [ ] Account lockout after 5 failed attempts
- [ ] Session created with JWT

### Story 3: OAuth Login
**As a** user
**I want to** log in with Google/GitHub
**So that** I don't need to remember another password

**Acceptance Criteria:**
- [ ] Google OAuth flow works
- [ ] GitHub OAuth flow works
- [ ] Account created on first OAuth login
- [ ] Profile data synced from provider

### Story 4: RBAC
**As an** admin
**I want to** manage user roles
**So that** I can control access

**Acceptance Criteria:**
- [ ] Roles: admin, user, viewer
- [ ] Admin can change user roles
- [ ] API endpoints protected by role
- [ ] UI elements hidden based on role
```

### Step 2: Estimate
```
EPIC: User Authentication
TOTAL: 21 story points

STORIES:
1. Email/Password Signup: 5 pts
2. Login: 3 pts
3. OAuth Login: 8 pts
4. RBAC: 5 pts
```

## Output
- Epic definition
- User stories with acceptance criteria
- Story point estimates
- Dependency map
