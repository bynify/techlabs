# create-offline-mode

Implement offline-first with service workers and local storage.

## When to Use
- Mobile web apps
- Unreliable connectivity
- Field workers

## Execution

### Step 1: Service Worker Cache
```typescript
// sw.js
const CACHE = 'app-v1';
const ASSETS = ['/', '/index.html', '/assets/app.js'];

self.addEventListener('install', (event) => {
  event.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS)));
});

self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then(cached => cached || fetch(event.request))
  );
});
```

### Step 2: IndexedDB Storage
```typescript
import { openDB } from 'idb';

const db = await openDB('app', 1, {
  upgrade(db) {
    db.createObjectStore('pending', { keyPath: 'id', autoIncrement: true });
  },
});

async function saveOffline(action: any) {
  await db.add('pending', { ...action, timestamp: Date.now() });
}

async function syncPending() {
  const pending = await db.getAll('pending');
  for (const action of pending) {
    await api.send(action);
    await db.delete('pending', action.id);
  }
}
```

## Output
- Service worker
- IndexedDB integration
- Sync logic
- UI indicators
