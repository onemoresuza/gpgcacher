# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] 2022-07-23
### Added
- Support for smart cards, which use their serial numbers instead of stored
  keys.
### Changed
- The `sc` cache option help message description.

## [1.0.0] - 2022-07-23
### Changed
- Authentication keys are now supported.
- `gpg-connect-agent` and `gpg-preset-passphrase` are now used to cache
  keys.
### Breaking Changes
#### Removed
- `nosign` option; there's no need anymore, because of the new caching
  implementation.
- Caching of smart card keys (temporally).
- Caching of master keys; now only its sub keys are cached.

## [0.1.0] - 2022-07-16
### Added
- Capability of checking if key in a smart card is cached.

## [0.0.3] - 2022-07-16
### Added
- `Makefile`.
### Changed
- Change *Purpose* section in `README.md` to *Rationale*.

## [0.0.2] - 2022-07-16
### Fixed
- Add missing `-V` option description to `help_msg()`.
### Changed
- Remove ending dots from `help_msg()` option descriptions output.

## [0.0.1] - 2022-07-16
### Added
- The script with the name of the project `src/gpgcacher`.
- The project's `README.md` file.
- The project's `CHANGELOG.md` file.
- The project's license, the `UNLICENSE`.
