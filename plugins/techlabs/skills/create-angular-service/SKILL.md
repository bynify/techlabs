# create-angular-service

Create Angular service with dependency injection and HTTP client.

## When to Use
- API communication
- Shared state management
- Business logic encapsulation

## Execution

### Step 1: Create Service
```typescript
// src/app/services/user.service.ts
import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { API_URL } from '../tokens';

@Injectable({ providedIn: 'root' })
export class UserService {
  private http = inject(HttpClient);
  private api = inject(API_URL);

  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(`${this.api}/users`);
  }

  getUserById(id: string): Observable<User> {
    return this.http.get<User>(`${this.api}/users/${id}`);
  }

  createUser(data: CreateUserRequest): Observable<User> {
    return this.http.post<User>(`${this.api}/users`, data);
  }

  updateUser(id: string, data: Partial<User>): Observable<User> {
    return this.http.patch<User>(`${this.api}/users/${id}`, data);
  }

  deleteUser(id: string): Observable<void> {
    return this.http.delete<void>(`${this.api}/users/${id}`);
  }
}
```

### Step 2: Add Interceptors
```typescript
// src/app/interceptors/error.interceptor.ts
import { HttpInterceptorFn } from '@angular/common/http';
import { catchError, throwError } from 'rxjs';

export const errorInterceptor: HttpInterceptorFn = (req, next) => {
  return next(req).pipe(
    catchError((error) => {
      if (error.status === 401) {
        // Handle unauthorized
      }
      return throwError(() => error);
    })
  );
};
```

## Output
- Service file
- Interceptors
- Type definitions
