# Assumptions
- BDD coverage is expressed as Gherkin feature files describing primary user flows, validated by a lightweight local runner.
- Network-dependent SSH/SFTP integration tests should be skipped unless `PISHT_RUN_INTEGRATION_TESTS=1` is set to avoid CI instability.
- TestFlight release automation uses Fastlane with App Store Connect API key and signing secrets provided via GitHub Actions.
- The BDD GIF in `docs/bdd.gif` is a placeholder generated locally; the `BDD Suite` workflow refreshes it using the VHS action.
- The LLM CLI demo workflow expects encrypted secrets (`LLM_API_KEY`, optional `LLM_API_BASE`, `LLM_MODEL`) to be set in GitHub Actions for the VHS capture.
- The opencode CLI defaults to the OpenAI Responses API with the `gpt-4o-mini` model unless overridden by secrets.
- GitHub Pages screenshotting relies on Chrome/Chromium availability on `ubuntu-latest` runners.
