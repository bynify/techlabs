# auth-setup

Implement authentication and authorization with OAuth, JWT, and RBAC.

## When to Use
- Adding login/signup
- Implementing OAuth providers
- Setting up role-based access
- Securing API endpoints

## Execution

### Step 1: Choose Auth Strategy
```
ASK USER:
1. Auth providers? (email/password, OAuth, magic link)
2. OAuth providers? (Google, GitHub, etc.)
3. Token strategy? (JWT, session)
4. Roles needed? (admin, user, viewer)
```

### Step 2: Create Auth Schema
```sql
-- migrations/create_auth_tables.sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255),
  name VARCHAR(255) NOT NULL,
  email_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE user_roles (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  role VARCHAR(50) NOT NULL,
  PRIMARY KEY (user_id, role)
);

CREATE TABLE oauth_connections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  provider VARCHAR(50) NOT NULL,
  provider_user_id VARCHAR(255) NOT NULL,
  access_token TEXT,
  refresh_token TEXT,
  UNIQUE(provider, provider_user_id)
);
```

### Step 3: Implement Auth Middleware
```typescript
// src/middleware/auth.ts
import { verifyToken } from '../lib/jwt';

export async function authMiddleware(request: Request): Promise<User | null> {
  const token = request.headers.get('Authorization')?.replace('Bearer ', '');
  if (!token) return null;

  try {
    const payload = await verifyToken(token);
    return await db.users.findById(payload.userId);
  } catch {
    return null;
  }
}

export function requireAuth(handler: Function) {
  return async (request: Request) => {
    const user = await authMiddleware(request);
    if (!user) {
      return new Response('Unauthorized', { status: 401 });
    }
    return handler(request, { user });
  };
}
```

### Step 4: Add OAuth Flows
```typescript
// src/lib/oauth.ts
import { OAuth2Client } from 'google-auth-library';

const google = new OAuth2Client(
  process.env.GOOGLE_CLIENT_ID,
  process.env.GOOGLE_CLIENT_SECRET
);

export async function handleGoogleCallback(code: string) {
  const { tokens } = await google.getToken(code);
  const ticket = await google.verifyIdToken({
    idToken: tokens.id_token!,
    audience: process.env.GOOGLE_CLIENT_ID,
  });

  const payload = ticket.getPayload()!;
  return findOrCreateUser({
    email: payload.email!,
    name: payload.name!,
    provider: 'google',
    providerId: payload.sub,
  });
}
```

### Step 5: Create Login/Signup Flows
```typescript
// POST /api/auth/signup
export async function signup(request: Request) {
  const { email, password, name } = await request.json();
  
  const existing = await db.users.findByEmail(email);
  if (existing) {
    return Response.json({ error: 'Email already registered' }, { status: 409 });
  }

  const passwordHash = await bcrypt.hash(password, 12);
  const user = await db.users.create({ email, passwordHash, name });
  const token = generateToken(user.id);

  return Response.json({ user, token });
}
```

## Output
- Auth schema (database tables)
- JWT configuration
- Auth middleware
- Login/signup endpoints
- OAuth integration (if needed)
