Feature: User Authentication
  This feature helps ensure that only authenticated users
  are able to use the application.

  Background:
    Given the following user exists:
      | email                | password      |
      | relaxdiego@gmail.com | as4943dladdsf |


  Scenario: User logs in with the correct credentials
    When he logs in using the correct credentials
    Then he should be redirected to his home page


  Scenario Outline: User attempts to access a secure page without logging in
    When he attempts to access <page> which is a secure page
    Then he should be redirected to the log in page

    Examples:
      | page    |
      | groups  |
      | items   |


  Scenario Outline: User tries to login with any of these invalid credentials
    When he tries to login with these invalid credentials: <email>, <password>
    Then he should be redirected to the log in page
     And the system should display 'Invalid email or password'

    Examples:
      | email                            | password       |
      | relaxdiego@gmail.com             | wrong-password |
      | aaaaaaaaaa@gmail.com             | as4943dladdsf  |
      |                                  |                |
      | relaxdiego@gmail.com             |                |


  Scenario: User tries to visit the login page when he's already logged in
    Given he is logged in
     When he visits the log in page
     Then he should be redirected to his home page


  Scenario Outline: User logs in after being redirected
    This outline ensures that the user doesn't have to manually
    go back to the page he was trying to access before he was logged in.

    Given he successfully logged in after being redirected from <page>
    Then he should be redirected back to the <page>

    Examples:
      | page   |
      | groups |
      | items  |