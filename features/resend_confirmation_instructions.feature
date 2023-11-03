Feature: Resend confirmation email
  As a registered user with an unconfirmed email
  I want to resend confirmation instructions
  So that I can confirm my email and log in to my account

  Rule: User with unconfirmed email should see an option to resend confirmation instructions when login

    @javascript
    Example: User with unconfirmed email gets an option to resend confirmation instructions
      Given I have an account with an unconfirmed email
      And I am on the login page
      When I log in
      Then I should see an option to resend confirmation instructions

  Rule: Confirmation email will only be sent for unconfirmed email

    Example: User with an unconfirmed email resends confirmation email
      Given I registered my account
      But I did not confirm my email
      And I am on the resend confirmation page
      When I resend the confirmation email
      Then I should see a success message indicating that the resend confirmation email has been sent

    Example: User with a confirmed email resends confirmation email
      Given I registered my account
      And I confirmed my email
      And I am on the resend confirmation page
      When I resend the confirmation email
      Then I should see an error message indicating that the email is already confirmed
