# Authentication Code Rules

Applies to: `src/auth/**`

## Requirements
- No hardcoded secrets (use environment variables)
- Token rotation support
- Audit logging for all auth events
- MFA support
- Session management

## Patterns
- Use JWT with proper expiry
- Use refresh token rotation
- Log all authentication attempts
- Validate tokens on every request

## Anti-patterns
- Do not store passwords in plaintext
- Do not use weak hashing (use bcrypt/argon2)
- Do not skip token validation
- Do not log sensitive data
