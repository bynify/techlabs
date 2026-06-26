# file-upload

Implement file upload with validation, storage, and progress.

## When to Use
- File upload
- Image uploads
- Document handling
- S3/R2 integration

## Execution

### Step 1: Frontend Upload
```typescript
async function uploadFile(file: File, onProgress: (pct: number) => void) {
  const formData = new FormData();
  formData.append('file', file);

  const xhr = new XMLHttpRequest();
  xhr.upload.onprogress = (e) => onProgress((e.loaded / e.total) * 100);
  
  return new Promise((resolve, reject) => {
    xhr.onload = () => resolve(JSON.parse(xhr.responseText));
    xhr.onerror = reject;
    xhr.open('POST', '/api/upload');
    xhr.send(formData);
  });
}
```

### Step 2: Backend Handler
```typescript
app.post('/api/upload', async (req, res) => {
  const file = req.files.file;
  
  // Validate
  if (file.size > 10 * 1024 * 1024) {
    return res.status(400).json({ error: 'File too large' });
  }
  
  const allowed = ['image/jpeg', 'image/png', 'application/pdf'];
  if (!allowed.includes(file.mimetype)) {
    return res.status(400).json({ error: 'Invalid file type' });
  }
  
  // Store
  const key = `uploads/${Date.now()}-${file.name}`;
  await storage.put(key, file.data);
  
  res.json({ url: `/files/${key}` });
});
```

## Output
- Upload handler
- Progress tracking
- Validation
- Storage integration
