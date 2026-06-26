# create-durable-object

Cloudflare Durable Object for stateful coordination, real-time, and persistent state.

## When to Use
- Chat rooms / real-time collaboration
- Multiplayer game state
- Rate limiting with counters
- WebSocket coordination
- Transactional state machines

## Execution

### Step 1: Design DO Class
```typescript
// src/durable-objects/chat-room.ts
export class ChatRoom {
  state: DurableObjectState;
  sessions: WebSocket[] = [];

  constructor(state: DurableObjectState, env: Env) {
    this.state = state;
  }

  async fetch(request: Request): Promise<Response> {
    if (request.headers.get('Upgrade') === 'websocket') {
      const pair = new WebSocketPair();
      this.handleWebSocket(pair[1]);
      return new Response(null, { status: 101, webSocket: pair[0] });
    }

    const messages = await this.state.storage.get<Message[]>('messages') || [];
    return Response.json({ messages });
  }

  handleWebSocket(ws: WebSocket) {
    ws.accept();
    this.sessions.push(ws);

    ws.addEventListener('message', async (event) => {
      const message = JSON.parse(event.data as string);
      message.timestamp = Date.now();

      const messages = await this.state.storage.get<Message[]>('messages') || [];
      messages.push(message);
      await this.state.storage.put('messages', messages);

      // Broadcast to all connected clients
      for (const session of this.sessions) {
        try { session.send(JSON.stringify(message)); } catch {}
      }
    });

    ws.addEventListener('close', () => {
      this.sessions = this.sessions.filter(s => s !== ws);
    });
  }
}
```

### Step 2: Configure in wrangler.toml
```toml
[[durable_objects.bindings]]
name = "CHAT_ROOM"
class_name = "ChatRoom"

[[migrations]]
tag = "v1"
new_classes = ["ChatRoom"]
```

### Step 3: Create Router to DO
```typescript
// src/worker.ts
export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    const url = new URL(request.url);
    
    if (url.pathname.startsWith('/rooms/')) {
      const roomId = url.pathname.split('/')[2];
      const id = env.CHAT_ROOM.idFromName(roomId);
      const stub = env.CHAT_ROOM.get(id);
      return stub.fetch(request);
    }

    return new Response('Not Found', { status: 404 });
  },
};
```

### Step 4: Client Connection
```typescript
const roomId = 'general';
const ws = new WebSocket(`wss://api.example.com/rooms/${roomId}`);

ws.onmessage = (event) => {
  const message = JSON.parse(event.data);
  console.log(`${message.user}: ${message.text}`);
};

ws.send(JSON.stringify({ user: 'Alice', text: 'Hello!' }));
```

## Output
- Durable Object class
- wrangler.toml config with migrations
- Router integration
- Client connection code
