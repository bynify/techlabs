#!/bin/bash
# Detect gaps in project setup
# Suggests next steps based on project state

if [[ ! -f "CLAUDE.md" ]]; then
  echo "TIP: Run /start to initialize your project."
  exit 0
fi

if [[ ! -f "docs/PRD.md" ]]; then
  echo "TIP: Consider running /create-prd to define your product requirements."
fi

if [[ ! -f "docs/architecture.md" ]]; then
  echo "TIP: Consider running /create-architecture to design your system."
fi

exit 0
