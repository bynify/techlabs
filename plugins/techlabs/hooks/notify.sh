#!/bin/bash
# Notification hook
# Shows desktop notification (Windows via PowerShell, no-op on other platforms)

if command -v powershell.exe &> /dev/null; then
  powershell.exe -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('$CLAUDE_NOTIFICATION', 'Technology Labs', 'OK', 'Information')" 2>/dev/null || true
fi

echo "$CLAUDE_NOTIFICATION"
exit 0
