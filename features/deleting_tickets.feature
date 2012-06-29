Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to be able to delete them through the interface

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title         | description                   |
      | Make it shiny | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I go to "TextMate 2" page
    And I go to "Make it shiny" ticket

    Scenario: Deleting a ticket
      When I delete the ticket
      Then I should see "Ticket has been deleted."
      And I should be on the project page for "TextMate 2"
