# Development Plan

## Goal
Build and maintain Pisth (iOS SSH/SFTP client), keeping the iOS app, shared modules, and supporting web assets in sync.

## Workflow
1. Run `./setup.sh` to fetch xterm.js assets, Pisth Viewer, submodules, and install CocoaPods.
2. Open `Pisth.xcworkspace` in Xcode and select the scheme you want to build (Pisth, Pisth Viewer, Pisth API, etc.).
3. Configure signing/team settings for the selected target(s).
4. Build and run on a simulator or device.
5. Run unit/integration tests in `PisthTests` (set `PISHT_RUN_INTEGRATION_TESTS=1` for network-dependent tests).
6. Validate the BDD feature set locally with `./scripts/run-bdd.sh`; the GitHub Action records a VHS clip to `docs/bdd.gif`.
7. Exercise the LLM CLI demo with `./scripts/llm_cli_demo.sh` (requires `LLM_API_KEY` secrets) to mirror the tmux-based VHS capture used in CI.
8. Update documentation, README badges, and GitHub Pages content as needed; `./scripts/screenshot-pages.sh` regenerates the site screenshot.
9. For releases, use the TestFlight workflow or `fastlane beta` with required secrets.

## External Dependencies
- Xcode and the iOS SDK (build, run, and signing).
- CocoaPods and Ruby (dependency management for iOS targets and Fastlane tooling).
- Fastlane with App Store Connect API key and match repository (TestFlight automation).
- NMSSH (SSH/SFTP library used by the app).
- xterm.js bundle (downloaded during setup for the embedded terminal).
- Pisth Viewer app bundle (downloaded during setup for macOS embedding).
- Git submodules (external modules referenced by the project).
- GitHub Actions runners: macOS for iOS build/test/release, Ubuntu for BDD/VHS/LLM/demo and GitHub Pages screenshot.
- Charmbracelet `vhs` GitHub Action plus `tmux` (records console and UI interactions into GIFs).
- Headless Chrome/Chromium (captures GitHub Pages screenshot via `scripts/screenshot-pages.sh`).
- LLM API (OpenAI-compatible `responses` endpoint) with encrypted `LLM_API_KEY`/`LLM_API_BASE`/`LLM_MODEL` secrets for the opencode CLI demo.
- opencode CLI bootstrap via `scripts/codex-cli.sh` (installs Python shim used in the LLM BDD workflow).

## Release Checklist
- Update build number and release notes.
- Ensure signing and provisioning profiles are valid.
- Confirm `fastlane` secrets are configured for App Store Connect.
- Trigger the TestFlight workflow for a new build.
