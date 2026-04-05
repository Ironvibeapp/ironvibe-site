# Сборка App Bundle (AAB) для Google Play

Рекомендуемая сборка — с выносом отладочной информации и обфускацией (минимальный размер AAB/APK):

```powershell
flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/symbols
```

Готовый AAB: `build\app\outputs\bundle\release\app-release.aab`.  
Символы для разбора крашей: `build\app\outputs\symbols\` (хранить отдельно).

---

## Окружение (обязательно для Windows)

Чтобы Gradle корректно выполнял strip нативных библиотек, в сессии сборки должны быть заданы переменные:

| Переменная          | Пример значения |
|---------------------|------------------|
| `JAVA_HOME`         | `C:\Program Files\Android\Android Studio\jbr` |
| `ANDROID_HOME`      | `C:\Users\<user>\AppData\Local\Android\Sdk` |
| `ANDROID_NDK_HOME`  | `C:\Users\<user>\AppData\Local\Android\Sdk\ndk\28.2.13676358` |

В `android/app/build.gradle.kts` явно указана версия NDK: `ndkVersion = "28.2.13676358"`.  
Если у вас установлена другая версия NDK, замените на свою (папка в `Sdk\ndk\<версия>`).

---

## Полный цикл (из корня Flutter, где лежит pubspec.yaml)

```powershell
$env:JAVA_HOME = "C:\Program Files\Android\Android Studio\jbr"
$env:ANDROID_HOME = "C:\Users\user\AppData\Local\Android\Sdk"
$env:ANDROID_NDK_HOME = "$env:ANDROID_HOME\ndk\28.2.13676358"
$env:Path = "$env:ANDROID_HOME\cmdline-tools\latest\bin;$env:ANDROID_HOME\platform-tools;$env:JAVA_HOME\bin;$env:Path"

cd C:\Users\user\Desktop\fitnessapp\Flutter

flutter clean
cd android; .\gradlew clean; cd ..

flutter pub get
flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/symbols
```

Костыль `keepDebugSymbols` в `build.gradle.kts` не используется — strip выполняется штатно при корректном `ANDROID_NDK_HOME` и `ndkVersion`.
