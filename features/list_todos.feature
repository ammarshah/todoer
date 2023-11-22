@wip
Feature: List todos
  As a logged in user
  I want to see the list of my previously added todos
  So that I will know the things I need to do

  Rule: Every user must only see their own todos

    Example: User does not see other users' todos
      Given I am logged in
      And I am on the app page
      And I added a todo with a title "Buy bread"
      When another user logs in
      And he goes to the app page
      Then he should not see "Buy bread" todo in the incomplete todos list
