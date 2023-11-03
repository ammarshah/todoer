Feature: Confirm email
  As a registered user
  I want to confirm my email
  So that I can log in to my account

  Rule: Email will only be confirmed using a confirmation link with a valid confirmation token

    @javascript
    Example: User uses a confirmation link with a valid confirmation token
      Given I registered my account
      And I received the confirmation email
      When I follow the confirmation link in the email
      Then I should see a success message indicating that the email has been confirmed

    Example: User uses a confirmation link with an invalid confirmation token
      Given I registered my account
      And I received the confirmation email
      But I altered the confirmation token
      When I follow the confirmation link in the email
      Then I should see an error message indicating that the confirmation token is invalid

  Rule: Auto-login only happens after confirming an unconfirmed email

    @javascript
    Example: User confirms an unconfirmed email
      Given I registered my account
      When I confirm my email
      Then I should be automatically logged in
      And I should see a success message indicating that the email has been confirmed

    Example: User confirms an already confirmed email
      Given I registered my account
      And I confirmed my email
      But I am not logged in
      When I confirm my email again
      Then I should not be automatically logged in
      And I should see an error message indicating that the email is already confirmed
