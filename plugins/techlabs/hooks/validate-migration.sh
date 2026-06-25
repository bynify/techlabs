#!/bin/bash
# Validate database migrations
# Exit early if not a migration file

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "migration" ]]; then
  exit 0
fi

# Check for rollback
if [[ -f "$FILEPATH" ]]; then
  if ! grep -q "down\|rollback\|revert" "$FILEPATH"; then
    echo "WARNING: Migration should include rollback instructions."
  fi
fi

exit 0
