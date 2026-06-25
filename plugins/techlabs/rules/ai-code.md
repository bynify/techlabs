# AI/ML Code Rules

Applies to: `src/ai/**`

## Requirements
- Prompt versioning
- Cost tracking and limits
- Fallback patterns (model failures)
- Evaluation metrics
- Rate limiting for API calls

## Patterns
- Use structured prompts with clear instructions
- Implement retry with exponential backoff
- Track token usage and costs
- Cache responses when possible

## Anti-patterns
- Do not skip cost monitoring
- Do not use infinite loops for retries
- Do not expose API keys in code
