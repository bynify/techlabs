#!/bin/bash
# Validate git commit commands
# Exit early if not a git commit

if [[ ! "$CLAUDE_TOOL_INPUT" =~ "git commit" ]]; then
  exit 0
fi

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[COMMIT VALIDATION]${NC} Running checks..."

# 1. Check for hardcoded secrets
SECRETS_FOUND=0
if grep -rE "(password|secret|key|token|api_key|apikey)\s*[:=]\s*['\"][^'\"]+['\"]" src/ 2>/dev/null; then
  echo -e "${RED}[ERROR] Potential hardcoded secrets found in code!${NC}"
  echo "Please use environment variables instead."
  SECRETS_FOUND=1
fi

if [[ $SECRETS_FOUND -eq 1 ]]; then
  exit 1
fi

# 2. Check TODO format
TODOS=$(grep -rn "// TODO" src/ 2>/dev/null | grep -v "TODO(username):" | head -5)
if [[ -n "$TODOS" ]]; then
  echo -e "${YELLOW}[WARNING] TODOs should follow format: // TODO(username): description${NC}"
  echo "$TODOS"
fi

# 3. Check for empty error messages
EMPTY_ERRORS=$(grep -rn "fmt.Errorf(\"\")" src/ 2>/dev/null | head -5)
if [[ -n "$EMPTY_ERRORS" ]]; then
  echo -e "${YELLOW}[WARNING] Empty error messages found:${NC}"
  echo "$EMPTY_ERRORS"
fi

# 4. Check for println in production code
PRINTFS=$(grep -rn "fmt.Println" src/ 2>/dev/null | grep -v "_test.go" | head -5)
if [[ -n "$PRINTFS" ]]; then
  echo -e "${YELLOW}[WARNING] fmt.Println found in production code. Use logger instead.${NC}"
  echo "$PRINTFS"
fi

# 5. Validate JSON files
for file in $(git diff --cached --name-only | grep "\.json$" | head -10); do
  if [[ -f "$file" ]]; then
    if ! python3 -m json.tool "$file" > /dev/null 2>&1; then
      echo -e "${RED}[ERROR] Invalid JSON: $file${NC}"
      exit 1
    fi
  fi
done

echo -e "${GREEN}[COMMIT VALIDATION]${NC} All checks passed!"
exit 0
