#!/bin/bash
# Validate frontend code
# Exit early if not in frontend directory

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "src/frontend" ]]; then
  exit 0
fi

# Colors
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[FRONTEND VALIDATION]${NC} Checking frontend code..."

# 1. Check for accessibility
if [[ -f "$FILEPATH" ]]; then
  if grep -q "onClick" "$FILEPATH"; then
    if ! grep -q "onKeyDown\|onKeyPress\|aria-\|role=" "$FILEPATH"; then
      echo -e "${YELLOW}[A11Y] Consider adding keyboard handlers for accessibility.${NC}"
    fi
  fi
fi

# 2. Check for console.log in production
if [[ -f "$FILEPATH" ]]; then
  CONSOLE_LOGS=$(grep -n "console.log\|console.debug\|console.info" "$FILEPATH" | head -5)
  if [[ -n "$CONSOLE_LOGS" ]]; then
    echo -e "${YELLOW}[WARNING] Console statements found in production code:${NC}"
    echo "$CONSOLE_LOGS"
  fi
fi

# 3. Check for 'any' types in TypeScript
if [[ "$FILEPATH" == *.ts || "$FILEPATH" == *.tsx ]]; then
  ANY_TYPES=$(grep -n ": any\|<any>" "$FILEPATH" | head -5)
  if [[ -n "$ANY_TYPES" ]]; then
    echo -e "${YELLOW}[WARNING] 'any' type usage found. Use proper types instead:${NC}"
    echo "$ANY_TYPES"
  fi
fi

echo -e "${GREEN}[FRONTEND VALIDATION]${NC} Validation complete!"
exit 0
