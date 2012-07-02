Feature: Creating users
  In order to add new users to the system
  As an admin
  I want to be able to add them through the backend

  Background:
    Given there are following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them
    And I am on the homepage
    When I want to create new users

  Scenario: Creating a new user
    When I create a new user
    Then I should see the message "User has been created."

  Scenario: User without email is not legitimate
    When I create a new user with no email
    Then I should see the message "User has not been created."
    And I should see "Email can't be blank"

  Scenario: Creating an admin user
    When I create an admin user
    Then I should see the message "User has been created."
    And I should see "newadmin@ticketee.com (Admin)"
