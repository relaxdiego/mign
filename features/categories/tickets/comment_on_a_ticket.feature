Feature: Comment on a Ticket

  Scenario: Workspace member comments on a ticket
    Given a workspace exists
      And a ticket exists in that workspace
      And a user is logged in
      And she is a member of the workspace
     When she tries to add a comment to the ticket
     Then the comment will be appended to the ticket
