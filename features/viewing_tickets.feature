Feature: Viewing tickest
  In order to view the tickets for a project
  As a user
  I want to see them on that project's page

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title         | description                    |
      | Make it shiny | Gradients! Starbursts! Oh my! |
    And there is a project called "Internet Explorer"
    And that project has a ticket:
      | title               | description   |
      | Standard compliance | Isn't a joke. |
    And I am on the homepage

  Scenario: Viewing tickets for a given project
    When I go to "TextMate 2" page
    Then I should see ticket "Make it shiny"
    And I should not see ticket "Standards compliance"
    When I go to "Make it shiny" ticket
    Then I should see description "Gradients! Starbursts! Oh my!"
    And I should see title "Make it shiny"

    When I go to "Ticketee" page
    And I go to "Internet Explorer" page
    Then I should see ticket "Standard compliance"
    And I should not see ticket "Makt it shiny"
    When I go to "Standard compliance" ticket
    Then I should see description "Isn't a joke."
    And I should see title "Standard compliance"