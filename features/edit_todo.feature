Feature: Edit todo
  As a logged in user
  I want to update my previously added todos
  So that I will stay up-to-date with the things I need to do

  # TODO: Rule: Pressing enter key or focus out of title field while editing a todo must save the changes

  # TODO: Rule: Pressing escape key while editing a todo must revert the changes

  Rule: Completed todos cannot be updated

    @javascript
    Example: User updates an incomplete todo
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "Buy bread"
      When I update the todo's title, present in the incomplete todos list, from "Buy bread" to "Buy bread and butter"
      And I refresh the page
      Then I should see a todo with the title "Buy bread and butter" in the incomplete todos list

    @javascript
    Example: User updates a completed todo
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "Buy bread"
      And I marked the todo with the title "Buy bread" as completed
      When I update the todo's title, present in the completed todos list, from "Buy bread" to "Buy bread and butter"
      And I refresh the page
      Then I should see a todo with the title "Buy bread" in the completed todos list
