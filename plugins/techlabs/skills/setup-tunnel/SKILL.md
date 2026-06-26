# setup-tunnel

Setup secure tunnels for exposing local services to the internet.

## When to Use
- Development environments
- Expose local services
- Bypass NAT/firewall
- Quick prototyping

## Agents to Dispatch
- devops-lead: Tunnel architecture
- security-lead: Security configuration
- cloudflare-specialist: Cloudflare tunnels

## Tunnel Options

```
TUNNEL COMPARISON:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

OPTION 1: Cloudflare Tunnel (Recommended)
  - Type: Managed
  - Features: SSL, DDoS, zero trust
  - Cost: Free (with Cloudflare)
  - Best for: Production, security

OPTION 2: ngrok
  - Type: Managed
  - Features: Quick setup, inspection
  - Cost: Free tier available
  - Best for: Development, testing

OPTION 3: Tailscale Funnel
  - Type: P2P + Managed
  - Features: WireGuard, simple
  - Cost: Free for personal
  - Best for: Team access

OPTION 4: bore
  - Type: Self-hosted
  - Features: Simple, lightweight
  - Cost: Free
  - Best for: Self-hosted

OPTION 5: localtunnel
  - Type: Managed
  - Features: Simple, free
  - Cost: Free
  - Best for: Quick testing
```

## Execution

### Step 1: Determine Tunnel Needs
```
ASK USER:
1. Why need tunnel?
   - Development
   - Testing
   - Production
   - Team access

2. What services?
   - Web app
   - API
   - Database
   - SSH

3. Security requirements?
   - Authentication
   - IP restrictions
   - Zero trust
```

### Step 2: Cloudflare Tunnel (Production)
```bash
# Install
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared.deb

# Login
cloudflared tunnel login

# Create tunnel
cloudflared tunnel create my-production-app

# Configure
cat > ~/.cloudflared/config.yml << EOF
tunnel: my-production-app
credentials-file: /root/.cloudflared/credentials.json

# Ingress rules
ingress:
  # Web app
  - hostname: app.example.com
    service: http://localhost:3000
    originRequest:
      noTLSVerify: false
      connectTimeout: 10s
      
  # API
  - hostname: api.example.com
    service: http://localhost:8080
    originRequest:
      noTLSVerify: false
      
  # Catch-all
  - service: http_status:404
EOF

# Run as service
sudo cloudflared service install
sudo systemctl start cloudflared

# Add DNS records
cloudflared tunnel route dns my-production-app app.example.com
cloudflared tunnel route dns my-production-app api.example.com
```

### Step 3: Cloudflare Tunnel with Access (Zero Trust)
```yaml
# Zero Trust configuration via dashboard
tunnel: my-app
credentials-file: /root/.cloudflared/credentials.json

ingress:
  - hostname: app.example.com
    service: http://localhost:3000
    access:
      policies:
        - name: "Team Access"
          decision: "allow"
          include:
            - email_domain: "example.com"
          
  - hostname: admin.example.com
    service: http://localhost:3001
    access:
      policies:
        - name: "Admin Only"
          decision: "allow"
          include:
            - email: "admin@example.com"
```

### Step 4: ngrok (Development)
```bash
# Install
curl -s https://bin.equinox.io/c/4VmDzA7yHf/ngrok-v3-stable-linux-amd64.tgz | sudo tar -xz -C /usr/local/bin

# Authenticate
ngrok config add-authtoken YOUR_TOKEN

# Expose port
ngrok http 3000

# Custom domain (paid)
ngrok http 3000 --domain=my-app.ngrok.io

# With basic auth
ngrok http 3000 --basic-auth="user:password"
```

### Step 5: Tailscale Funnel
```bash
# Install
curl -fsSL https://tailscale.com/install.sh | sh

# Start
sudo tailscale up

# Enable funnel
tailscale funnel 3000

# With access control
tailscale funnel --bg 3000

# Status
tailscale funnel status
```

### Step 6: bore (Self-hosted)
```bash
# Install
cargo install bore-cli

# Run server
bored --port 12345 --min-port 10000 --max-port 20000

# Connect
bore local 3000 --to bore.example.com:12345
```

### Step 7: Docker Compose with Tunnel
```yaml
# docker-compose.yml
version: '3.8'

services:
  cloudflared:
    image: cloudflare/cloudflared:latest
    command: tunnel run
    environment:
      - TUNNEL_TOKEN=${CF_TUNNEL_TOKEN}
    volumes:
      - ./cloudflared:/root/.cloudflared
    restart: unless-stopped

  app:
    image: myapp:latest
    expose:
      - "3000"
    environment:
      - NODE_ENV=production
```

### Step 8: Monitor Tunnel
```yaml
# Cloudflare Tunnel metrics
metrics:
  - tunnel_connected
  - tunnel_requests
  - tunnel_errors
  - tunnel_latency

# Health check
curl http://localhost:60123/health
```

## Output
- Tunnel configured
- DNS records added
- SSL enabled
- Security policies set
- Monitoring configured
