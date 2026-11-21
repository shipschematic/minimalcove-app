<h1 align="center">Minimal Cove</h1>

<p align="center">
  <strong>A productivity app combining Kanban boards and the Eisenhower Matrix.</strong>
  <br/>
  <a href="https://flutter.dev" target="_blank"><img src="https://img.shields.io/badge/Flutter-3.5+-02569B?logo=flutter&logoColor=white" alt="Flutter 3.5+"/></a>
  <a href="https://dart.dev" target="_blank"><img src="https://img.shields.io/badge/Dart-3.5+-0175C2?logo=dart&logoColor=white" alt="Dart 3.5+"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-green" alt="License: MIT"/></a>
</p>

---

## ✨ Features

| Feature | Description |
|---|---|
| **📋 Kanban Board** | Drag-and-drop task management with swimlanes (To Do, In Progress, Done). |
| **📊 Eisenhower Matrix** | Prioritise tasks by urgency and importance (Eisenhower method). |
| **📈 Analytics** | Visual insights into your productivity trends and task completion. |
| **✅ Habit Tracker** | Track daily habits and build consistent routines. |

## 📸 Screenshots

| Kanban Board | Eisenhower Matrix |
|---|---|
| ![Kanban](assets/screenshots/kanban.png) | ![Eisenhower Matrix](assets/screenshots/eisenhower.png) |
| **Analytics Dashboard** | **Habit Tracker** |
| ![Analytics](assets/screenshots/analytics.png) | ![Habits](assets/screenshots/habits.png) |

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) 3.5+
- [Dart](https://dart.dev/get-dart) 3.5+

### Installation

```bash
# Clone the repository
git clone https://github.com/shipschematic/minimalcove-app.git
cd minimalcove-app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Build

```bash
# Android
flutter build apk --debug
flutter build apk --release
flutter build appbundle --release   # Play Store

# iOS (macOS only)
flutter build ios --release

# Windows
flutter build windows --release

# Linux
flutter build linux --release
```

## 📦 Download & Install

### Windows

Pre-built Windows releases are available on the [Releases page](https://github.com/shipschematic/minimalcove-app/releases).

Download the latest `MinimalCove-windows-x64.zip`, extract it anywhere, and run `MinimalCove.exe`.

> **No installation required** — just unzip and run. The app is fully self-contained.

**To build from source:**
```bash
flutter build windows --release
# Output: build/windows/x64/runner/Release/
```

### Linux

Download the latest `MinimalCove-linux-x64.tar.gz` from the [Releases page](https://github.com/shipschematic/minimalcove-app/releases), extract it, and run the `MinimalCove` binary inside:

```bash
tar xzf MinimalCove-linux-x64.tar.gz
./MinimalCove/MinimalCove
```

> **No installation required** — the bundle is self-contained, but it does use the system GTK 3 libraries (`libgtk-3.so.0`), which are already present on any desktop Linux distribution. Requires glibc 2.34 or newer (Ubuntu 22.04+, Debian 12+, Fedora 36+).

**To build from source:**
```bash
flutter build linux --release
# Output: build/linux/x64/release/bundle/
```

**Installing it on the build host (per-user, no root).** Every release install goes through
one script — it builds nothing itself, so run `flutter build linux --release` (or the
`--debug` variant) first:

```bash
scripts/install-linux.sh            # release bundle -> ~/.local/share/minimalcove-app
scripts/install-linux.sh --debug    # install the debug bundle instead
scripts/install-linux.sh --bundle ~/Downloads/MinimalCove-linux-x64/MinimalCove  # install an extracted release
scripts/install-linux.sh --launch   # ...and start it afterwards
```

It stops any running instance, `rsync --delete`s the bundle into
`~/.local/share/minimalcove-app/`, (re)writes
`~/.local/share/applications/io.github.shipblueprint.minimalcove.desktop` — whose `Exec=` line
is the authoritative path — regenerates the hicolor icon sizes from `assets/icon/minimalcove_icon.png`,
validates the desktop file, refreshes the mime/icon caches, and prints the installed
`libapp.so` timestamp so you can confirm the new code landed.

> It refuses to install a bundle whose `libapp.so` is older than `lib/`. Dart-only edits do
> not relink the runner, so `MinimalCove` itself keeps an old timestamp — always check
> `lib/libapp.so`, never the executable.

A Linux build needs a C/C++ toolchain plus the GTK 3 development headers, and the
desktop target enabled once per machine:

```bash
# Fedora / RPM-based
sudo dnf5 install -y clang cmake ninja-build gtk3-devel

# Ubuntu / Debian-based
sudo apt install clang cmake ninja-build pkg-config libgtk-3-dev

flutter config --enable-linux-desktop
flutter doctor   # "Linux toolchain" must be green
```

> **Gotchas**
> * The package is `ninja-build`, not `ninja`.
> * `glu-devel` is not available on recent Fedora (Mesa GLU was retired) and is not needed.
> * Flutter is not packaged for Fedora — install it from the [official tarball](https://docs.flutter.dev/get-started/install/linux). It bundles Dart, so do not install Dart separately.
> * `webkit2gtk` is only required if a webview plugin is added; this app has no Linux-native plugins.
> * On the current dev machine `gtk3-devel` is not installed system-wide, so builds run through `/mnt/data/gtkdev/flutter-linux-build.sh`, which points `PKG_CONFIG_PATH` at an unprivileged header prefix. Both become unnecessary once the package above is installed.


## 🧰 Tech Stack

| Tool | Purpose |
|---|---|
| [Flutter](https://flutter.dev) | Cross-platform UI framework |
| [Get](https://pub.dev/packages/get) | State management, routing, DI |
| [SharedPreferences](https://pub.dev/packages/shared_preferences) | Local persistence |
| [Google Fonts](https://pub.dev/packages/google_fonts) | Typography |
| [flutter_lucide](https://pub.dev/packages/flutter_lucide) | Premium icon set |
| [intl](https://pub.dev/packages/intl) | Internationalisation |
| [url_strategy](https://pub.dev/packages/url_strategy) | Web URL handling |

## Platforms

| Platform | Status |
|---|---|
| 📱 Android | ✅ Supported |
| 🍎 iOS | ✅ Supported (macOS build required) |
| 🪟 Windows | ✅ Supported (x86‑64) |
| 🐧 Linux | ✅ Supported (x86‑64) |
| 🌐 Web | ✅ Preview — [minimalcove-app.web.app](https://minimalcove-app.web.app) |

## 📦 Releasing

1. **Bump the version** in `pubspec.yaml`. The `version:` field is what the running app
   reports and it is independent of the git tag — keep the two in step
   (`version: 0.2.0+2` pairs with tag `v0.2.0`).
2. **Tag and push** from the commit you intend to publish:

   ```bash
   git commit -am "chore: release v0.2.0"
   git tag v0.2.0
   git push origin main v0.2.0
   ```

3. **CI publishes** the GitHub Release. `release.yml` builds Android, Linux, Windows,
   macOS, iOS, and web, then attaches `MinimalCove-<platform>-<arch>.zip|tar.gz` plus
   split APKs and an AAB. No manual `gh release create` needed.
4. **Confirm the run** with `gh run list --workflow Release` and check the assets on the
   release page. Web deploys separately on every push to `main`.

> **Conventions**
> * One tag publishes every platform together, so a release page carries all artifacts
>   built from the same commit.
> * `assets/icon/minimalcove_icon.png` is the single source of truth for the icon.
>   Windows consumes a derived `windows/runner/resources/app_icon.ico` — regenerate it
>   when the icon changes. Linux installs the PNG itself into `data/icons/` and loads it
>   at runtime, so it needs no conversion step.
> * `android/`, `ios/` and `macos/` still carry the template identifier
>   `com.shipblueprint.minimalcove`. Changing `applicationId` / `PRODUCT_BUNDLE_IDENTIFIER` changes
>   install identity and stops existing users from receiving updates — treat it as a
>   planned migration, not a rename.

## 📄 License

Minimal Cove is released under the [MIT License](LICENSE).

---

<div align="center">
  <sub>Built with ❤️ by <a href="https://github.com/shipschematic">shipschematic</a></sub>
</div>
