Feature: Creating comments on tickets

  Background:
    Given there are following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "Ticketee"
    And "user@ticketee.com" can "view" the "Ticketee" project
    And "user@ticketee.com" has created a ticket for this project:
      | title                   | description                            |
      | Change a ticket's state | You should be able to create a comment |
    Given I am on the homepage
    And I go to "Ticketee" page

  Scenario: Creating a comment
    When I go to "Change a ticket's state" ticket
    And I add "Added a comment!" comment
    Then I should see the message "Comment has been created."
    And I should see "Added a comment!" comment

  Scenario: Creating an invalid comment
    When I go to "Change a ticket's state" ticket
    And I add "" comment
    Then I should see the message "Comment has not been created."
    And I should see "Text can't be blank"
