# user-stories

Create user stories with acceptance criteria following INVEST principles.

## When to Use
- Sprint planning
- Feature specification
- Backlog grooming
- PRD breakdown


## Agents to Dispatch
- product-manager: Story breakdown
- lead-engineer: Technical stories
- quality-lead: Acceptance criteria

## Execution

### Step 1: Gather Requirements
```
ASK USER:
1. What feature are we specifying?
2. Who are the users?
3. What problems do they have?
4. What does success look like?
5. Any edge cases to consider?
```

### Step 2: Story Format
```markdown
## Story: [Title]

**As a** [user type]
**I want to** [action]
**So that** [benefit]

### Acceptance Criteria
- [ ] Criterion 1 (specific, testable)
- [ ] Criterion 2
- [ ] Criterion 3

### Technical Notes
- Dependencies: [list]
- Complexity: [low/medium/high]
- Estimation: [story points]
```

### Step 3: Write Stories
```markdown
## Story: User Login

**As a** registered user
**I want to** log in with my email
**So that** I can access my account

### Acceptance Criteria
- [ ] Valid credentials grant access and redirect to dashboard
- [ ] Invalid credentials show error message without revealing which field is wrong
- [ ] Account locks after 5 failed attempts with 15min cooldown
- [ ] Password reset link sent to email and expires in 1 hour
- [ ] Remember me checkbox keeps session for 30 days

### Edge Cases
- [ ] User tries to login with unverified email
- [ ] User has OAuth account but tries password login
- [ ] Session expires while user is active
```

### Step 4: INVEST Check
```
FOR EACH story, verify:

I - Independent: No blocking dependencies?
    → If blocked, create dependency story first

N - Negotiable: Details can be discussed?
    → Avoid over-specifying implementation

V - Valuable: Delivers user value?
    → If no value, reconsider feature

E - Estimable: Team can estimate?
    → If unclear, spike/prototype first

S - Small: Fits in one sprint?
    → If too large, break into sub-stories

T - Testable: Can verify completion?
    → Acceptance criteria must be specific
```

### Step 5: Create Story Map
```
USER JOURNEY: Purchase Flow

| Step | Stories |
|------|---------|
| Browse | View products, Filter, Search |
| Select | View details, Select size, Add to cart |
| Checkout | Enter address, Select payment, Confirm |
| Post-purchase | Track order, Rate product, Reorder |

PRIORITY:
P0: View products → Add to cart → Checkout → Confirm
P1: Filter, Search, Track order
P2: Rate product, Reorder
```

### Step 6: Generate Story Batch
```markdown
# Stories: Checkout Flow (Sprint 3)

## Story 1: Add to Cart
**As a** shopper
**I want to** add items to my cart
**So that** I can purchase multiple items

### Acceptance Criteria
- [ ] Add button on product page increases cart count
- [ ] Cart shows item name, price, quantity, image
- [ ] Can adjust quantity (1-99)
- [ ] Cart persists across sessions (logged in)
- [ ] Cart total updates in real-time

**Points:** 5

## Story 2: Enter Shipping Address
**As a** shopper
**I want to** enter my shipping address
**So that** I know where my order will be delivered

### Acceptance Criteria
- [ ] Form with name, street, city, state, zip, country
- [ ] Address validation (USPS/Google API)
- [ ] Save address for future orders
- [ ] Autocomplete from saved addresses

**Points:** 8

## Story 3: Select Payment Method
**As a** shopper
**I want to** select my payment method
**So that** I can pay for my order

### Acceptance Criteria
- [ ] Credit card form with validation
- [ ] Saved cards (if logged in)
- [ ] Apple Pay / Google Pay support
- [ ] PCI compliant (no raw card data stored)

**Points:** 13
```

## Output
- User stories with acceptance criteria
- Edge cases documented
- Story map
- Story points estimated
- Dependencies mapped
