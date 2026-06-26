# mobile-design

Design mobile-first responsive interfaces with touch-friendly patterns.

## When to Use
- Building mobile layouts
- Responsive design
- Touch interface optimization

## Execution

### Step 1: Breakpoints Strategy
```css
/* Mobile First - Base styles for mobile */

/* Mobile: 0-767px */
.container { padding: 16px; }
.grid { display: flex; flex-direction: column; gap: 16px; }

/* Tablet: 768px+ */
@media (min-width: 768px) {
  .container { padding: 24px; }
  .grid { flex-direction: row; flex-wrap: wrap; }
  .grid > * { width: calc(50% - 8px); }
}

/* Desktop: 1024px+ */
@media (min-width: 1024px) {
  .container { padding: 32px; max-width: 1200px; margin: 0 auto; }
  .grid > * { width: calc(33.333% - 11px); }
}

/* Large: 1440px+ */
@media (min-width: 1440px) {
  .container { padding: 48px; }
}
```

### Step 2: Touch Targets
```css
/* Minimum 44x44px touch targets */
button, a, [role="button"] {
  min-height: 44px;
  min-width: 44px;
  padding: 12px 16px;
}

/* Adequate spacing between targets */
nav a + a { margin-left: 8px; }
```

### Step 3: Mobile Patterns
```
NAVIGATION:
- Bottom nav for primary actions
- Hamburger menu for secondary
- Back button in header

FORMS:
- Large input fields (48px height)
- Appropriate keyboard types
- Inline validation

FEEDBACK:
- Pull to refresh
- Infinite scroll
- Swipe actions
- Bottom sheets for options
```

### Step 4: Performance
```
OPTIMIZATIONS:
- Lazy load images below fold
- Use srcset for responsive images
- Minimize JavaScript
- Optimize fonts (font-display: swap)
```

## Output
- Responsive CSS
- Touch-friendly components
- Mobile patterns
- Performance optimizations
