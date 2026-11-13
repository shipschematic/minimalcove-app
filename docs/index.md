# Minimal Cove Documentation

Minimal Cove is a Flutter productivity app combining Kanban boards and the Eisenhower Matrix, with analytics and habit tracking.

## Overview

| Area | Description |
| --- | --- |
| Kanban Board | Drag-and-drop task flow across To Do, In Progress, Done |
| Eisenhower Matrix | Prioritize by urgency/importance (Do First, Schedule, Delegate, Eliminate) |
| Analytics | Productivity and completion insights |
| Habit Tracker | Daily habit check-ins and streak tracking |
| Theming | Light/dark themes with brand palette |
| Localization | `intl`-ready UI |

## Platforms

| Platform | Status |
| --- | --- |
| Android | Supported |
| iOS | Supported (macOS build required) |
| Windows | Supported (x86-64) |
| Linux | Supported (x86-64) |
| Web | Supported — [preview](https://minimalcove-app.web.app) |

## Documentation

- [Installation](installation.md) — prerequisites, setup, build, and run
- [CI and Releases](ci.md) — GitHub Actions, required secret, signing gaps
- [Architecture & Project Map](PROJECT_MAP.md) — codebase map, seams, persistence, gaps
- [Do First → Kanban Spec](SPEC-do-first-to-kanban.md) — transfer behavior spec
- [Changelog](changelog.md) — notable releases and changes

## Source

- Repository: [shipblueprint/minimalcove-app](https://github.com/shipblueprint/minimalcove-app)
- Main README: [`../README.md`](../README.md)
