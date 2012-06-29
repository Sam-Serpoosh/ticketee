Feature: Signin up
  In order to be attributed for my work
  As a user
  I want to be able to sign up

  Scenario: Signin up
    Given I am on the homepage
    When I sign up
    Then I should see the message "You have signed up successfully"
