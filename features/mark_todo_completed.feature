@wip
Feature: Mark todo completed
  As a logged in user
  I want to mark my incomplete todos as completed
  So that I will know the things I have already completed

  Rule: Completed todos must show up in a separate list

    Example: User marks an incomplete todo as completed and sees it in a separate list
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "Buy bread"
      When I mark the todo with the title "Buy bread" as completed
      Then I should see a todo with the title "Buy bread" in the completed todos list
      And I should not see a todo with the title "Buy bread" in the incomplete todos list
