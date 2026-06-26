# Backend Stack Reference

Backend technology options and deployment targets.

## Backend Frameworks

### Go

| Framework | Type | Performance | Learning Curve |
|-----------|------|-------------|----------------|
| Gin | HTTP | High | Low |
| Echo | HTTP | High | Low |
| Fiber | HTTP | Very High | Low |
| gRPC | RPC | Very High | Medium |

```bash
# Initialize Go project
go mod init github.com/myorg/myapp

# Install dependencies
go get github.com/gin-gonic/gin
go get gorm.io/gorm
```

### Python

| Framework | Type | Performance | Learning Curve |
|-----------|------|-------------|----------------|
| FastAPI | HTTP | High | Low |
| Django | Full-stack | Medium | Medium |
| Flask | HTTP | Medium | Low |

```bash
# Initialize Python project
python -m venv venv
source venv/bin/activate

# Install dependencies
pip install fastapi uvicorn sqlalchemy
```

### Rust

| Framework | Type | Performance | Learning Curve |
|-----------|------|-------------|----------------|
| Actix | HTTP | Very High | High |
| Axum | HTTP | Very High | High |
| Rocket | HTTP | High | Medium |

### Node.js

| Framework | Type | Performance | Learning Curve |
|-----------|------|-------------|----------------|
| Express | HTTP | Medium | Low |
| Fastify | HTTP | High | Low |
| Hono | HTTP | High | Low |

## Database Options

### PostgreSQL

```bash
# Docker
docker run -d --name postgres \
  -e POSTGRES_USER=user \
  -e POSTGRES_PASSWORD=pass \
  -e POSTGRES_DB=myapp \
  -p 5432:5432 \
  postgres:16-alpine

# Cloudflare D1 (SQLite)
wrangler d1 create my-database

# Managed
- AWS RDS
- GCP Cloud SQL
- Neon
- Supabase
- PlanetScale
```

### Redis

```bash
# Docker
docker run -d --name redis \
  -p 6379:6379 \
  redis:7-alpine

# Cloudflare KV
wrangler kv namespace create CACHE

# Managed
- Upstash
- Redis Cloud
- AWS ElastiCache
```

## Messaging Options

### Kafka

```bash
# Docker Compose
docker-compose up -d kafka

# Cloudflare (N/A - use Workers for event handling)
```

### RabbitMQ

```bash
# Docker
docker run -d --name rabbitmq \
  -p 5672:5672 \
  -p 15672:15672 \
  rabbitmq:3-management
```

### NATS

```bash
# Docker
docker run -d --name nats \
  -p 4222:4222 \
  nats:latest
```

### Cloudflare Queues

```bash
# Create queue
wrangler queues create my-queue
```

## Deployment Targets

### Cloudflare Workers (Serverless)

```bash
# Create worker
npm create cloudflare@latest my-worker

# Deploy
wrangler deploy
```

### Docker

```bash
# Build
docker build -t myapp .

# Run
docker run -p 8080:8080 myapp
```

### Kubernetes

```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: myapp:latest
        ports:
        - containerPort: 8080
```

### Vercel

```json
{
  "version": 2,
  "builds": [
    {
      "src": "src/index.js",
      "use": "@vercel/node"
    }
  ]
}
```

### Railway

```toml
# railway.toml
[build]
builder = "nixpacks"

[deploy]
startCommand = "npm start"
healthcheckPath = "/health"
```

## Stack Recommendations

### SaaS Web App
```
Frontend: Next.js + Tailwind + shadcn/ui
Backend: Cloudflare Workers + Hono
Database: Cloudflare D1
Cache: Cloudflare KV
Auth: Better Auth / Lucia
Hosting: Cloudflare Pages + Workers
```

### API Service
```
Backend: Go + Gin/Fiber
Database: PostgreSQL
Cache: Redis
Messaging: NATS
Hosting: Docker + K8s
```

### Real-time App
```
Frontend: Next.js/React
Backend: Go/Python
Database: PostgreSQL
Real-time: NATS/WebSockets
Cache: Redis
Hosting: Cloudflare Workers
```

### Data Platform
```
Backend: Python + FastAPI
Database: PostgreSQL + dbt
ETL: Apache Airflow
Storage: S3/R2
Hosting: Docker + K8s
```
