Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Background:
    Given there are following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "TextMate 2"
    And there is a project called "Internet Explorer"
    And "user@ticketee.com" can "view" the "TextMate 2" project

  Scenario: Listing all projects
    Given I am on the homepage
    Then I should see "TextMate 2"
    And I should not see "Internet Explorer"
