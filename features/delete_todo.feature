@wip
Feature: Delete todo
  As a logged in user
  I want to delete my previously added todos
  So that I don't have unnecessary todos in the list

  Scenario: User deletes an incomplete todo
    Given I am logged in
    And I am on the app page
    And I added a todo with the title "Buy bread"
    When I delete the todo, present in the incomplete todos list, with the title "Buy bread"
    Then I should not see a todo with the title "Buy bread" in the incomplete todos list

  Scenario: User deletes a completed todo
    Given I am logged in
    And I am on the app page
    And I added a todo with the title "Buy bread"
    And I marked the todo with the title "Buy bread" as completed
    When I delete the todo, present in the completed todos list, with the title "Buy bread"
    Then I should not see a todo with the title "Buy bread" in the completed todos list
