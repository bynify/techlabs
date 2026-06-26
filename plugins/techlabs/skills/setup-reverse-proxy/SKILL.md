# setup-reverse-proxy

Configure reverse proxy for SSL termination, caching, and security.

## When to Use
- SSL termination
- Request caching
- Rate limiting
- Security headers
- API gateway

## Agents to Dispatch
- devops-lead: Proxy architecture
- security-lead: Security configuration
- cloudflare-specialist: Cloudflare proxy

## Reverse Proxy Options

```
REVERSE PROXY COMPARISON:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Nginx:
  - Features: L7, SSL, caching, rate limiting
  - Config: nginx.conf
  - Best for: High performance, complex configs

Caddy:
  - Features: Auto HTTPS, simple config
  - Config: Caddyfile
  - Best for: Simple setups, auto SSL

Cloudflare:
  - Features: CDN, DDoS, WAF, SSL
  - Config: Dashboard/API
  - Best for: Global apps, security

Traefik:
  - Features: Docker discovery, Let's Encrypt
  - Config: Labels/Dashboard
  - Best for: Docker/Kubernetes
```

## Execution

### Step 1: Determine Needs
```
ASK USER:
1. SSL termination needed?
2. Caching needed?
3. Rate limiting needed?
4. Security headers needed?
5. API gateway features?
```

### Step 2: Nginx Reverse Proxy
```nginx
# /etc/nginx/conf.d/app.conf

upstream app_backend {
    server 127.0.0.1:3000;
    server 127.0.0.1:3001;
    keepalive 32;
}

# Rate limiting
limit_req_zone $binary_remote_addr zone=general:10m rate=10r/s;
limit_req_zone $binary_remote_addr zone=api:10m rate=100r/m;

server {
    listen 443 ssl http2;
    server_name app.example.com;
    
    # SSL
    ssl_certificate /etc/ssl/certs/app.pem;
    ssl_certificate_key /etc/ssl/private/app.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    
    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    add_header Content-Security-Policy "default-src 'self'" always;
    
    # Proxy settings
    proxy_http_version 1.1;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header Connection "";
    
    # Caching
    location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
        proxy_pass http://app_backend;
        proxy_cache_valid 200 1d;
        expires 7d;
        add_header Cache-Control "public, immutable";
    }
    
    # API with rate limiting
    location /api/ {
        limit_req zone=api burst=50 nodelay;
        proxy_pass http://app_backend;
        proxy_read_timeout 30s;
        proxy_connect_timeout 5s;
    }
    
    # Main app
    location / {
        limit_req zone=general burst=20 nodelay;
        proxy_pass http://app_backend;
    }
    
    # Health check (no rate limit)
    location /health {
        proxy_pass http://app_backend;
        access_log off;
    }
}

# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name app.example.com;
    return 301 https://$server_name$request_uri;
}
```

### Step 3: Caddy Reverse Proxy
```caddy
# Caddyfile

app.example.com {
    # Auto TLS
    tls admin@example.com
    
    # Reverse proxy
    reverse_proxy localhost:3000 localhost:3001 {
        lb_policy least_conn
        lb_health_uri /health
        lb_health_interval 10s
        
        # Headers
        header_up X-Real-IP {remote_host}
        header_up X-Forwarded-For {remote_host}
        header_up X-Forwarded-Proto {scheme}
        
        # Timeouts
        transport http {
            dial_timeout 5s
            response_header_timeout 30s
        }
    }
    
    # Security headers
    header {
        X-Frame-Options SAMEORIGIN
        X-Content-Type-Options nosniff
        X-XSS-Protection "1; mode=block"
        Strict-Transport-Security "max-age=31536000; includeSubDomains"
        Content-Security-Policy "default-src 'self'"
        -Server
    }
    
    # Rate limiting (via plugin or custom)
    # route /api/* {
    #     throttle 100r/m
    # }
    
    # Logging
    log {
        output file /var/log/caddy/app.log
        format json
    }
}
```

### Step 4: Cloudflare Tunnel (Zero Trust)
```bash
# Install cloudflared
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared focal main' | sudo tee /etc/apt/sources.list.d/cloudflared.list
sudo apt update && sudo apt install cloudflared

# Authenticate
cloudflared tunnel login

# Create tunnel
cloudflared tunnel create my-app

# Configure tunnel
cat > ~/.cloudflared/config.yml << EOF
tunnel: my-app
credentials-file: /root/.cloudflared/credentials.json

ingress:
  - hostname: app.example.com
    service: http://localhost:3000
  - hostname: api.example.com
    service: http://localhost:8080
  - service: http_status:404
EOF

# Run tunnel
cloudflared tunnel run my-app

# DNS routing
cloudflared tunnel route dns my-app app.example.com
cloudflared tunnel route dns my-app api.example.com
```

### Step 5: Docker Compose with Proxy
```yaml
# docker-compose.yml
version: '3.8'

services:
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
      - ./certs:/etc/ssl/certs
    depends_on:
      - app1
      - app2

  app1:
    image: myapp:latest
    environment:
      - NODE_ENV=production
    expose:
      - "3000"

  app2:
    image: myapp:latest
    environment:
      - NODE_ENV=production
    expose:
      - "3000"
```

### Step 6: Monitor Reverse Proxy
```yaml
# Nginx metrics with nginx-prometheus-exporter
services:
  nginx-exporter:
    image: nginx/nginx-prometheus-exporter
    command:
      - --nginx.scrape-uri=http://nginx/stub_status
    ports:
      - "9113:9113"
```

## Output
- Reverse proxy configured
- SSL termination enabled
- Security headers added
- Rate limiting configured
- Caching enabled
