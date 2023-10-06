Feature: Resend confirmation email
  As a registered user with an unconfirmed email
  I want to resend confirmation email
  So that I can confirm my email

  Rule: Confirmation email will only be sent for unconfirmed email

    Example: User with an unconfirmed email can resend confirmation email
      Given a registered user with an unconfirmed email
      And the user is on the resend confirmation page
      When the user tries to resend the confirmation email
      Then the user should see a message indicating that the resend confirmation email has been sent

    Example: User with a confirmed email cannot resend confirmation email
      Given a registered user with a confirmed email
      And the user is on the resend confirmation page
      When the user tries to resend the confirmation email
      Then the resend confirmation should fail with an error message indicating that the email is already confirmed
