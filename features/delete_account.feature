Feature: Delete account
  As a logged in user
  I want to permanently delete my account with all of its data
  So I can no longer be considered a Todoer

  Rule: User must be logged out immediately after deleting their account

    @javascript
    Example: User logged out immediately
      Given I am logged in
      And I am on the account page
      When I delete my account
      Then I should see a success message indicating that I am no longer considered a Todoer
      And I should be logged out

  Rule: User must not be able to login with the email address from which they deleted their account

    Example: User cannot login
      Given I have an account with the email "user@example.com" and the password "password"
      And I am logged in
      And I am on the account page
      When I delete my account
      And I go to the login page
      And I login with with the email "user@example.com" and the password "password"
      Then I should see an error message indicating that the email or password is invalid

  Rule: User can register again with the same email address from which they deleted their account

    Example: User registers with the same email address
      Given I have an account with the email "user@example.com" and the password "password"
      And I am logged in
      And I am on the account page
      When I delete my account
      And I go to the register page
      And I register with the email "user@example.com" and the password "password"
      Then I should see a success message indicating that I have to confirm my email to activate the account
