Feature: Creating Tickets
  In order to create tickets for projects
  As a user
  I want to be able to select a project and do that

  Background:
    Given there are following users:
      | email             | password |
      | user@ticketee.com | password |
    And there is a project called "Internet Explorer"
    And "user@ticketee.com" can "view" the "Internet Explorer" project
    And "user@ticketee.com" can "create tickets" in the "Internet Explorer" project
    And I am signed in as them
    And I am on the homepage
    When I want to add ticket to "Internet Explorer" project

  Scenario: Creating a ticket
    When I add the ticket "Non-standards compliance" with description "My pages are ugly!"
    Then I should see the message "Ticket has been created."
    And I should see "Created by user@ticketee.com"

  Scenario: Creating a ticket with invalid attributes should be a failure
    When I add a ticket with no name and description
    Then I should see the message "Ticket has not been created."
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"

  Scenario: Description must be longer than 10 characters
    When I add the ticket "Non-standard compliance" with description "it sucks"
    Then I should see the message "Ticket has not been created."
    And I should see "Description is too short"

  Scenario: Creating a ticket with an attachment
    When I add a ticket with "Title" and "Add documentation for blink tag" and I attach "spec/fixtures/speed.txt"
    Then I should see the message "Ticket has been created."
    And I should see "speed.txt" for the ticket
