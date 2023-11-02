Feature: Login
  As a registered user
  I want to log in to my account
  So that I can use the services

  Rule: User cannot login with an unconfirmed email

    @javascript
    Example: User logs in with a confirmed email
      Given I have an account with a confirmed email
      And I am on the login page
      When I log in
      Then I should see a success message indicating that I am logged in

    @javascript
    Example: User logs in with an unconfirmed email
      Given I have an account with an unconfirmed email
      And I am on the login page
      When I log in
      Then I should see an error message indicating that the email is not confirmed
