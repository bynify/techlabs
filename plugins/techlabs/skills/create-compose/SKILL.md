# create-compose

Create docker-compose.yml for local development with service orchestration.

## When to Use
- Local development setup
- Multi-service applications
- Database + cache setup
- Testing environments

## Execution

### Step 1: Identify Services
```
ASK USER:
1. What services needed?
2. Databases? (Postgres, MySQL, MongoDB)
3. Caches? (Redis, Memcached)
4. Message queues? (RabbitMQ, Kafka)
5. Storage? (MinIO, local volumes)
```

### Step 2: Create docker-compose.yml
```yaml
version: '3.8'

services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=postgres://user:pass@db:5432/app
      - REDIS_URL=redis://redis:6379
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
    volumes:
      - .:/app
      - /app/node_modules
    healthcheck:
      test: ["CMD", "wget", "-qO-", "http://localhost:3000/health"]
      interval: 10s
      timeout: 3s
      retries: 3

  db:
    image: postgres:16-alpine
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=pass
      - POSTGRES_DB=app
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user -d app"]
      interval: 5s
      timeout: 3s
      retries: 5

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    command: redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru
    volumes:
      - redis_data:/data

volumes:
  postgres_data:
  redis_data:
```

### Step 3: Add Development Tools
```yaml
services:
  adminer:
    image: adminer
    ports:
      - "8080:8080"
    depends_on:
      - db

  mailhog:
    image: mailhog/mailhog
    ports:
      - "1025:1025"  # SMTP
      - "8025:8025"  # Web UI

  minio:
    image: minio/minio
    ports:
      - "9000:9000"
      - "9001:9001"
    command: server /data --console-address ":9001"
    volumes:
      - minio_data:/data
```

### Step 4: Environment Files
```docker-compose.override.yml
version: '3.8'

services:
  app:
    environment:
      - NODE_ENV=development
      - DEBUG=true
    volumes:
      - ./src:/app/src
```

```docker-compose.prod.yml
version: '3.8'

services:
  app:
    build:
      context: .
      target: production
    environment:
      - NODE_ENV=production
```

### Step 5: Useful Commands
```bash
# Start all services
docker-compose up -d

# Start with logs
docker-compose up

# Rebuild
docker-compose up --build

# Stop and remove
docker-compose down

# Stop and remove volumes
docker-compose down -v

# View logs
docker-compose logs -f app

# Run commands
docker-compose exec app npm test
docker-compose exec db psql -U user app
```

### Step 6: Validate
```bash
# Check config
docker-compose config

# Test build
docker-compose build

# Test run
docker-compose up -d
docker-compose ps
docker-compose logs app
```

## Output
- docker-compose.yml
- docker-compose.override.yml
- .env file template
- Development tools configured
