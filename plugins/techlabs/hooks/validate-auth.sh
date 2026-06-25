#!/bin/bash
# Validate authentication code
# Exit early if not in auth directory

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "src/auth" ]]; then
  exit 0
fi

# Check for hardcoded secrets
if grep -qE "(password|secret|key|token)\s*[:=]\s*['\"][^'\"]+['\"]" "$FILEPATH" 2>/dev/null; then
  echo "WARNING: Hardcoded secrets detected. Use environment variables instead."
fi

exit 0
