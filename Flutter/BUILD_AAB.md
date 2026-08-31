# Play / release builds

From `Flutter/` (where `pubspec.yaml` lives):

```powershell
flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/symbols
flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols
```

Outputs:

- `build/app/outputs/bundle/release/app-release.aab`
- `build/app/outputs/flutter-apk/app-release.apk`

Keep `build/app/outputs/symbols/` privately for crash deobfuscation.

## Signing

Release signing reads `android/key.properties` (gitignored) and a local `.jks` keystore. Those files must never be committed.

## Windows environment

Gradle needs NDK on PATH for native `.so` stripping:

| Variable | Example |
| --- | --- |
| `JAVA_HOME` | Android Studio JBR |
| `ANDROID_HOME` | Android SDK |
| `ANDROID_NDK_HOME` | `$ANDROID_HOME/ndk/28.2.13676358` |

`android/app/build.gradle.kts` pins `ndkVersion = "28.2.13676358"`. Use the NDK version you actually have installed.
