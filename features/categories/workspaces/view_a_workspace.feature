Feature: View a Workspace

  Background:
    * A user named Arya is logged in
    * A workspace named Needle Department exists
    * That workspace has the following tickets
      | Subject                                   |
      | Practice with the First Sword of Braavosi |
      | Find enemies                              |
      | Stick 'em with the pointy end             |

  Scenario: View a workspace that she is a member of
    Given she is a member of that workspace
     When she tries to view that workspace
     Then she will see the following tickets
      | Subject                                   |
      | Practice with the First Sword of Braavosi |
      | Find enemies                              |
      | Stick 'em with the pointy end             |
