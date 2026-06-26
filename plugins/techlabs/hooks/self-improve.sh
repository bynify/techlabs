#!/bin/bash
# Auto self-improvement hook
# Detects patterns and suggests improvements after errors

ERROR_LOG=".claude/errors/error-log.yaml"
PATTERNS_FILE=".claude/errors/patterns.json"
IMPROVEMENTS_LOG=".claude/improvements/log.yaml"

# Create directories if they don't exist
mkdir -p .claude/errors .claude/improvement .claude/analytics .claude/patterns

# Check if error log exists
if [[ ! -f "$ERROR_LOG" ]]; then
  echo "error:|$1|$(date -u +%Y-%m-%dT%H:%M:%SZ)|$2" >> "$ERROR_LOG"
  exit 0
fi

# Count errors in current session
ERROR_COUNT=$(grep -c "error:|" "$ERROR_LOG" 2>/dev/null || echo "0")

# Every 5 errors, suggest analysis
if [ $((ERROR_COUNT % 5)) -eq 0 ] && [ "$ERROR_COUNT" -gt 0 ]; then
  echo "TIP: $ERROR_COUNT errors logged. Run /error-learn to analyze patterns"
fi

# Every 10 errors, trigger auto-improve
if [ $((ERROR_COUNT % 10)) -eq 0 ] && [ "$ERROR_COUNT" -gt 0 ]; then
  echo "TIP: Run /auto-improve to enhance skills based on error patterns"
fi

# Track error frequency
CURRENT_HOUR=$(date +%H)
echo "${CURRENT_HOUR}:1" >> .claude/analytics/error-frequency.txt

exit 0
