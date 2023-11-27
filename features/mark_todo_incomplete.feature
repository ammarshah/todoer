Feature: Mark todo incomplete
  As a logged in user
  I want to mark my completed todos as incomplete
  So that I will know the things I still need to work on

  Rule: Incomplete todos must show up in a separate list

    @javascript
    Example: User marks a completed todo as incomplete and sees it in a separate list
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "Buy bread"
      And I marked the todo with the title "Buy bread" as completed
      When I mark the todo with the title "Buy bread" as incomplete
      Then I should see a todo with the title "Buy bread" in the incomplete todos list
      And I should not see a todo with the title "Buy bread" in the completed todos list
