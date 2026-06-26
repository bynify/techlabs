# create-push-notification

Push notification system with web push and mobile support.

## When to Use
- User engagement
- Real-time alerts
- Re-engagement campaigns

## Execution

### Step 1: Subscribe
```typescript
async function subscribePush() {
  const registration = await navigator.serviceWorker.ready;
  const subscription = await registration.pushManager.subscribe({
    userVisibleOnly: true,
    applicationServerKey: urlBase64ToUint8Array(process.env.VAPID_PUBLIC_KEY),
  });
  
  await api.post('/push/subscribe', subscription);
}
```

### Step 2: Send Notification
```typescript
import webPush from 'web-push';

webPush.setVapidDetails('mailto:admin@example.com', publicKey, privateKey);

async function sendPush(subscription: any, payload: any) {
  await webPush.sendNotification(subscription, JSON.stringify(payload));
}
```

### Step 3: Handle Click
```typescript
self.addEventListener('push', (event) => {
  const data = event.data.json();
  event.waitUntil(
    self.registration.showNotification(data.title, {
      body: data.body,
      icon: '/icon.png',
      data: { url: data.url },
    })
  );
});

self.addEventListener('notificationclick', (event) => {
  event.notification.close();
  event.waitUntil(clients.openWindow(event.notification.data.url));
});
```

## Output
- Subscribe flow
- Send handler
- Click handler
- VAPID keys setup
