#!/bin/bash
# Validate skill changes
# Exit early if not in skills directory

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ ".claude/skills" ]]; then
  exit 0
fi

echo "TIP: Consider running /skill-test to validate skill changes."

exit 0
