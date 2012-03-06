Feature: User Authentication
  This feature helps ensure that only authenticated users
  are able to use the application.

  Background:
    Given the following user exists:
      | email                | password      |
      | relaxdiego@gmail.com | as4943dladdsf |


  Scenario: User logs in with the correct credentials
    When he logs in using the correct credentials
    Then he should be redirected to the groups page
    Then he should be redirected to his home page


  # Scenario Outline: User tries to access a secure page without logging in first
  #   When he tries to access the <PAGE>
  #   Then he should be redirected to the login page
  #    And the system should respond with 'You need to be logged in first.'
  #
  #   Examples:
  #     | PAGE    |
  #     | groups  |
  #     | account |
  #     | tickets |
  #     | ticket  |
  #
  #
  # Scenario Outline: User tries to login with any of these invalid credentials
  #  These are unhappy cases where the user tries to login with invalid credentials
  #
  #  When he tries to login with <EMAIL> and <PASSWORD>
  #  Then he should be redirected to the login page
  #   And the system should display 'Invalid email or password'
  #
  #  Examples:
  #    | EMAIL                            | PASSWORD       |
  #    | relaxdiego@gmail.com             | wrong password |
  #    | aaaaaaaaaa@gmail.com             | as4943dladdsf  |
  #    |                                  |                |
  #
  #
  # Scenario Outline: User logs in after being redirected
  #   This outline ensures that the user doesn't have to manually
  #   go back to the page he was trying to access before he was logged in.
  #
  #   Given he successfully logs in after being redirected from <PAGE>
  #    Then he should be redirected back to the <PAGE>
  #
  #   Examples:
  #     | PAGE    |
  #     | groups  |
  #     | account |
  #     | tickets |
  #     | ticket  |
  #
  #
  # Scenario: User tries to visit the login page when he's already logged in
  #   Given he is logged in
  #    When he visits the log in page
  #    Then he is redirected back to the groups page