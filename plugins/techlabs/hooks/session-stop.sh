#!/bin/bash
# Session stop hook
# Archives session state and records git activity

echo "=== Technology Labs Session Ended ==="
echo "Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'Not a git repo')"
echo "Recent commits:"
git log --oneline -5 2>/dev/null || echo "No commits"
echo "====================================="
exit 0
