# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Introduce newer github workflows
- New `View` API to easily create `ScreenGuis`
- Future roblox-ts support
- New testing workflows

### Fixed

- Ensure instances returned in `ForEach` are actually instances

### Changed

- Improved, and more readable types
- Use string requires (NOT init)

## [0.4.0] - 2025-01-21

### Added

- `ForEach` action

### Fixed

- Invalid name setting in `Update`
- Invalid type for actions
- Issues within docs

### Removed

- Removed the `Action` function in favor of a different method

## [0.3.0] - 2025-01-20

### Added

- Completely revamped docs
- Error help section

### Fixed

- Even more performance fixes
- Fixed incorrect doc links within code
- Fixed incorrect types in some areas

## [0.3.0-rc6] - 2025-01-10

### Fixed

- Merge #12

## [0.3.0-rc5] - 2025-01-10

## [0.3.0-rc4] - 2024-12-26

### Added

- Offers improved cleanup

## [0.3.0-rc3] - 2024-12-24

### Fixed

- Fixes not being able to create multiple actions of the same type under an object

### Removed

- Removes action caching as it has no practical use

## [0.3.0-rc2] - 2024-12-15

### Fixed

- Fixed possible bugs
- Minified longer code
- Improved memory usage

### Removed

- Removed old log types

## [0.3.0-rc1] - 2024-12-15

### Added

- Complete rewrite

## [0.2.3] - 2024-07-25

### Added

- Adds a `Component<T>` type

### Changed

- Enforces better code practices in some areas

### Fixed

- Fixes types not being inferenced when creating components
- Fixes docs not being up-to-date with code

## [0.2.2] - 2024-07-12

### Fixed

- Fixed infinite error on spring destruction bug ( [#5 by @dazscripts](https://github.com/lumin-org/ui/pull/5) )

## [0.2.1] - 2024-07-06

### Added

- Adds 2 new exported types
- Adds documentation for components
- Adds general component support
- Adds `props.Children` when using component children

### Changed

- Reformats code for better comment support

### Fixed

- Fix documentation inconsistencies

## [0.2.0] - 2024-07-04

### Added

- Added `compute` constructor.
- Added `childrenTable` parameter for `new` constructor
- Added `Spring:Destroy()` method.
- `State:Listen(...)` now returns a function to disconnect the listener.

### Changed

- Exported more types.
- Improved documentation

### Fixed

- Fixed `State` object's listener function's value order being typed wrong.

### Removed

- `Children` key.
- Removed the ability to pass key tables in the `UnregisterKey` function.
- Removed support for nested tables.

## [0.1.0] - 2024-06-23

### Added

- Added `Aegis.Update` function.
- Added `Aegis.UnregisterKey` function.
- Added `Cleanup` key.
- Added restriction for `table` types for states.
- Added nested table support for `Children` key.
- Added more animatable types: `boolean`, `BrickColor`, `CFrame`, `Vector3int16`, `Vector2int16`, `NumberSequence`, `NumberRange` and `Rect`.

### Changed

- Improved `Aegis.Key` function.
- Reduced spring memory usage
- Made documentation a lot better with in-depth explanation, FAQ, comparisons and tutorials.

### Fixed

- Types are now properly exported.
- Fixed `Color3` spring animation.
- Fixed issue with `Children` key not parenting instances properly.

### Removed

- `SpringInfo.Velocity`

## [0.0.3] - 2024-05-27

### Fixed

- Fix documentation

## [0.0.2] - 2024-05-27

### Fixed

- Fixed documentation page and wally package

## [0.0.1] - 2024-05-27

- Released [Aegis](/)!

[unreleased]: https://github.com/lumin-org/ui/compare/v0.4.1...HEAD
[0.4.1]: https://github.com/lumin-org/ui/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/lumin-org/ui/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/lumin-org/ui/compare/v0.3.0-rc6...v0.3.0
[0.3.0-rc6]: https://github.com/lumin-org/ui/compare/v0.3.0-rc5...v0.3.0-rc6
[0.3.0-rc5]: https://github.com/lumin-org/ui/compare/v0.3.0-rc4...v0.3.0-rc5
[0.3.0-rc4]: https://github.com/lumin-org/ui/compare/v0.3.0-rc3...v0.3.0-rc4
[0.3.0-rc3]: https://github.com/lumin-org/ui/compare/v0.3.0-rc2...v0.3.0-rc3
[0.3.0-rc2]: https://github.com/lumin-org/ui/compare/v0.3.0-rc1...v0.3.0-rc2
[0.3.0-rc1]: https://github.com/lumin-org/ui/compare/v0.2.3...v0.3.0-rc1
[0.2.3]: https://github.com/lumin-org/ui/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/lumin-org/ui/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/lumin-org/ui/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/lumin-org/ui/compare/v0.1.0...v2.0.0
[0.1.0]: https://github.com/lumin-org/ui/compare/v0.0.3...v1.0.0
[0.0.3]: https://github.com/lumin-org/ui/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/lumin-org/ui/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/lumin-org/ui/compare/f19ed29fbf876a82f24ba644d3804ffad0d2b6dc...v0.0.1
