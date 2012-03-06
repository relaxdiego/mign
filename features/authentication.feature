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
