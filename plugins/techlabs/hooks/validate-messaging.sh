#!/bin/bash
# Validate messaging code
# Exit early if not in messaging directory

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "src/messaging" ]]; then
  exit 0
fi

# Colors
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[MESSAGING VALIDATION]${NC} Checking messaging code..."

# 1. Check for dead letter configuration
if [[ -f "$FILEPATH" ]]; then
  if ! grep -qi "dead.letter\|dlq\|dead_letter\|DeadLetter" "$FILEPATH"; then
    echo -e "${YELLOW}[TIP] Consider configuring dead letter queues for failed messages.${NC}"
  fi
fi

# 2. Check for idempotency
if [[ -f "$FILEPATH" ]]; then
  if ! grep -qi "idempoten\|Idempotent" "$FILEPATH"; then
    echo -e "${YELLOW}[TIP] Consider adding idempotency for message processing.${NC}"
  fi
fi

# 3. Check for error handling
if [[ -f "$FILEPATH" ]]; then
  if grep -q "func.*consumer\|func.*Consumer" "$FILEPATH"; then
    if ! grep -qi "error\|err\|Error" "$FILEPATH"; then
      echo -e "${YELLOW}[TIP] Consumer functions should handle errors.${NC}"
    fi
  fi
fi

echo -e "${GREEN}[MESSAGING VALIDATION]${NC} Validation complete!"
exit 0
