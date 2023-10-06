Feature: Reset password
  As a registered user
  I want to reset my password
  So that I can regain access to my account

  Rule: Reset password can only be requested for a registered email

    Example: User requests to reset the password of a registered email
      Given the user is on the forgot password page
      When the user requests to reset the password of a registered email
      Then the user should see a message indicating that the reset password instructions has been sent to the email

    Example: User requests to reset the password of an unregistered email
      Given the user is on the forgot password page
      When the user requests to reset the password of an unregistered email
      Then the reset password should fail with an error message indicating that the email is not found
  
  Rule: Reset password link can only be used once

    Example: User opens an unused reset password link
      Given the user has an unused reset password link
      When the user opens the link
      Then the user should be directed to the reset password page
      And the user should see the reset password form

    Example: User opens an already used reset password link
      Given the user has an already used reset password link
      When the user opens the link
      Then the user should see an error message indicating that the link has been expired

  Rule: New password should not match any of the old passwords

    Example: User tries to set an unused password
      Given a registered user with password "strong123"
      And the user is on the reset password page
      When the user tries to set "verystrong123" as the new password
      Then the user should see a message indicating that the new password has been set

    Example: User tries to set an already used password
      Given a registered user with password "strong123"
      And the user is on the reset password page
      When the user tries to set "strong123" as the new password
      Then the reset password should fail with an error message indicating that the new password cannot be one of their old passwords
