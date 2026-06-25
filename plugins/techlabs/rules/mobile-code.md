# Mobile Code Rules

Applies to: `src/mobile/**`

## Requirements
- React Native / Expo patterns
- Platform-specific code (iOS/Android)
- Offline-first patterns
- Performance: FlatList, useMemo, useCallback
- Accessibility: VoiceOver, TalkBack

## Patterns
- Use `Platform.select()` for platform-specific code
- Use `AsyncStorage` for local persistence
- Use `react-navigation` for navigation
- Handle safe areas properly

## Anti-patterns
- Do not use web-only APIs
- Do not block the UI thread
- Do not ignore permissions
