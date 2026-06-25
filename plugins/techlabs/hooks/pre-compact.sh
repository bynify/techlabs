#!/bin/bash
# Pre-compact hook
# Saves session state before context compaction

echo "Saving session state before compaction..."
# Save current state to active.md if it exists
if [[ -f "production/active.md" ]]; then
  cp production/active.md production/active.md.bak 2>/dev/null || true
fi
exit 0
