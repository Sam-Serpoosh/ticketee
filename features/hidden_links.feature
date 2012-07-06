Feature: Hidden Links
  In order to clean up the user experience
  As the system
  I want to hide links from users who can't act on them

  Background:
    Given there are following users:
      | email              | password | admin  |
      | user@ticketee.com  | password | false  |
      | admin@ticketee.com | password | true   |
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can "view" the "TextMate 2" project
    And "user@ticketee.com" has created a ticket for this project:
      | title | description                    |
      | shiny | Gradients! Starbursts! Oh my!  |

  Scenario: New Project link is hidden for non-signed-in users
    Given I am on the homepage
    Then I should not see "New Project" link

  Scenario: New Project link is hidden for normal signed-in users
    Given I am signed in as "user@ticketee.com"
    Then I should not see "New Project" link

  Scenario: New Project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    Then I should see "New Project" link

  Scenario: Edit Project link is hidden for normal signed-in users
    Given I am signed in as "user@ticketee.com"
    When I go to "TextMate 2" page
    Then I should not see "Edit Project" link

  Scenario: Edit Project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I go to "TextMate 2" page
    Then I should see "Edit Project" link
  
  Scenario: Delete Project link is hidden for normal signed-in users
    Given I am signed in as "user@ticketee.com"
    When I go to "TextMate 2" page
    Then I should not see "Delete Project" link

  Scenario: Delete Project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I go to "TextMate 2" page
    Then I should see "Delete Project" link

  Scenario: Only users with permission can see New Ticket link 
    Given I am signed in as "user@ticketee.com"
    And "user@ticketee.com" can "create tickets" in the "TextMate 2" project
    When I go to "TextMate 2" page
    Then I should see "New Ticket" link

  Scenario: users without permission can't see New Ticket link
    Given I am signed in as "user@ticketee.com"
    When I go to "TextMate 2" page
    Then I should not see "New Ticket" link

  Scenario: admins should see the New Ticket link
    Given I am signed in as "admin@ticketee.com"
    When I go to "TextMate 2" page
    Then I should see "New Ticket" link

  Scenario: only users with permission can see Edit Ticket link
    Given I am signed in as "user@ticketee.com"
    And "user@ticketee.com" can "edit tickets" in the "TextMate 2" project
    When I go to "TextMate 2" page
    And I go to "shiny" ticket
    Then I should see "Edit Ticket" link

  Scenario: users without permission can't see the Edit Ticket link 
    Given I am signed in as "user@ticketee.com"
    When I go to "TextMate 2" page
    And I go to "shiny" ticket
    Then I should not see "Edit Ticket" link

  Scenario: admins can see the Edit Ticket link 
    Given I am signed in as "admin@ticketee.com"
    When I go to "TextMate 2" page
    And I go to "shiny" ticket
    Then I should see "Edit Ticket" link

  Scenario: only users with permission can see Delete Ticket link
    Given I am signed in as "user@ticketee.com"
    And "user@ticketee.com" can "delete tickets" in the "TextMate 2" project
    When I go to "TextMate 2" page
    And I go to "shiny" ticket
    Then I should see "Delete Ticket" link

  Scenario: Users without permission can't see the Delete Ticket link
    Given I am signed in as "user@ticketee.com"
    When I go to "TextMate 2" page
    And I go to "shiny" ticket
    Then I should not see "Delete Ticket" link

  Scenario: admins can see the Delete Ticket link
    Given I am signed in as "admin@ticketee.com"
    When I go to "TextMate 2" page
    And I go to "shiny" ticket
    Then I should see "Delete Ticket" link
