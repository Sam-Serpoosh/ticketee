Feature: Deleting users
  In order to remove users
  As an admin
  I want to be able to delete them through the backend

  Background:
    Given there are following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
      | user@ticketee.com  | password | false |
    And I am signed in as "admin@ticketee.com"
    And I am on the homepage
    When I want to delete a user

  Scenario: Deleting a user
    When I delete "user@ticketee.com"
    Then I should see the message "User has been deleted."

  Scenario: Can't delete yourself 
    When I delete "admin@ticketee.com"
    Then I should see the message "You can't delete yourself."
