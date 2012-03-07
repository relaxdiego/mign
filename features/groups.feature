Feature: Group Management
  This feature allows authorized users to manage their groups

  Background:
    Given a user is logged in


  Scenario: Create a group
    When she creates a group named 'My Group'
    Then she will be an owner of that group