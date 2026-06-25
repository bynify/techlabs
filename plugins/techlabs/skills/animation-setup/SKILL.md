# animation-setup

Setup animation system with Framer Motion.

## Execution

### Step 1: Install Dependencies
```bash
npm install framer-motion
```

### Step 2: Create Animation Presets
```typescript
// lib/animations.ts
export const fadeIn = {
  initial: { opacity: 0 },
  animate: { opacity: 1 },
  exit: { opacity: 0 },
}

export const slideUp = {
  initial: { opacity: 0, y: 20 },
  animate: { opacity: 1, y: 0 },
  exit: { opacity: 0, y: -20 },
}

export const scaleIn = {
  initial: { opacity: 0, scale: 0.95 },
  animate: { opacity: 1, scale: 1 },
  exit: { opacity: 0, scale: 0.95 },
}

export const stagger = {
  animate: {
    transition: {
      staggerChildren: 0.1,
    },
  },
}
```

### Step 3: Page Transitions
```typescript
// components/page-transition.tsx
"use client"

import { motion } from "framer-motion"
import { fadeIn } from "@/lib/animations"

export function PageTransition({ children }) {
  return (
    <motion.div
      initial="initial"
      animate="animate"
      exit="exit"
      variants={fadeIn}
    >
      {children}
    </motion.div>
  )
}
```

### Step 4: Hover Effects
```typescript
// components/hover-card.tsx
"use client"

import { motion } from "framer-motion"

export function HoverCard({ children }) {
  return (
    <motion.div
      whileHover={{ scale: 1.02 }}
      whileTap={{ scale: 0.98 }}
      transition={{ type: "spring", stiffness: 300 }}
    >
      {children}
    </motion.div>
  )
}
```

### Step 5: Scroll Animations
```typescript
// components/scroll-reveal.tsx
"use client"

import { motion } from "framer-motion"
import { slideUp } from "@/lib/animations"

export function ScrollReveal({ children }) {
  return (
    <motion.div
      initial="initial"
      whileInView="animate"
      viewport={{ once: true }}
      variants={slideUp}
    >
      {children}
    </motion.div>
  )
}
```

## Output
- Framer Motion configured
- Animation presets
- Page transitions
- Scroll animations
