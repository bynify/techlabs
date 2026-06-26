# create-dockerfile

Create optimized Dockerfiles with multi-stage builds and security best practices.

## When to Use
- Containerizing applications
- CI/CD pipeline setup
- Production deployment
- Development environments

## Knowledge Base Reference
```
⚠️ BEFORE IMPLEMENTATION: Load knowledge base

LOAD FROM:
- production/knowledge-base/infrastructure/docker.md
- production/knowledge-base/infrastructure/deployment.md

USE FOR:
- Docker best practices
- Multi-stage builds
- Security patterns
- Health checks
- Optimization patterns
```

## Execution

### Step 1: Detect Language/Framework
```
SCAN:
- go.mod → Go
- package.json → Node.js
- requirements.txt → Python
- Cargo.toml → Rust
- pom.xml → Java
```

### Step 2: Create Multi-Stage Dockerfile
```dockerfile
# Go Example
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /server ./cmd/server

FROM alpine:3.19
RUN apk --no-cache add ca-certificates tzdata
RUN adduser -D -u 1001 appuser
WORKDIR /app
COPY --from=builder /server .
USER appuser
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:8080/health || exit 1
ENTRYPOINT ["./server"]
```

```dockerfile
# Node.js Example
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine
RUN addgroup -g 1001 -S appuser && adduser -S appuser -u 1001
WORKDIR /app
COPY --from=builder --chown=appuser:appuser /app/dist ./dist
COPY --from=builder --chown=appuser:appuser /app/node_modules ./node_modules
COPY --from=builder --chown=appuser:appuser /app/package.json ./
USER appuser
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:3000/health || exit 1
CMD ["node", "dist/index.js"]
```

```dockerfile
# Python Example
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

FROM python:3.12-slim
RUN useradd -m appuser
WORKDIR /app
COPY --from=builder /home/appuser/.local /home/appuser/.local
COPY . .
USER appuser
ENV PATH=/home/appuser/.local/bin:$PATH
EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=3s CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')" || exit 1
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

### Step 3: Create .dockerignore
```dockerignore
.git
node_modules
vendor
__pycache__
*.md
.env
.env.*
dist
build
coverage
.nyc_output
```

### Step 4: Security Best Practices
```
CHECK:
- [ ] Non-root user configured
- [ ] No secrets in image layers
- [ ] Minimal base image (alpine/slim)
- [ ] Health check defined
- [ ] Read-only filesystem where possible
```

### Step 5: Validate
```bash
# Build
docker build -t app .

# Run
docker run --rm -p 8080:8080 app

# Check size
docker images app
# Target: <100MB for Go, <200MB for Node.js
```

## Output
- Multi-stage Dockerfile
- .dockerignore
- Health check configured
- Security best practices
