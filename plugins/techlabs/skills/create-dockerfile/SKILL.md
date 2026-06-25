# create-dockerfile

Create optimized Dockerfile.

## Execution

### Step 1: Detect Language/Framework
```
SCAN:
- go.mod → Go
- package.json → Node.js
- requirements.txt → Python
- Cargo.toml → Rust
```

### Step 2: Create Multi-Stage Dockerfile
```
IF Go:
  CREATE Dockerfile:
  # Build stage
  FROM golang:1.22-alpine AS builder
  WORKDIR /app
  COPY go.mod go.sum ./
  RUN go mod download
  COPY . .
  RUN CGO_ENABLED=0 go build -o /app/server ./cmd/server
  
  # Runtime stage
  FROM alpine:latest
  RUN apk --no-cache add ca-certificates
  COPY --from=builder /app/server /app/server
  EXPOSE 8080
  ENTRYPOINT ["/app/server"]

IF Node.js:
  CREATE Dockerfile:
  # Build stage
  FROM node:20-alpine AS builder
  WORKDIR /app
  COPY package*.json ./
  RUN npm ci
  COPY . .
  RUN npm run build
  
  # Runtime stage
  FROM node:20-alpine
  WORKDIR /app
  COPY --from=builder /app/dist ./dist
  COPY --from=builder /app/node_modules ./node_modules
  COPY --from=builder /app/package.json ./
  EXPOSE 3000
  CMD ["npm", "start"]
```

### Step 3: Create .dockerignore
```
CREATE .dockerignore:
.git
node_modules
vendor
*.md
.env
```

### Step 4: Create docker-compose.yml (if needed)
```
CREATE docker-compose.yml:
version: '3.8'
services:
  app:
    build: .
    ports:
      - "8080:8080"
    environment:
      - DATABASE_URL=postgres://user:pass@db:5432/app
    depends_on:
      - db
  
  db:
    image: postgres:16
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=pass
      - POSTGRES_DB=app
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

### Step 5: Validate
```
RUN:
- docker build -t app .
- docker run --rm app
- Verify health checks
- Check image size
```

## Output
- Created Dockerfile
- Created .dockerignore
- Created docker-compose.yml (if needed)
- Build tested
