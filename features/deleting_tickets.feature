Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to be able to delete them through the interface

  Background:
    Given there are following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title         | description                    |
      | Make it shiny | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I go to "TextMate 2" page
    And I go to "Make it shiny" ticket
    
    Scenario: Deleting a ticket
      When I delete the ticket
      Then I should see "Ticket has been deleted."
      And I should be on the project page for "TextMate 2"
