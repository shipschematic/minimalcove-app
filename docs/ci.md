# CI and Releases

GitHub Actions builds Minimal Cove directly. No marketplace "release" wrapper is used, so Flutter setup, signing, and artifact layout stay under our control.

| Workflow | Trigger | Result |
| --- | --- | --- |
| [`ci.yml`](../.github/workflows/ci.yml) | Pull request, push to `main` | `flutter analyze`, `flutter test`, release web build |
| [`release.yml`](../.github/workflows/release.yml) | Tag `v*`, manual dispatch | Android, Linux, Windows, macOS, iOS, and web artifacts attached to a GitHub Release |

Web deploys from `ci.yml` on every push to `main`, not from the release workflow, so the live site always matches the branch.

## Flutter version

Both workflows pin `FLUTTER_VERSION` to `3.47.8`. Bump it in both files together after a local upgrade. `subosito/flutter-action` caches the SDK; the pub cache is not cached yet.

## Required secret

The web deploy needs a Firebase service account with Hosting Admin rights on the `minimalcove` project:

```bash
gcloud iam service-accounts create github-actions-hosting \
  --project minimalcove \
  --display-name "GitHub Actions Hosting"

gcloud projects add-iam-policy-binding minimalcove \
  --member="serviceAccount:github-actions-hosting@minimalcove.iam.gserviceaccount.com" \
  --role="roles/firebasehosting.admin"

gcloud iam service-accounts keys create /tmp/minimalcove-ci.json \
  --iam-account=github-actions-hosting@minimalcove.iam.gserviceaccount.com

gh secret set FIREBASE_SERVICE_ACCOUNT_MINIMALCOVE \
  --repo shipblueprint/minimalcove-app < /tmp/minimalcove-ci.json

rm /tmp/minimalcove-ci.json
```

Until the secret exists, the web job still builds and skips the deploy step with a warning.

## Release flow

```bash
git tag v0.2.0
git push origin v0.2.0
```

The published artifacts use the names the README documents: `MinimalCove-windows-x64.zip`, `MinimalCove-linux-x64.tar.gz`, `MinimalCove-macos-universal.zip`, `MinimalCove-ios-unsigned.zip`, `MinimalCove-web.zip`, plus split Android APKs and an AAB.

## Signing gaps

- Android release builds still use the debug keystore (`android/app/build.gradle.kts`). CI artifacts install but cannot go to Play Store until a release keystore and `key.properties` come from secrets.
- iOS is archived with `--no-codesign`. App Store and TestFlight need Apple certificates and provisioning profiles.
- macOS is unsigned and unnotarized. Gatekeeper blocks it on other Macs until signed with a Developer ID.

macOS runners bill at 10x and Windows at 2x on private repositories. A tag push therefore costs more than a normal CI run.
