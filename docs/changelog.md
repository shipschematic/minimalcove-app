# Changelog

Notable changes and releases for Minimal Cove.

## Unreleased

- Docs: web is a supported preview at `https://minimalcove-app.web.app`; removed the Contributing section
- License: released under the MIT License
- Hosting: no-cache headers now cover `/`, `index.html`, the service worker, bootstrap script, and manifest so renamed titles update immediately
- Hosting: web app serves from `https://minimalcove-app.web.app`; `minimalcove.web.app` reserved for the landing site
- Documentation: added `docs/index.md`, `docs/installation.md`, `docs/changelog.md`; organized project docs under `docs/`
- Repo cleanup: moved root docs/specs to `docs/`, moved icon source to `assets/icon/`, moved local archives/backups to ignored `.dist/`

## v1.0.1 — Linux (x86-64)

- Linux release packaging and install flow
- See git tag `v1.0.1`

## v1.0.0 — Windows

- Initial Windows release
- See git tag `v1.0.0`

## Recent commits (reference)

- `516e4e8` docs: update repo URL to renamed focusboard
- `b05d9a9` docs(tickets): close 06 on the owner's Android device run
- `71dd02d` docs(map): record the Android release and correct the colour and build notes
- `bbe67e3` docs(tickets): file the Android label and signing gaps found while releasing
- `c5fc2b6` build(android): migrate Gradle to Kotlin DSL and rename the package
