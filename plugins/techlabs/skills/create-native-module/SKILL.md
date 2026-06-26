# create-native-module

Create React Native native module for platform-specific functionality.

## When to Use
- Platform-specific features
- Performance-critical code
- Third-party SDK integration

## Execution

### Step 1: Define Interface
```typescript
// src/types/native.ts
interface NativeBridge {
  getDeviceInfo(): Promise<{ platform: string; version: string }>;
  share(content: { title: string; url: string }): Promise<void>;
  hapticFeedback(type: "light" | "medium" | "heavy"): Promise<void>;
}
```

### Step 2: iOS Implementation
```swift
// ios/Modules/DeviceInfoModule.swift
@objc(DeviceInfoModule)
class DeviceInfoModule: NSObject {
  @objc static func requiresMainQueueSetup() -> Bool { return false }
  
  @objc func getDeviceInfo(_ resolve: @escaping RCTPromiseResolveBlock,
                           rejecter reject: @escaping RCTPromiseRejectBlock) {
    let device = UIDevice.current
    resolve([
      "platform": "ios",
      "version": device.systemVersion
    ])
  }
}
```

### Step 3: Android Implementation
```kotlin
// android/src/main/java/com/app/DeviceInfoModule.kt
class DeviceInfoModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
  override fun getName() = "DeviceInfo"
  
  @ReactMethod
  fun getDeviceInfo(promise: Promise) {
    val result = Arguments.createMap()
    result.putString("platform", "android")
    result.putString("version", Build.VERSION.RELEASE)
    promise.resolve(result)
  }
}
```

## Output
- TypeScript interface
- iOS implementation
- Android implementation
- Bridge registration
