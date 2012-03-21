Feature: Ticket Management

  Background:
    * A workspace named Installation Department exists
    * A user named Oscar is logged in

  Scenario: Create a ticket
    Given Oscar is a member of the Installation Department workspace
     When he tries to create a ticket in that workspace
     Then the ticket should be created under the workspace
      And the system will display 'Ticket was successfully created'

  Scenario: User is not a member of the workspace
    Given Oscar is not a member of the Installation Department workspace
     When he tries to create a ticket in that workspace
     Then the ticket should not be created
      And the system will display 'You are not allowed to do that'