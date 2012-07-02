Feature: Editing a user
  In order to change a user's details
  As an admin
  I want to be able to modify them through the backend


  Background:
    Given there are following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them
    And there are following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am on the homepage
    When I want to edit the user "user@ticketee.com"

  Scenario: Updating a user's details
    When I update user with "newguy@ticketee.com"    
    Then I should see the message "User has been updated."
    And I should see "newguy@ticketee.com"
    And I should not see "user@ticketee.com"

  Scenario: Toggling user's admin
    When I make a user admin
    Then I should see the message "User has been updated."
    And I should see "user@ticketee.com (Admin)"

  Scenario: Updating a user with invalid information
    When I update user with ""
    Then I should see the message "User has not been updated."
