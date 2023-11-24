Feature: Add todo
  As a logged in user
  I want to add a todo
  So that I don't have to remember everything I need to do in the future

  Rule: Title is required

    @javascript
    Example: User adds a todo with a title
      Given I am logged in
      And I am on the app page
      When I add a todo with the title "Buy bread"
      Then I should see a todo with the title "Buy bread" in the incomplete todos list

    @javascript
    Example: User adds a todo without a title
      Given I am logged in
      And I am on the app page
      When I add a todo with the title ""
      Then I should see an error message indicating that a title is required

  Rule: Title length must be of maximum 1000 characters

    @javascript
    Example: User adds a todo with a 1000-character title
      Given I am logged in
      And I am on the app page
      And I have 0 todos in the incomplete todos list
      When I add a todo with a 1000-character title
      Then I should have 1 todo in the incomplete todos list

    @javascript
    Example: User adds a todo with a 1001-character title
      Given I am logged in
      And I am on the app page
      And I have 0 todos in the incomplete todos list
      When I add a todo with a 1001-character title
      Then I should see an error message indicating that the title must be maximum 1000 characters long
      And I should have 0 todos in the incomplete todos list

  @wip
  Rule: Multi-line and extra spaces in the title must be auto-squished

    Example: User pastes a multi-line title
      Given I am logged in
      And I am on the app page
      When I paste a multi-line title
        """
        Buy 

        bread
        """
      Then I should see an auto-squished title as "Buy bread"

    Example: User adds a todo with title containing extra spaces
      Given I am logged in
      And I am on the app page
      When I add a todo with the title "   Buy    bread "
      Then I should see a todo with the title "Buy bread" in the incomplete todos list
