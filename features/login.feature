Feature: Login
  As a registered user
  I want to log in to my account
  So that I can use the services

  Rule: User with unconfirmed email cannot login

    Example: User logs in with a confirmed email
      Given I registered my account
      And I confirmed my email
      And I am on the login page
      When I log in
      Then I should see a success message indicating that I am logged in

    Example: User logs in with an unconfirmed email
      Given I registered my account
      But I did not confirm my email
      And I am on the login page
      When I log in
      Then I should see an error message indicating that the email is not confirmed
