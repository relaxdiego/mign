Feature: User Authentication
  This feature helps ensure that only authenticated users are able to use the application.

  Background:
    * The following user exists:
      | email                | password      |
      | relaxdiego@gmail.com | as4943dladdsf |


  Scenario Outline: User tries to log in
    When he logs in with the following credentials: <email>, <password>
    Then he will be redirected to <page>
     And the system will display '<message>'

    Examples:
      | email                | password       | page  | message                   |
      | relaxdiego@gmail.com | as4943dladdsf  | home  | Signed in successfully    |
      | relaxdiego@gmail.com | wrong-password | login | Invalid email or password |
      | aaaaaaaaaa@gmail.com | as4943dladdsf  | login | Invalid email or password |
      |                      |                | login | Invalid email or password |
      | relaxdiego@gmail.com |                | login | Invalid email or password |


  Scenario Outline: User attempts to access a secure page without logging in
    When he attempts to access <page> without logging in first
    Then he will be redirected to the log in page

    Examples:
      | page        |
      | workspaces  |
      | tickets     |


  Scenario: User tries to visit the login page when he's already logged in
    Given he is logged in
     When he visits the log in page
     Then he will be redirected to his home page


  Scenario Outline: User logs in after being redirected

    This outline ensures that the user doesn't have to manually
    go back to the page he was trying to access before logging in.

    Given he successfully logged in after being redirected from <page>
    Then he will be redirected to <page>

    Examples:
      | page       |
      | workspaces |
      | tickets    |