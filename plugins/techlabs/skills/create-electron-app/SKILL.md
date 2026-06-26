# create-electron-app

Create Electron desktop app with secure IPC, preload scripts, and auto-update.

## When to Use
- Desktop applications
- System tray apps
- Native integrations needed

## Execution

### Step 1: Scaffold
```bash
npm init electron-app@latest my-app -- --template=webpack-typescript
```

### Step 2: Main Process
```typescript
// src/main/index.ts
import { app, BrowserWindow, ipcMain } from 'electron';

let mainWindow: BrowserWindow;

app.whenReady().then(() => {
  mainWindow = new BrowserWindow({
    width: 1200,
    height: 800,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,
      nodeIntegration: false,
    },
  });

  mainWindow.loadFile('dist/index.html');
});

ipcMain.handle('file:read', async (_, path: string) => {
  return fs.promises.readFile(path, 'utf-8');
});
```

### Step 3: Preload Script
```typescript
// src/preload/index.ts
import { contextBridge, ipcRenderer } from 'electron';

contextBridge.exposeInMainWorld('api', {
  readFile: (path: string) => ipcRenderer.invoke('file:read', path),
  saveFile: (path: string, content: string) => ipcRenderer.invoke('file:save', path, content),
});
```

## Output
- Electron app scaffold
- Main process with IPC
- Preload script
- Auto-update configuration
