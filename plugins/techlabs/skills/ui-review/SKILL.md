# ui-review

Systematic UI consistency and quality review with actionable feedback.

## When to Use
- Pre-release review
- Design QA
- Sprint review
- Accessibility audit

## Execution

### Step 1: Visual Consistency
```
CHECK:

COLORS:
- [ ] Primary color consistent
- [ ] Secondary color consistent
- [ ] Neutral colors consistent
- [ ] Status colors correct (success, warning, error)

TYPOGRAPHY:
- [ ] Heading sizes consistent
- [ ] Body text consistent
- [ ] Font weights correct
- [ ] Line heights appropriate

SPACING:
- [ ] Component padding consistent
- [ ] Section margins consistent
- [ ] Grid alignment correct
- [ ] Whitespace balanced

COMPONENTS:
- [ ] Buttons match spec
- [ ] Inputs match spec
- [ ] Cards match spec
- [ ] Navigation consistent
```

### Step 2: UX Patterns
```
CHECK:

NAVIGATION:
- [ ] Logo links to home
- [ ] Active state clear
- [ ] Back button works
- [ ] Breadcrumbs accurate

FORMS:
- [ ] Labels visible
- [ ] Placeholder text helpful
- [ ] Error messages clear
- [ ] Success feedback shown
- [ ] Loading state during submit

FEEDBACK:
- [ ] Loading states present
- [ ] Error states present
- [ ] Empty states present
- [ ] Success states present

HIERARCHY:
- [ ] Primary action prominent
- [ ] Secondary action subdued
- [ ] Destructive action dangerous color
```

### Step 3: Responsive Check
```
VIEWPORTS:

Mobile (320px):
- [ ] Single column layout
- [ ] Touch targets ≥44px
- [ ] Text readable (≥14px)
- [ ] Images responsive
- [ ] No horizontal scroll

Tablet (768px):
- [ ] Appropriate columns
- [ ] Navigation accessible
- [ ] Content readable

Desktop (1024px):
- [ ] Full layout visible
- [ ] Hover states work
- [ ] Keyboard navigation

Large (1440px+):
- [ ] Max width applied
- [ ] Content centered
- [ ] No stretching
```

### Step 4: Performance
```
CHECK:
- [ ] Images optimized (WebP/AVIF)
- [ ] No layout shift (CLS)
- [ ] Fast interactions (<100ms)
- [ ] No jank during scroll
```

### Step 5: Generate Report
```markdown
# UI Review Report

## Date: YYYY-MM-DD
## Reviewer: [Name]

## Overall Score: [X/100]

## Issues Found

### Critical (Fix Now)
1. Submit button not loading state during form submission
2. Error messages not visible on mobile

### Important (Fix Soon)
1. Inconsistent button padding (8px vs 12px)
2. Missing focus states on links
3. Color contrast fails on secondary text

### Minor (Fix Later)
1. Inconsistent border-radius on cards
2. Missing hover state on table rows
3. Tooltip text too small

## Recommendations
1. Create loading button component
2. Add error toast component
3. Update button design tokens
```

## Output
- Visual consistency report
- UX patterns audit
- Responsive check
- Performance review
- Improvement recommendations
