# create-landing-page

Create a conversion-optimized landing page.

## When to Use
- Product launch
- Marketing campaigns
- Conversion optimization
- A/B testing

## Execution

### Step 1: Gather Requirements
```
ASK USER:
1. What's the product/service?
2. Who's the target audience?
3. What's the main CTA?
4. What social proof to include?
5. What's the unique value proposition?
```

### Step 2: Design Page Structure
```
CREATE page structure:
1. Hero Section
   - Headline (value proposition)
   - Subheadline (benefit)
   - CTA button
   - Hero image/animation

2. Social Proof
   - Customer logos
   - Testimonials
   - Statistics

3. Features Section
   - Feature cards with icons
   - Benefits for each feature

4. How It Works
   - Step-by-step process
   - Visual flow

5. Pricing (if applicable)
   - Pricing tiers
   - Feature comparison
   - CTA for each tier

6. FAQ
   - Common questions
   - Objection handling

7. Final CTA
   - Repeat main CTA
   - Urgency/scarcity
```

### Step 3: Create Component
```
CREATE src/frontend/components/landing/Hero.tsx:
'use client'

import { Button } from '@/components/ui/button'

export function Hero() {
  return (
    <section className="py-20 px-4 text-center">
      <h1 className="text-5xl font-bold mb-6">
        [Value Proposition]
      </h1>
      <p className="text-xl text-gray-600 mb-8">
        [Benefit Statement]
      </p>
      <Button size="lg" className="text-lg px-8 py-4">
        [CTA Text]
      </Button>
    </section>
  )
}
```

### Step 4: Add SEO
```
ADD:
- Meta tags (title, description, keywords)
- Open Graph tags
- Twitter Card tags
- Structured data (JSON-LD)
- Sitemap entry
```

### Step 5: Optimize Performance
```
OPTIMIZE:
- Image compression
- Lazy loading
- Code splitting
- Font optimization
- Critical CSS
```

### Step 6: Test
```
VERIFY:
- Mobile responsive
- Fast loading (<3s)
- CTA visible above fold
- Forms working
- Analytics tracking
```

## Output
- Created landing page components
- SEO optimization
- Performance optimization
- Analytics integration
