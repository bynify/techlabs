#!/bin/bash
# Post-compact hook
# Restores session state after context compaction

echo "Session state restored after compaction."
# Restore from backup if it exists
if [[ -f "production/active.md.bak" ]]; then
  cp production/active.md.bak production/active.md 2>/dev/null || true
fi
exit 0
