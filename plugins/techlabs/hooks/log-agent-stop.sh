#!/bin/bash
# Log agent stop
# Records subagent completion for audit trail

AGENT_NAME="${CLAUDE_AGENT_NAME:-unknown}"
echo "[$(date -Iseconds)] Agent stopped: $AGENT_NAME" >> .claude/agent-memory/audit.log
exit 0
