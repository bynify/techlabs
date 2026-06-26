# create-tauri-app

Create Tauri desktop app with Rust backend and web frontend.

## When to Use
- Lightweight desktop apps
- System-level access needed
- Secure desktop applications

## Execution

### Step 1: Initialize
```bash
npm create tauri-app@latest my-app -- --template react-ts
```

### Step 2: Rust Commands
```rust
// src-tauri/src/commands.rs
#[tauri::command]
async fn read_file(path: String) -> Result<String, String> {
    std::fs::read_to_string(&path).map_err(|e| e.to_string())
}

#[tauri::command]
async fn save_file(path: String, content: String) -> Result<(), String> {
    std::fs::write(&path, content).map_err(|e| e.to_string())
}
```

### Step 3: Frontend
```typescript
import { invoke } from '@tauri-apps/api/core';

const content = await invoke<string>('read_file', { path: '/path/to/file' });
await invoke('save_file', { path: '/path/to/file', content: 'new' });
```

### Step 4: Permissions
```json
{
  "permissions": {
    "fs": { "scope": ["$APPDATA/**"] },
    "shell": { "open": true }
  }
}
```

## Output
- Tauri app scaffold
- Rust commands
- Frontend integration
- Permissions configured
