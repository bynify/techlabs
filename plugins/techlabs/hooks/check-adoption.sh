#!/bin/bash
# Check if project has adopted TechLabs conventions
# Used by other hooks to adjust behavior

ADOPTION_STATUS="none"

# Check for adoption plan
if [[ -f "docs/ADOPTION-PLAN.md" ]]; then
  ADOPTION_STATUS="planned"
fi

# Check for path config (rule file)
if [[ -f "rules/path-config.md" ]]; then
  # Check if it has been customized (not default content)
  if grep -q "paths:" "rules/path-config.md" 2>/dev/null; then
    ADOPTION_STATUS="configured"
  fi
fi

# Check for CLAUDE.md with path mappings
if [[ -f "CLAUDE.md" ]]; then
  if grep -q "Path Configuration" "CLAUDE.md" 2>/dev/null; then
    ADOPTION_STATUS="active"
  fi
fi

# Check for restructure checklist
if [[ -f "docs/RESTRUCTURE-CHECKLIST.md" ]]; then
  if [[ "$ADOPTION_STATUS" == "none" ]]; then
    ADOPTION_STATUS="restructuring"
  fi
fi

echo "ADOPTION_STATUS=$ADOPTION_STATUS"

# Output recommendations based on status
case $ADOPTION_STATUS in
  "none")
    echo "TIP: Project not yet adopted. Run /adopt-existing to start."
    ;;
  "planned")
    echo "TIP: Adoption plan exists. Run /remap-paths to configure, or /restructure-plan to proceed."
    ;;
  "configured")
    echo "TIP: Path config found. Run /integrity-audit to check compliance."
    ;;
  "active")
    echo "TIP: Adoption active. Run /integrity-audit periodically to track compliance."
    ;;
  "restructuring")
    echo "TIP: Restructure in progress. Check docs/RESTRUCTURE-CHECKLIST.md."
    ;;
esac

exit 0
