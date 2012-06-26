Feature: Creating projects
  In order to have projects to assign tickets to
  As a user
  I want to create them easily

  Scenario: Creating a project
    Given I am on the homepage
    When I create a project called "TextMate 2"
    Then I should see the message "Project has been created."
    And I should be on the project page for "TextMate 2"
    And I should see "TextMate 2 - Projects - Ticketee" 

  Scenario: Creating a project without name
    Given I am on the homepage
    When I create a project with no name
    Then I should see the message "Project has not been created."
    And I should see "Name can't be blank"
