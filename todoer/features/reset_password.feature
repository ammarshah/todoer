Feature: Reset password
  As a registered user
  I want to reset my password
  So that I can regain access to my account

  Rule: Reset password can only be requested for a registered email

    Example: User requests to reset the password of a registered email
      Given I am on the forgot password page
      When I request to reset the password of a registered email
      Then I should see a success message indicating that the reset password instructions has been sent to my email

    Example: User requests to reset the password of an unregistered email
      Given I am on the forgot password page
      When I request to reset the password of an unregistered email
      Then I should see an error message indicating that the email is not found
  
  Rule: Reset password link can only be used once

    Example: User opens an unused reset password link
      Given I have an unused reset password link
      When I open the link
      Then I should see the reset password form

    Example: User opens an already used reset password link
      Given I have an already used reset password link
      When I open the link
      Then I should see an error message indicating that the link has been expired

  Rule: New password should not match any of the old passwords

    Example: User sets an unused password
      Given I registered my account with the password "strong123"
      And I am on the reset password page
      When I set "verystrong123" as my new password
      Then I should see a success message indicating that the new password has been set

    Example: User sets an already used password
      Given I registered my account with the password "strong123"
      And I am on the reset password page
      When I set "strong123" as my new password
      Then I should see an error message indicating that the new password cannot be one of my old passwords
