#!/bin/bash
# Log agent invocation
# Records subagent start for audit trail

AGENT_NAME="${CLAUDE_AGENT_NAME:-unknown}"
echo "[$(date -Iseconds)] Agent started: $AGENT_NAME" >> .claude/agent-memory/audit.log
exit 0
