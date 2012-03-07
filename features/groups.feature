Feature: Group Management
  This feature allows authorized users to manage their groups

  Background:
    Given a user is logged in


  Scenario: Create a group
    When she creates a group named 'My Group'
    Then she will be an owner of that group


  Scenario: Edit a group that she owns
    Given she owns a group named 'HR Department'
     When she tries to edit the group with the following attributes:
      | name                 | description                |
      | Marketing Department | This is for the mktng dept |
     Then the group will be updated accordingly


  Scenario: Attempt to edit a group that she doesn't own
    Given a group named 'IT Department' exists
     When she tries to edit the group with the following attributes:
      | name                 | description                |
      | Marketing Department | This is for the mktng dept |
     Then the group will not be updated
      And the system will display 'You are not allowed to do that'