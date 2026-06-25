#!/bin/bash
# Validate environment variables
# Exit early if not relevant

if [[ ! "$CLAUDE_TOOL_INPUT" =~ "env" ]]; then
  exit 0
fi

# Check for .env files in git
if git ls-files | grep -q "\.env$"; then
  echo "WARNING: .env files should not be tracked in git."
fi

exit 0
