#!/bin/bash
# Validate schema files
# Exit early if not a schema file

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "\.schema\." ]]; then
  exit 0
fi

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[SCHEMA VALIDATION]${NC} Validating schema..."

# Validate JSON schema
if [[ -f "$FILEPATH" ]]; then
  if ! python3 -m json.tool "$FILEPATH" > /dev/null 2>&1; then
    echo -e "${RED}[ERROR] Invalid JSON in schema file: $FILEPATH${NC}"
    exit 1
  fi
fi

echo -e "${GREEN}[SCHEMA VALIDATION]${NC} Schema is valid!"
exit 0
