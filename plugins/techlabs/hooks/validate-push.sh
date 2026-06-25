#!/bin/bash
# Validate git push commands
# Exit early if not a git push

if [[ ! "$CLAUDE_TOOL_INPUT" =~ "git push" ]]; then
  exit 0
fi

# Check for protected branches
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [[ "$BRANCH" == "main" || "$BRANCH" == "master" || "$BRANCH" == "production" ]]; then
  echo "WARNING: Pushing to protected branch '$BRANCH'. Consider creating a PR."
fi

exit 0
