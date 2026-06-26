# setup-loadbalancer

Configure load balancing for high availability and traffic distribution.

## When to Use
- Multiple backend servers
- High availability setup
- Traffic distribution
- Zero-downtime deployments

## Agents to Dispatch
- devops-lead: Load balancer architecture
- docker-specialist: Container load balancing
- cloudflare-specialist: Cloudflare load balancing

## Load Balancer Options

```
LOAD BALANCER COMPARISON:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

OPTION 1: Cloudflare Load Balancer (Managed)
  - Type: Cloud-native
  - Features: Global, DDoS protection, health checks
  - Cost: $5/month + traffic
  - Best for: Global apps, serverless

OPTION 2: Nginx (Self-hosted)
  - Type: Software
  - Features: L7, SSL termination, caching
  - Cost: Free
  - Best for: Traditional deployments

OPTION 3: Caddy (Self-hosted)
  - Type: Software
  - Features: Auto HTTPS, L7, easy config
  - Cost: Free
  - Best for: Simple setups, auto HTTPS

OPTION 4: Traefik (Docker-native)
  - Type: Software
  - Features: Docker discovery, Let's Encrypt
  - Cost: Free
  - Best for: Docker/Kubernetes

OPTION 5: HAProxy (Self-hosted)
  - Type: Software
  - Features: L4/L7, high performance
  - Cost: Free
  - Best for: High traffic, TCP load balancing

OPTION 6: AWS ALB/NLB (Managed)
  - Type: Cloud-native
  - Features: Integration with AWS services
  - Cost: Pay per usage
  - Best for: AWS deployments

OPTION 7: DigitalOcean Load Balancer (Managed)
  - Type: Cloud-native
  - Features: Simple setup, SSL termination
  - Cost: $12/month
  - Best for: DigitalOcean deployments
```

## Execution

### Step 1: Determine Load Balancing Needs
```
ASK USER:
1. How many backend servers?
2. What protocol? (HTTP, TCP, UDP)
3. Need SSL termination?
4. Need sticky sessions?
5. Global or single region?
6. Budget constraints?
```

### Step 2: Nginx Load Balancer
```nginx
# /etc/nginx/nginx.conf

http {
    # Load balancing upstream
    upstream backend {
        least_conn;  # or round_robin, ip_hash
        
        server backend1.example.com:8080 weight=3;
        server backend2.example.com:8080 weight=2;
        server backend3.example.com:8080 weight=1 backup;
    }
    
    # Rate limiting
    limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
    
    # Server block
    server {
        listen 443 ssl http2;
        server_name api.example.com;
        
        # SSL
        ssl_certificate /etc/ssl/certs/example.com.pem;
        ssl_certificate_key /etc/ssl/private/example.com.key;
        
        # Proxy to load balancer
        location / {
            proxy_pass http://backend;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            
            # Health check
            proxy_next_upstream error timeout http_502 http_503;
            proxy_connect_timeout 5s;
            proxy_read_timeout 30s;
        }
        
        # Rate limiting
        location /api/ {
            limit_req zone=api burst=20 nodelay;
            proxy_pass http://backend;
        }
    }
}
```

### Step 3: Caddy Load Balancer
```caddy
# Caddyfile

# Load balancing
api.example.com {
    reverse_proxy backend1:8080 backend2:8080 backend3:8080 {
        lb_policy least_conn
        lb_health_uri /health
        lb_health_interval 10s
        
        # Headers
        header_up X-Real-IP {remote_host}
        header_up X-Forwarded-For {remote_host}
    }
    
    # Auto HTTPS (built-in)
    tls admin@example.com
}

# Multiple backends with weights
dashboard.example.com {
    reverse_proxy {
        to backend1:3000 weight=2
        to backend2:3000 weight=1
    }
}
```

### Step 4: Traefik Load Balancer (Docker)
```yaml
# docker-compose.yml
version: '3.8'

services:
  traefik:
    image: traefik:v2.10
    command:
      - "--api.insecure=true"
      - "--providers.docker=true"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"
      - "--certificatesresolvers.letsencrypt.acme.tlschallenge=true"
      - "--certificatesresolvers.letsencrypt.acme.email=admin@example.com"
      - "--certificatesresolvers.letsencrypt.acme.storage=/letsencrypt/acme.json"
    ports:
      - "80:80"
      - "443:443"
      - "8080:8080"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./letsencrypt:/letsencrypt

  app1:
    image: myapp:latest
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app.rule=Host(`app.example.com`)"
      - "traefik.http.routers.app.tls.certresolver=letsencrypt"
      - "traefik.http.services.app.loadbalancer.server.port=3000"

  app2:
    image: myapp:latest
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app.rule=Host(`app.example.com`)"
      - "traefik.http.services.app.loadbalancer.server.port=3000"
```

### Step 5: Cloudflare Load Balancer
```bash
# Create load balancer via API
curl -X POST "https://api.cloudflare.com/client/v4/zones/{zone_id}/load_balancers" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  --data '{
    "name": "app.example.com",
    "fallback_pool": "fallback-pool-id",
    "default_pools": ["pool-1-id", "pool-2-id"],
    "session_affinity": "none",
    "ttl": 60,
    "steering_policy": "least_outstanding_requests"
  }'

# Create origin pool
curl -X POST "https://api.cloudflare.com/client/v4/zones/{zone_id}/load_balancers/pools" \
  -H "Authorization: Bearer {api_token}" \
  -H "Content-Type: application/json" \
  --data '{
    "name": "pool-1",
    "origins": [
      {"name": "server1", "address": "192.0.2.1", "enabled": true},
      {"name": "server2", "address": "192.0.2.2", "enabled": true}
    ],
    "minimum_origins": 1,
    "monitor": "monitor-id"
  }'
```

### Step 6: Health Check Configuration
```yaml
# Health check endpoints
health_checks:
  - endpoint: /health
    method: GET
    interval: 10s
    timeout: 5s
    healthy_threshold: 2
    unhealthy_threshold: 3
  
  - endpoint: /ready
    method: GET
    interval: 30s
    timeout: 10s
```

### Step 7: Load Balancer Documentation
```markdown
# Load Balancer Configuration

## Backend Servers
| Server | Address | Weight | Status |
|--------|---------|--------|--------|
| server1 | 192.0.2.1:8080 | 3 | ✅ Active |
| server2 | 192.0.2.2:8080 | 2 | ✅ Active |
| server3 | 192.0.2.3:8080 | 1 | ⚠️ Backup |

## Health Checks
- Endpoint: /health
- Interval: 10 seconds
- Timeout: 5 seconds
- Unhealthy after: 3 failures

## SSL/TLS
- Certificate: Let's Encrypt
- Auto-renewal: Enabled
- Protocol: TLS 1.2+

## Monitoring
- Connection count: /metrics
- Request rate: /metrics
- Error rate: /metrics
```

## Output
- Load balancer configured
- Backend servers configured
- Health checks enabled
- SSL/TLS configured
- Monitoring setup
