#!/bin/bash
# Session stop hook - saves session data

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
SESSIONS_DIR="${PLUGIN_ROOT}/production/sessions"
STATE_FILE="${PLUGIN_ROOT}/production/session/state.json"

echo "=== TechLabs Session Ended ==="

# Create sessions directory if not exists
mkdir -p "$SESSIONS_DIR"

# Generate session ID
SESSION_ID="session-$(date +%Y%m%d-%H%M%S)"

# Save session state if exists
if [ -f "$STATE_FILE" ]; then
  # Copy state to session history
  cp "$STATE_FILE" "$SESSIONS_DIR/$SESSION_ID.json"
  echo "Session saved: $SESSION_ID"
fi

# Save git activity
echo ""
echo "Git Activity:"
echo "Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'Not a git repo')"
echo "Recent commits:"
git log --oneline -5 2>/dev/null || echo "No commits"

# Update session index
INDEX_FILE="$SESSIONS_DIR/index.json"
if [ ! -f "$INDEX_FILE" ]; then
  echo "[]" > "$INDEX_FILE"
fi

# Add session to index
echo "Session ended: $(date)"

echo "====================================="
exit 0
