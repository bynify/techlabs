# create-react-form

Create a React form with validation, error handling, and submission logic.

## When to Use
- Building forms for data input (login, signup, contact, checkout)
- Need form validation and error display
- Form submits to API endpoint

## Execution

### Step 1: Gather Requirements
```
ASK USER:
- Form purpose? (login, signup, contact, checkout, etc.)
- Fields needed? (name, email, password, etc.)
- Validation rules per field?
- Submit endpoint? (POST /api/auth/login)
- Success action? (redirect, toast, reset form)
```

### Step 2: Create Zod Schema
```ts
// src/lib/validations/{form-name}.ts
import { z } from 'zod';

export const loginSchema = z.object({
  email: z.string().email('Email tidak valid'),
  password: z.string().min(8, 'Password minimal 8 karakter'),
});

export const signupSchema = z.object({
  name: z.string().min(2, 'Nama minimal 2 karakter'),
  email: z.string().email('Email tidak valid'),
  password: z
    .string()
    .min(8, 'Password minimal 8 karakter')
    .regex(/[A-Z]/, 'Harus mengandung huruf besar')
    .regex(/[0-9]/, 'Harus mengandung angka'),
  confirmPassword: z.string(),
}).refine((data) => data.password === data.confirmPassword, {
  message: 'Password tidak cocok',
  path: ['confirmPassword'],
});

export type LoginInput = z.infer<typeof loginSchema>;
export type SignupInput = z.infer<typeof signupSchema>;
```

### Step 3: Create Form Component
```tsx
// src/components/forms/{FormName}Form.tsx
'use client';

import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { loginSchema, type LoginInput } from '@/lib/validations/auth';

interface {FormName}FormProps {
  onSuccess: (data: unknown) => void;
}

export function {FormName}Form({ onSuccess }: {FormName}FormProps) {
  const [serverError, setServerError] = useState<string | null>(null);

  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<LoginInput>({
    resolver: zodResolver(loginSchema),
  });

  const onSubmit = async (data: LoginInput) => {
    setServerError(null);

    try {
      const response = await fetch('/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.message || 'Terjadi kesalahan');
      }

      const result = await response.json();
      onSuccess(result);
    } catch (error) {
      setServerError(error instanceof Error ? error.message : 'Terjadi kesalahan');
    }
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      {serverError && (
        <div className="p-3 bg-red-50 border border-red-200 rounded text-red-700 text-sm">
          {serverError}
        </div>
      )}

      <div className="space-y-1">
        <label className="block text-sm font-medium">Email</label>
        <input
          type="email"
          {...register('email')}
          className="w-full px-3 py-2 border rounded-md"
        />
        {errors.email && <p className="text-sm text-red-500">{errors.email.message}</p>}
      </div>

      <div className="space-y-1">
        <label className="block text-sm font-medium">Password</label>
        <input
          type="password"
          {...register('password')}
          className="w-full px-3 py-2 border rounded-md"
        />
        {errors.password && <p className="text-sm text-red-500">{errors.password.message}</p>}
      </div>

      <button
        type="submit"
        disabled={isSubmitting}
        className="w-full py-2 bg-blue-600 text-white rounded-md disabled:opacity-50"
      >
        {isSubmitting ? 'Memproses...' : 'Masuk'}
      </button>
    </form>
  );
}
```

### Step 4: Create API Route
```ts
// src/app/api/auth/login/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { loginSchema } from '@/lib/validations/auth';

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { email, password } = loginSchema.parse(body);

    const user = await authService.authenticate(email, password);

    return NextResponse.json({ user, token: user.token });
  } catch (error) {
    if (error instanceof z.ZodError) {
      return NextResponse.json({ errors: error.errors }, { status: 400 });
    }
    return NextResponse.json({ message: 'Email atau password salah' }, { status: 401 });
  }
}
```

## Output
- Zod validation schema
- Form component with react-hook-form
- Error handling (client + server)
- Loading states
- API route handler
