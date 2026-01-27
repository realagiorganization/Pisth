# Development Plan

## Goal
Build and maintain Pisth (iOS SSH/SFTP client), keeping the iOS app, shared modules, and supporting web assets in sync.

## Workflow
1. Run `./setup.sh` to fetch xterm.js assets, Pisth Viewer, submodules, and install CocoaPods.
2. Open `Pisth.xcworkspace` in Xcode and select the scheme you want to build (Pisth, Pisth Viewer, Pisth API, etc.).
3. Configure signing/team settings for the selected target(s).
4. Build and run on a simulator or device.
5. Run unit/integration tests in `PisthTests` (set `PISHT_RUN_INTEGRATION_TESTS=1` for network-dependent tests).
6. Update documentation and GitHub Pages content as needed.
7. For releases, use the TestFlight workflow or `fastlane beta` with required secrets.

## External Dependencies
- Xcode and the iOS SDK (build, run, and signing).
- CocoaPods (dependency management for iOS targets).
- Ruby (for CocoaPods and Fastlane tooling).
- NMSSH (SSH/SFTP library used by the app).
- xterm.js bundle (downloaded during setup for the embedded terminal).
- Pisth Viewer app bundle (downloaded during setup for macOS embedding).
- Git submodules (external modules referenced by the project).
- Fastlane (release automation and TestFlight uploads).
- GitHub Actions runners (CI, BDD, and screenshot workflows).

## Release Checklist
- Update build number and release notes.
- Ensure signing and provisioning profiles are valid.
- Confirm `fastlane` secrets are configured for App Store Connect.
- Trigger the TestFlight workflow for a new build.
