# Contributing

Thanks for taking a look at IronVibe.

## Repository layout

| Path | What it is |
| --- | --- |
| [`Flutter/`](Flutter/) | Application source |
| locale folders (`en/`, `ru/`, …), `theme.css`, `*.js` | Public website ([ironvibe.app](https://ironvibe.app)), served by GitHub Pages |

Keep app changes in `Flutter/`. Keep landing-page changes out of `Flutter/`.

## App

```bash
cd Flutter
flutter pub get
flutter run
```

Release builds (Play / sideload) need a local `android/key.properties` and keystore that are **not** in git. See `Flutter/BUILD_AAB.md`.

## Website

Edit the locale HTML/JSON in the corresponding folder. Shared styles and scripts live at the repository root (`theme.css`, `theme-toggle.js`, …).
