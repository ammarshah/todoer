Feature: List todos
  As a logged in user
  I want to see the list of my previously added todos
  So that I will know the things I need to do

  Rule: Every user must only see their own todos

    @javascript
    Example: User does not see other users' todos
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "Buy bread"
      When another user logs in
      And he goes to the app page
      Then he should not see a todo with the title "Buy bread" in the incomplete todos list

  Rule: Incomplete todos list must list todos in an ascending order by recently added

    @javascript
    Example: User adds a new todo and sees it at the bottom of the incomplete todos list
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "Old todo"
      When I add a todo with the title "New todo"
      Then I should see the todo with the title "New todo" as the last item in the incomplete todos list

  Rule: Todo marked as incomplete must show up at the bottom of the incomplete todos list

    @javascript
    Example: User marks a todo as incomplete and sees it at the bottom of the incomplete todos list
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "First todo"
      And I added a todo with the title "Second todo"
      And I marked the todo with the title "First todo" as completed
      When I mark the todo with the title "First todo" as incomplete
      Then I should see the todo with the title "First todo" as the last item in the incomplete todos list

  Rule: Todo marked as completed must show up at the top of the completed todos list

    @javascript
    Example: User marks a todo as completed and sees it at the top of the completed todos list
      Given I am logged in
      And I am on the app page
      And I added a todo with the title "First todo"
      And I added a todo with the title "Second todo"
      And I marked the todo with the title "First todo" as completed
      When I mark the todo with the title "Second todo" as completed
      Then I should see the todo with the title "Second todo" as the first item in the completed todos list
