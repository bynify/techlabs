# Frontend Code Rules

Applies to: `src/frontend/**`

## Requirements
- SSR awareness (no window/document in server components)
- Bundle budget < 250KB initial
- Accessibility: ARIA labels, keyboard navigation, focus management
- Responsive design (mobile-first)
- Performance: lazy loading, code splitting

## Patterns
- Use React hooks for state management
- Use Next.js App Router patterns
- Use Tailwind CSS for styling
- Use proper error boundaries

## Anti-patterns
- Do not use `useEffect` for data fetching (use RSC or server actions)
- Do not store sensitive data in client state
- Do not use inline styles for complex components
