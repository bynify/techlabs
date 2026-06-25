#!/bin/bash
# Validate Cloudflare Workers code
# Exit early if not in serverless directory

FILEPATH="$CLAUDE_TOOL_INPUT"
if [[ ! "$FILEPATH" =~ "src/serverless" ]]; then
  exit 0
fi

# Check bundle size (warn if > 1MB)
if [[ -f "$FILEPATH" ]]; then
  SIZE=$(wc -c < "$FILEPATH")
  if [[ $SIZE -gt 1048576 ]]; then
    echo "WARNING: File size exceeds 1MB. Cloudflare Workers have size limits."
  fi
fi

exit 0
