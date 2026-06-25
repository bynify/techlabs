#!/bin/bash
# Session start hook
# Shows current project status

echo "=== Technology Labs Session Started ==="
echo "Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'Not a git repo')"
echo "Recent commits:"
git log --oneline -3 2>/dev/null || echo "No commits yet"
echo "======================================="
exit 0
