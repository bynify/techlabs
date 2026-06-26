#!/bin/bash
# Auto-trigger session optimization when health is bad

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
STATE_FILE="${PLUGIN_ROOT}/production/session/state.json"

# Check if state file exists
if [ ! -f "$STATE_FILE" ]; then
  exit 0
fi

# Read state
STATE=$(cat "$STATE_FILE" 2>/dev/null)
if [ -z "$STATE" ]; then
  exit 0
fi

# Extract metrics (simplified - in real implementation would parse JSON)
TOKEN_USAGE=$(echo "$STATE" | grep -o '"tokenUsage":[0-9.]*' | cut -d: -f2)
CONTEXT_SIZE=$(echo "$STATE" | grep -o '"contextSize":[0-9]*' | cut -d: -f2)
FILES_LOADED=$(echo "$STATE" | grep -o '"filesLoaded":[0-9]*' | cut -d: -f2)
SESSION_AGE=$(echo "$STATE" | grep -o '"sessionAge":[0-9]*' | cut -d: -f2)

# Default values
TOKEN_USAGE=${TOKEN_USAGE:-0}
CONTEXT_SIZE=${CONTEXT_SIZE:-0}
FILES_LOADED=${FILES_LOADED:-0}
SESSION_AGE=${SESSION_AGE:-0}

# Check thresholds
NEEDS_OPTIMIZATION=false
REASON=""

# Token usage check (70% threshold)
if (( $(echo "$TOKEN_USAGE > 0.7" | bc -l 2>/dev/null || echo 0) )); then
  NEEDS_OPTIMIZATION=true
  REASON="${REASON}Token usage high (${TOKEN_USAGE}%). "
fi

# Context size check (10000 threshold)
if [ "$CONTEXT_SIZE" -gt 10000 ] 2>/dev/null; then
  NEEDS_OPTIMIZATION=true
  REASON="${REASON}Context size large (${CONTEXT_SIZE}). "
fi

# Files loaded check (20 threshold)
if [ "$FILES_LOADED" -gt 20 ] 2>/dev/null; then
  NEEDS_OPTIMIZATION=true
  REASON="${REASON}Too many files loaded (${FILES_LOADED}). "
fi

# Session age check (4 hours = 14400 seconds)
if [ "$SESSION_AGE" -gt 14400 ] 2>/dev/null; then
  NEEDS_OPTIMIZATION=true
  REASON="${REASON}Session age old (${SESSION_AGE}s). "
fi

# Output recommendation if optimization needed
if [ "$NEEDS_OPTIMIZATION" = true ]; then
  echo "⚠️ SESSION OPTIMIZATION RECOMMENDED"
  echo ""
  echo "Reason: ${REASON}"
  echo ""
  echo "Recommended Actions:"
  echo "1. Run /session-optimize for analysis"
  echo "2. Unload unused files"
  echo "3. Compress old context"
  echo "4. Consider /start-day to reset"
fi

exit 0
