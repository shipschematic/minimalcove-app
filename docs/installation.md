# Installation

## Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) 3.5+
- [Dart SDK](https://dart.dev/get-dart) 3.5+ (bundled with Flutter)
- An IDE/editor with Flutter & Dart plugins (VS Code, Android Studio, IntelliJ IDEA)
- Platform toolchains for targets you build:
  - **Android:** Android SDK / Android Studio
  - **iOS/macOS:** Xcode (macOS only)
  - **Windows:** Visual Studio with Desktop development with C++
  - **Linux:** GTK 3 dev toolchain (`clang`, `cmake`, `ninja-build`, `gtk3-devel` or `libgtk-3-dev`, `pkg-config`)

Verify setup:

```bash
flutter doctor
```

## Get the source

```bash
git clone https://github.com/shipschematic/minimalcove-app.git
cd minimalcove-app
flutter pub get
```

## Run

```bash
flutter run
```

Select a device/emulator/desktop target as needed (`flutter devices`).

## Build

```bash
# Android
flutter build apk --debug
flutter build apk --release
flutter build appbundle --release

# iOS (macOS only)
flutter build ios --release

# Windows
flutter build windows --release

# Linux
flutter build linux --release
```

## Linux install (local, per-user)

After building Linux bundle:

```bash
scripts/install-linux.sh            # release bundle -> ~/.local/share/minimalcove-app
scripts/install-linux.sh --debug    # debug bundle
scripts/install-linux.sh --bundle ~/Downloads/MinimalCove-linux-x64/MinimalCove  # extracted release
scripts/install-linux.sh --launch   # install and launch
```

Script syncs bundle, writes desktop entry/icons, and refuses install if bundle `libapp.so` is older than `lib/`.

### Linux build notes

- Fedora package: `ninja-build` (not `ninja`)
- `glu-devel` not required on recent Fedora
- `webkit2gtk` not required unless a webview plugin is added
- If CMake cache points to missing GTK headers, move `build/linux` aside and reconfigure

## Assets & icon

- App icon source: `assets/icon/minimalcove_icon.png`
- Windows icon resource: `windows/runner/resources/app_icon.ico` (regenerate when source icon changes)

## Troubleshooting

```bash
flutter clean
flutter pub get
flutter doctor -v
```

For architecture and known gaps, see [PROJECT_MAP.md](PROJECT_MAP.md).
