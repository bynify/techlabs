#!/bin/bash
# Validate event-driven code
# Exit early if not in events directory

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "src/events" ]]; then
  exit 0
fi

# Colors
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[EVENT VALIDATION]${NC} Checking event code..."

# 1. Check for event versioning
if [[ -f "$FILEPATH" ]]; then
  if ! grep -qi "version\|schema_version\|event_version" "$FILEPATH"; then
    echo -e "${YELLOW}[TIP] Consider adding event versioning for backward compatibility.${NC}"
  fi
fi

# 2. Check for event metadata
if [[ -f "$FILEPATH" ]]; then
  if grep -q "func.*event\|func.*Event" "$FILEPATH"; then
    if ! grep -qi "timestamp\|created_at\|metadata" "$FILEPATH"; then
      echo -e "${YELLOW}[TIP] Events should include metadata (timestamp, source, correlation_id).${NC}"
    fi
  fi
fi

echo -e "${GREEN}[EVENT VALIDATION]${NC} Validation complete!"
exit 0
