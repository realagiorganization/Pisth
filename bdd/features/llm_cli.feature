Feature: LLM CLI request
  As a Pisth maintainer
  I want to verify the LLM CLI workflow
  So that encrypted CI secrets power automated assistant demos

  Scenario: Request a response via the installed CLI in tmux
    Given the CI environment has an encrypted LLM API key
    When I install the oh-my-opencode CLI via codex and run a prompt in tmux
    Then I receive a generated response in the terminal session
