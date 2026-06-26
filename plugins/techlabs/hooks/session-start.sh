#!/bin/bash
# Session start hook - loads session history

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
SESSIONS_DIR="${PLUGIN_ROOT}/production/sessions"

echo "=== TechLabs Session Started ==="
echo "Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'Not a git repo')"

# Check for session history
if [ -d "$SESSIONS_DIR" ]; then
  # Count sessions
  SESSION_COUNT=$(ls -1 "$SESSIONS_DIR"/*.json 2>/dev/null | wc -l)
  
  if [ "$SESSION_COUNT" -gt 0 ]; then
    echo ""
    echo "📚 Session History Found: ${SESSION_COUNT} sessions"
    echo ""
    
    # Get recent sessions
    echo "Recent Sessions:"
    ls -1t "$SESSIONS_DIR"/*.json 2>/dev/null | head -5 | while read session_file; do
      session_id=$(basename "$session_file" .json)
      echo "  - ${session_id}"
    done
    
    echo ""
    echo "💡 Tip: Use /start-day to resume from last session"
    echo "💡 Tip: Use /session-optimize to check session health"
  fi
fi

# Recent commits
echo ""
echo "Recent commits:"
git log --oneline -3 2>/dev/null || echo "No commits yet"

echo "======================================="
exit 0
