Feature: Terminal and editor
  As a Pisth user
  I want to run shell commands and edit text files
  So that I can maintain my server directly from the app

  Background:
    Given I have an active SSH session

  Scenario: Run shell commands
    When I type a command in the terminal
    Then I see the command output in the console

  Scenario: Edit a remote text file
    When I open a text file from the file browser
    Then the editor shows syntax highlighting
    And I can save my changes back to the server
