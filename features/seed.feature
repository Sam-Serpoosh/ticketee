Feature: Seed Data
  In order to fill the databse with the basics
  As the system
  I want to run the seed task

  Scenario: The basics
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    When I want to add ticket to "Ticketee Beta" project
    And I add the ticket "Comments with state" with description "have state"
    Then I should see state "New"
    And I should see state "Open"
    And I should see state "Closed"
