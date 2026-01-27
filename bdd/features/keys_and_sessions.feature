Feature: Keys and session sharing
  As a Pisth user
  I want to manage SSH keys and share sessions
  So that I can authenticate securely across devices

  Scenario: Add an SSH key
    Given I open the SSH keys manager
    When I import a private key
    Then the key is available for new connections

  Scenario: Share a shell session
    Given I have an active terminal session
    When I share the session with another device
    Then the remote terminal is visible on the other device
