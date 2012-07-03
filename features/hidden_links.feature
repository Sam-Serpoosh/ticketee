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
    And "user@ticketee.com" can view the "TextMate 2" project

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
