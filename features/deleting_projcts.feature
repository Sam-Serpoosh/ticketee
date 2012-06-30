Feature: Deleting projects
  In order to remove needless projects
  As a project manager
  I want to make them disappear

  Scenario: Deleting a project
    Given there are following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I delete project "TextMate 2"
    Then I should see the message "Project has been deleted"
    And I should not see "TextMate 2" anymore
