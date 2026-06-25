#!/bin/bash
# Validate Docker files
# Exit early if not a Dockerfile

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "Dockerfile" ]]; then
  exit 0
fi

# Check for best practices
if grep -q "RUN apt-get update && apt-get install" "$FILEPATH" 2>/dev/null; then
  echo "TIP: Consider using multi-stage builds to reduce image size."
fi

if grep -q "EXPOSE" "$FILEPATH" 2>/dev/null; then
  echo "TIP: Document exposed ports in README."
fi

exit 0
