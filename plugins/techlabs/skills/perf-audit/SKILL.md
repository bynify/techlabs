# perf-audit

Performance audit with Lighthouse, Core Web Vitals, and profiling.

## When to Use

## Agents to Dispatch
- lead-engineer: Performance review
- devops-engineer: Infrastructure
- Pre-release checks
- Performance regression detection
- Optimization planning

## Execution

### Step 1: Lighthouse Audit
```bash
# Run Lighthouse
npx lighthouse https://example.com --view

# CI integration
npx lighthouse https://example.com --output json --output-path ./report.json
```

### Step 2: Core Web Vitals Check
```
TARGETS:
- LCP (Largest Contentful Paint): < 2.5s
- FID (First Input Delay): < 100ms
- CLS (Cumulative Layout Shift): < 0.1
- INP (Interaction to Next Paint): < 200ms

MEASURE WITH:
- PageSpeed Insights
- Chrome DevTools Performance tab
- CrUX data (field data)
```

### Step 3: Audit Checklist
```markdown
## Performance Audit

### Metrics
- [ ] LCP: 1.8s ✅
- [ ] FID: 45ms ✅
- [ ] CLS: 0.05 ✅
- [ ] INP: 120ms ✅

### Load Performance
- [ ] Initial bundle < 250KB ✅
- [ ] Images optimized ✅
- [ ] Fonts loaded efficiently ⚠️
- [ ] No render-blocking resources ✅

### Runtime Performance
- [ ] No memory leaks ✅
- [ ] Smooth animations ✅
- [ ] Efficient re-renders ⚠️

### Backend Performance
- [ ] API P95 < 200ms ✅
- [ ] Database queries optimized ✅
- [ ] Caching configured ✅
```

### Step 4: Recommendations
```
HIGH IMPACT:
1. Optimize images (use WebP/AVIF)
2. Implement code splitting
3. Add resource hints (preload/prefetch)

MEDIUM IMPACT:
1. Optimize font loading
2. Reduce JavaScript execution time
3. Use browser caching

LOW IMPACT:
1. Minify CSS
2. Enable compression
```

## Output
- Lighthouse score
- Core Web Vitals metrics
- Audit checklist
- Optimization recommendations
