# Desktop Code Rules

Applies to: `src/desktop/**`

## Requirements
- Tauri / Electron patterns
- IPC security (validate all messages)
- Native API access with proper permissions
- File system access with user consent
- Auto-update handling

## Patterns
- Use Tauri commands for Rust backend
- Use IPC for renderer-main communication
- Use proper window management
- Handle system events (close, minimize, etc.)

## Anti-patterns
- Do not expose sensitive APIs to renderer
- Do not trust IPC messages without validation
- Do not use `nodeIntegration: true` (Electron)
