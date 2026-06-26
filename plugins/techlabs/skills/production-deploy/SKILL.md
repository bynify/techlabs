# production-deploy

Deploy application to production with full setup.

## When to Use
- Going live
- Production deployment
- Full infrastructure setup

## What This Does

Chains 5 skills:

```
FLOW:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STEP 1: /create-dockerfile
  → Containerize application

STEP 2: /create-ci-cd
  → Setup CI/CD pipeline

STEP 3: /setup-loadbalancer
  → Configure load balancing

STEP 4: /setup-reverse-proxy
  → SSL, caching, security headers

STEP 5: /release-checklist
  → Final deployment checklist
```

## Execution

### Step 1: Containerize
```
RUN /create-dockerfile

→ Multi-stage build
→ Security best practices
→ Health checks

CHECKPOINT:
"Dockerfile created. Continue to CI/CD?"
```

### Step 2: CI/CD Pipeline
```
RUN /create-ci-cd

→ GitHub Actions workflow
→ Test, build, deploy stages

CHECKPOINT:
"CI/CD configured. Continue to load balancer?"
```

### Step 3: Load Balancer
```
RUN /setup-loadbalancer

→ Choose: Nginx, Caddy, Cloudflare, etc.
→ Health checks
→ SSL termination

CHECKPOINT:
"Load balancer configured. Continue to reverse proxy?"
```

### Step 4: Reverse Proxy
```
RUN /setup-reverse-proxy

→ SSL certificates
→ Caching rules
→ Rate limiting
→ Security headers

CHECKPOINT:
"Reverse proxy configured. Continue to release checklist?"
```

### Step 5: Release Checklist
```
RUN /release-checklist

→ Final checks
→ Deploy to production
→ Monitor
```

## Output
- Application containerized
- CI/CD pipeline ready
- Load balancer configured
- SSL enabled
- Production live
