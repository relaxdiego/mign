Feature: Register
  As an unregistered user, I should be able to register so that I can log in
  and start using the application

  Scenario Outline: Register an account
    When someone tries to register with <First Name>, <Last Name>, <Email>, <Password>, and <Password Confirmation>
    Then the registration should <Result>

    Examples: Valid details
      | First Name | Last Name | Email            | Password | Password Confirmation | Result  |
      | Joe        | Black     | jblack@gmail.com | af034dar | af034dar              | Succeed |
      | Joe        |           | jblack@gmail.com | af034dar | af034dar              | Succeed |

    Examples: Invalid details
      | First Name | Last Name | Email            | Password | Password Confirmation | Result  |
      |            | Black     | jblack@gmail.com | af034dar | af034dar              | Fail    |
      | Joe        | Black     |                  | af034dar | af034dar              | Fail    |
      | Joe        | Black     | jblack@gmail.com | bf034dar | af034dar              | Fail    |