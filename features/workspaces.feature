Feature: Workspace Management
  This feature allows authorized users to manage their workspaces

  Background:
    Given a user named Amanda Jackson is logged in


  Scenario: Create a workspace
    When she creates a workspace named Sales Department
    Then she will be an owner of that workspace


  Scenario: Edit a workspace that she owns
    Given she owns a workspace named HR Department
     When she tries to edit the workspace with the following attributes:
      | name                 | description                |
      | Marketing Department | This is for the mktng dept |
     Then the workspace will be updated accordingly


  Scenario: Attempt to edit a workspace that she doesn't own
    Given a workspace named IT Department exists
     When she tries to edit the workspace with the following attributes:
      | name                 | description                |
      | Marketing Department | This is for the mktng dept |
     Then the workspace will not be updated
      And the system will display 'You are not allowed to do that'


  Scenario: Add a member to a workspace that she owns
    Given she owns a workspace named Marketing Department
      And she has an officemate named Joey
     When she tries to add Joey as a member to her workspace
     Then Joey will be a member of that workspace
      And the system will display 'Joey is now a member of the Marketing Department workspace'


  Scenario: Add a member to a workspace that she doesn't
    Given a workspace named Sales Department exists
      And she has an officemate named George
     When she tries to add George as a member to that workspace
     Then the system will display 'You are not allowed to do that'