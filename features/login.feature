Feature: Login
  As a registered user
  I want to log in to my account
  So that I can use the services

  Rule: User must provide both valid email and password to login

    @javascript
    Example: User logs in with both valid email and password
      Given I have an account with the email "user@example.com" and the password "password"
      And I am on the login page
      When I login with valid email "user@example.com" and valid password "password"
      Then I should see a success message indicating that I am logged in

    @javascript
    Example: User logs in with both invalid email and password
      Given I have an account with the email "user@example.com" and the password "password"
      And I am on the login page
      When I login with invalid email "invalid@example.com" and invalid password "invalidPassword"
      Then I should see an error message indicating that the email or password is invalid

    @javascript
    Example: User logs in with valid email and invalid password
      Given I have an account with the email "user@example.com" and the password "password"
      And I am on the login page
      When I login with valid email "user@example.com" and invalid password "invalidPassword"
      Then I should see an error message indicating that the email or password is invalid

    @javascript
    Example: User logs in with invalid email and valid password
      Given I have an account with the email "user@example.com" and the password "password"
      And I am on the login page
      When I login with invalid email "invalid@example.com" and valid password "password"
      Then I should see an error message indicating that the email or password is invalid

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
