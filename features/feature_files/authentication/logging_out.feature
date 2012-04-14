Feature: Logging Out

  Scenario: User tries to log out
    Given a user is logged in
     When he tries to log out
     Then he should be logged out
      And he should see the log in page
      And the system should display 'Signed out successfully.'