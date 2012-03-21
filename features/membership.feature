Feature: Membership Management
  This feature allows authorized users to add members to their workspace

  Background:
    * A user named Joel is logged in

  Scenario: Add a member to a workspace that he owns
    Given he owns a workspace named Marketing Department
      And he has an officemate named Joey
     When he tries to make Joey a member of said workspace
     Then Joey will be a member of that workspace
      And the system will display 'Joey is now a member of the Marketing Department workspace'


  Scenario: Add a member to a workspace that he doesn't own
    Given a workspace named Sales Department exists
      And he has an officemate named George
     When he tries to make George a member of said workspace
     Then the system will display 'You are not allowed to do that'