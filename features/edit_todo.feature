@wip
Feature: Edit todo
  As a logged in user
  I want to update my previously added todos
  So that I will stay up-to-date with the things I need to do

  Rule: Completed todos cannot be updated

    Example: User updates an incomplete todo
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "Buy bread"
      When I update the todo's title, present in the incomplete todos list, from "Buy bread" to "Buy bread and butter"
      Then I should see "Buy bread and butter" todo in the incomplete todos list

    Example: User updates a completed todo
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "Buy bread"
      And I marked the todo, with the title "Buy bread", complete
      When I update the todo's title, present in the completed todos list, from "Buy bread" to "Buy bread and butter"
      Then I should see "Buy bread" todo in the completed todos list
