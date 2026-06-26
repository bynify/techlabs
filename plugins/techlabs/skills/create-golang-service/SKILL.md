# create-golang-service

Create Go HTTP service with proper structure, middleware, and testing.

## When to Use

## Agents to Dispatch
- go-specialist: Go implementation
- lead-engineer: Code standards
- API services
- Microservices
- Backend services

## Execution

### Step 1: Project Structure
```
src/backend/
├── cmd/server/main.go
├── internal/
│   ├── handler/      # HTTP handlers
│   ├── service/      # Business logic
│   ├── repository/   # Data access
│   └── domain/       # Models
├── pkg/              # Shared utilities
└── go.mod
```

### Step 2: Main Entry
```go
// cmd/server/main.go
package main

import (
    "log"
    "net/http"
    "os"
)

func main() {
    db, err := setupDB()
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    repo := repository.New(db)
    svc := service.New(repo)
    handler := handler.New(svc)

    mux := http.NewServeMux()
    mux.HandleFunc("GET /api/users", handler.ListUsers)
    mux.HandleFunc("POST /api/users", handler.CreateUser)
    mux.HandleFunc("GET /api/users/{id}", handler.GetUser)

    port := os.Getenv("PORT")
    if port == "" {
        port = "8080"
    }
    log.Fatal(http.ListenAndServe(":"+port, mux))
}
```

### Step 3: Handler Pattern
```go
// internal/handler/users.go
func (h *Handler) ListUsers(w http.ResponseWriter, r *http.Request) {
    users, err := h.svc.ListUsers(r.Context())
    if err != nil {
        respond.Error(w, http.StatusInternalServerError, "failed to list users")
        return
    }
    respond.JSON(w, http.StatusOK, users)
}
```

## Output
- Service scaffold
- Handler pattern
- Repository pattern
- Test setup
