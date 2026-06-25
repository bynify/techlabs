#!/bin/bash
# Validate AI/ML code
# Exit early if not in AI directory

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "src/ai" ]]; then
  exit 0
fi

# Check for cost limits
if grep -q "max_tokens" "$FILEPATH" 2>/dev/null; then
  echo "TIP: Consider setting cost limits and monitoring."
fi

exit 0
