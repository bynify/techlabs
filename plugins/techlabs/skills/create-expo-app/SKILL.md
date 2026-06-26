# create-expo-app

Create React Native app with Expo, navigation, and native modules.

## When to Use
- Mobile app development
- Cross-platform apps
- Rapid prototyping

## Execution

### Step 1: Initialize
```bash
npx create-expo-app my-app --template tabs
cd my-app
```

### Step 2: Setup Navigation
```typescript
// app/(tabs)/_layout.tsx
import { Tabs } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';

export default function TabLayout() {
  return (
    <Tabs>
      <Tabs.Screen name="index" options={{
        title: 'Home',
        tabBarIcon: ({ color }) => <Ionicons name="home" size={24} color={color} />,
      }} />
      <Tabs.Screen name="profile" options={{
        title: 'Profile',
        tabBarIcon: ({ color }) => <Ionicons name="person" size={24} color={color} />,
      }} />
    </Tabs>
  );
}
```

### Step 3: API Integration
```typescript
// lib/api.ts
import * as SecureStore from 'expo-secure-store';

const api = createApiClient({
  baseUrl: process.env.EXPO_PUBLIC_API_URL,
  getToken: () => SecureStore.getItemAsync('token'),
});
```

## Output
- Expo app with tabs
- Navigation setup
- API integration
- Auth flow
