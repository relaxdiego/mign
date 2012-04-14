Feature: Logging In
  This feature helps ensure that only authenticated users are able to use the application.

  Scenario Outline: Someone attempts to log in
    Given a user with the following credentials exists:
      | email                | password      |
      | relaxdiego@gmail.com | as4943dladdsf |
    When someone attempts to log in with the following credentials: <email>, <password>
    Then he will be redirected to the <page> page

    Examples: Valid Credentials
      | email                | password       | page        |
      | relaxdiego@gmail.com | as4943dladdsf  | workspaces  |
      | RELAXDIEGO@GMAIL.COM | as4943dladdsf  | workspaces  |

    Examples: Invalid Credentials
      | email                | password       | page  |
      | relaxdiego@gmail.com | wrong-password | login |
      | aaaaaaaaaa@gmail.com | as4943dladdsf  | login |
      |                      |                | login |
      | relaxdiego@gmail.com |                | login |


  Scenario Outline: Someone attempts to access a secure page without logging in
    When someone attempts to access <page> without logging in first
    Then he will be redirected to the log in page

    Examples:
      | page        |
      | workspaces  |
      | tickets     |


  Scenario: User tries to visit the login page when he's already logged in
    Given a user is logged in
     When he visits the log in page
     Then he will be redirected to the workspaces page


  Scenario Outline: User logs in after being redirected
    This outline ensures that the user doesn't have to manually
    go back to the page he was trying to access before logging in.

    Given a user exists
     When he attempts to access <page> without logging in first
     Then he will be redirected to the log in page
     When he logs in
     Then he will be redirected to the <page> page

    Examples:
      | page       |
      | workspaces |
      | tickets    |