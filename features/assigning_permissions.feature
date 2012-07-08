Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to assign permission throug the UI

  Background:
    Given there are following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
      | user@ticketee.com  | password | false |
    And I am signed in as "admin@ticketee.com" 
    And there is a project called "TextMate 2"
    And "admin@ticketee.com" has created a ticket for this project:
      | title        | description |
      | Shiny Ticket | Make it so! |
    And I want to assign permissions to "user@ticketee.com"

  Scenario: Viewing a project
    When I check "View" for "TextMate 2"
    And I give the permission
    And I sign out
    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"

  Scenario: Creating tickets for a project
    When I check "View" for "TextMate 2"
    And I check "Create Tickets" for "TextMate 2"
    And I give the permission
    And I sign out
    Given I am signed in as "user@ticketee.com"
    When I want to add ticket to "TextMate 2" project
    And I add the ticket "Shiny" with description "Make it so!"
    Then I should see the message "Ticket has been created."

  Scenario: Updating a ticket for a project
    When I check "View" for "TextMate 2"
    And I check "Edit Tickets" for "TextMate 2"
    And I give the permission
    And I sign out
    Given I am signed in as "user@ticketee.com"
    When I go to "TextMate 2" page
    And I go to "Shiny Ticket" ticket
    And I edit the ticket to "Dark Ticket"
    Then I should see the message "Ticket has been updated."

  Scenario: Deleting a ticket
    When I check "View" for "TextMate 2"
    And I check "Delete Tickets" for "TextMate 2"
    And I give the permission
    And I sign out
    Given I am signed in as "user@ticketee.com"
    When I go to "TextMate 2" page
    And I go to "Shiny Ticket" ticket
    And I delete the ticket
    Then I should see the message "Ticket has been deleted."
