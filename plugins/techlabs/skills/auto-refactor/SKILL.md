# auto-refactor

Detect code smells and apply refactoring patterns.

## When to Use
- Technical debt reduction
- Code quality improvement
- Pre-feature cleanup

## Execution

### Step 1: Detect Patterns
```
SCAN FOR:
- Long functions (>50 lines)
- Deep nesting (>3 levels)
- Code duplication
- God objects
- Magic numbers
- Unused imports/variables
```

### Step 2: Apply Refactoring
```
FOR EACH issue:
1. Identify pattern
2. Show proposed change
3. Get approval
4. Apply change
5. Run tests
```

### Step 3: Refactoring Patterns
```typescript
// Extract Function
function processOrder(order: Order) {
  validateOrder(order);
  calculateTotal(order);
  applyDiscounts(order);
  saveOrder(order);
}

// Replace Magic Number
const MAX_RETRY_COUNT = 3;
const TIMEOUT_MS = 5000;

// Remove Duplication
function handleError(error: Error) {
  logger.error(error);
  metrics.increment('error');
  notifyOps(error);
}
```

## Output
- Refactoring suggestions
- Applied changes
- Test verification
