Feature: View Workspaces

  Background:
    * The following workspaces exist in the system:
      | Name                 |
      | HR Department        |
      | IT Department        |
      | Product Quality Team |
      | Winterfell           |
    * A user named Oscar is logged in
    * He is a member of the following workspaces
      | Name                 |
      | IT Department        |
      | Product Quality Team |

  Scenario:
    When he visits the workspaces page
    Then he should see the following workspaces
      | Name                 |
      | IT Department        |
      | Product Quality Team |
     And he should not see the other workspaces