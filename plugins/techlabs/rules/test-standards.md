# Test Standards

Applies to: `src/tests/**`

## Requirements
- Test naming convention: `TestXxx` or `test_xxx`
- Required coverage threshold (80% minimum)
- Proper test fixtures
- Mock external dependencies
- No flaky tests

## Patterns
- Use table-driven tests (Go)
- Use test fixtures and factories
- Mock external services
- Use test helpers for common setup

## Anti-patterns
- Do not test implementation details
- Do not use shared mutable state
- Do not skip cleanup
