Feature: Editin Projects
  In order to update project information
  As a user
  I want o be able to do that through an interface

  Background:
    Given there are following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them
    And there is a project called "TextMate 2"
    And I am on the homepage

  Scenario: Updating a project
    When I edit the project "TextMate 2" to "TextMate 2 beta"
    Then I should see the message "Project has been updated."
    And I should be on the project page for "TextMate 2 beta"

  Scenario: Updating a project with invlaid attributes wont affect
    When I edit the project "TextMate 2" to ""
    Then I should see the message "Project has not been updated."
