Feature: File transfer and management
  As a Pisth user
  I want to browse and transfer files over SFTP
  So that I can manage remote files on my server

  Background:
    Given I am connected to an SSH server

  Scenario: Browse remote directories
    When I open the file browser
    Then I see the remote directory listing

  Scenario: Upload a local file
    When I select a local file and upload it to the server
    Then the file appears in the remote directory

  Scenario: Download a remote file
    When I download a remote file to my device
    Then I can open it locally in Pisth
