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
    And I want to assign permissions to "user@ticketee.com"

  Scenario: Viewing a project
    When I check "View" for "TextMate 2"
    And I sign out

    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"
      
