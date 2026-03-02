Feature: SSH connections
  As a Pisth user
  I want to connect to SSH servers securely
  So that I can manage remote systems from iOS

  Background:
    Given I have saved SSH credentials and host details

  Scenario: Open an SSH session
    When I connect to a server from the bookmarks list
    Then the connection is established and the shell opens

  Scenario: Reconnect after a dropped session
    When the network drops during an active session
    And I retry the connection
    Then Pisth restores the session or prompts to reconnect
