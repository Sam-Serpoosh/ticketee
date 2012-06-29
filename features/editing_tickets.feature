Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit the ticket

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title         | description                  |
      | Make it shiny | Gradients! Starbursts! Oh my |
    Given I am on the homepage
    When I go to "TextMate 2" page
    And I go to "Make it shiny" ticket

    Scenario: Updating a ticket
      When I edit the ticket to "Make it really shiny"
      Then I should see the message "Ticket has been updated."
      And I should see title "Make it really shiny"
      And I should not see "Make it shiny"

    Scenario: Updating ticket with invalid information
      When I edit the ticket to ""
      Then I should see the message "Ticket has not been updated."