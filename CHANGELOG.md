# Plasma Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][kac], and this project adheres to
[Semantic Versioning][semver].

[kac]: https://keepachangelog.com/en/1.1.0/
[semver]: https://semver.org/spec/v2.0.0.html

## [Unreleased]

## [0.4.4] - 2024-04-25

### Changed

- Disabled `AutoLocalize` on many Plasma Widgets.
  - This removes unnecessary computations for
    `LocalizationService::attemptLocalization`.

## [0.4.3] - 2024-01-31

### Added

- The context functions are now exposed in `init.lua`.
- The table widget now supports selecting headings and cells in addition to
  rows.

### Changed

- Widgets are now more compact.

### Fixed

- The `automaticSize` helper should now set `minSize` attribute correctly.
- Fixed the window position resetting when another input state update is
  processed while the window is being dragged.
- Sliders will now update correctly when dynamically modifying the `min` and
  `max` properties.
- TestEZ is now correctly included as a dev dependency.

## [0.4.2] - 2022-07-10

### Fixed

- Fixed Slider not firing event callback for drag connection (Fixes using slider on the server in Matter debugger)

## [0.4.1] - 2022-07-08

### Added

- Added highlight widget
- table now supports a `hovered` method in its handle

## [0.4.0] - 2022-07-05

### Added

- Table widget
- Added font option to heading

### Changed

- `useInstance` no longer returns the root instance. Instead, it returns a `ref` table, which is also created and passed to the `useInstance` function itself as a first parameter. You can create keys in the table to access instances in the widget body.
- The `create` function now has special behavior if a key is passed in the props table. It will set a value in the table to the instance that's being created at the key specified by the value in the props table. E.g., `[ref] = "button"` will set the key "button" in the `ref` table to the button that was created.
- `automaticSize` now covers more cases, including text objects and objects with no UIGridStyleLayout within them.
- The window widget is now draggable, resizable, and closable.
- Slider now supports min and initial value settings
- label, checkbox, heading, table, window now support RichText
- Buttons are appropriately sized to their text contents

## [0.3.0] - 2022-07-01

### Added

- Added `hydrateAutomaticSize` function

### Changed

- `automaticSize` no longer applies automatic sizing on the server. Instead, it configures the instance to be compatible with `hydrateAutomaticSize` from the client.
- `automaticSize` now accepts a UDim2 as a `maxSize` for use with Scale

### Fixed

- Fixed `automaticSize` with scrolling frames sometimes causing an infinite content reflow loop.

## [0.2.0] - 2022-06-30

### Added

- Added `useKey`
- Added heading, label, slider, and space widgets
- Add multi-phase frame API with `beginFrame`, `continueFrame`, and `finishFrame`
- Add event callback injection

### Fixed

- Widget state now resets if the widget in the slot changed from last frame

## [0.1.0] - 2021-12-13

- Initial release

[unreleased]: https://github.com/matter-ecs/plasma/compare/v0.4.4...HEAD
[0.4.4]: https://github.com/matter-ecs/plasma/releases/tag/v0.4.4
[0.4.3]: https://github.com/matter-ecs/plasma/releases/tag/v0.4.3
[0.4.2]: https://github.com/matter-ecs/plasma/releases/tag/v0.4.2
[0.4.1]: https://github.com/matter-ecs/plasma/releases/tag/v0.4.1
[0.4.0]: https://github.com/matter-ecs/plasma/releases/tag/v0.4.0
[0.3.0]: https://github.com/matter-ecs/plasma/releases/tag/v0.3.0
[0.2.0]: https://github.com/matter-ecs/plasma/releases/tag/v0.2.0
[0.1.0]: https://github.com/matter-ecs/plasma/releases/tag/v0.1.0
