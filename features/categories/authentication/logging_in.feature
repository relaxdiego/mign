Feature: Logging In
  This feature helps ensure that only authenticated users are able to use the application.

  Scenario Outline: Someone attempts to log in
    Given a user with the following credentials exists:
      | email                | password      |
      | relaxdiego@gmail.com | as4943dladdsf |
    When someone attempts to log in with the following credentials: <email>, <password>
    Then he will be redirected to the <page> page
     And the system will display '<message>'

    Examples: Valid Credentials
      | email                | password       | page  | message                   |
      | relaxdiego@gmail.com | as4943dladdsf  | home  | Signed in successfully    |
      | RELAXDIEGO@GMAIL.COM | as4943dladdsf  | home  | Signed in successfully    |

    Examples: Invalid Credentials
      | email                | password       | page  | message                   |
      | relaxdiego@gmail.com | wrong-password | login | Invalid email or password |
      | aaaaaaaaaa@gmail.com | as4943dladdsf  | login | Invalid email or password |
      |                      |                | login | Invalid email or password |
      | relaxdiego@gmail.com |                | login | Invalid email or password |


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
     Then he will be redirected to his home page


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