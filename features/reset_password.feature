Feature: Reset password
  As a registered user who has forgotten their password
  I want to reset my password
  So that I can regain access to my account

  Rule: Reset password can only be requested for a registered email

    @javascript
    Example: User requests to reset the password of a registered email
      Given I have an account with the email "user@example.com"
      And I am on the forgot password page
      When I request to reset the password of a registered email "user@example.com"
      Then I should see a success message indicating that the reset password instructions has been sent to my email

    Example: User requests to reset the password of an unregistered email
      Given I am on the forgot password page
      When I request to reset the password of an unregistered email "unregistered_email@example.com"
      Then I should see an error message indicating that the email is not found

  Rule: Reset password link can only be used once

    @javascript
    Example: User uses an unused reset password link
      Given I requested to reset my password
      And I received the reset password email
      When I follow the reset password link in the email
      And I reset my password
      Then I should see a success message indicating that my password has been changed successfully

  Rule: Password will only be reset using a reset password link with a valid reset password token

    @javascript
    Example: User uses a reset password link with an invalid reset password token
      Given I requested to reset my password
      And I received the reset password email
      But I altered the reset password token
      When I follow the reset password link in the email
      And I reset my password
      Then I should see an error message indicating that the reset password token is invalid

    @javascript
    Example: User uses an already used reset password link
      Given I requested to reset my password
      And I received the reset password email
      And I followed the reset password link in the email
      And I reset my password
      When I follow the reset password link in the email again
      And I reset my password
      Then I should see an error message indicating that the reset password link is invalid

  Rule: New password must not match any of the old passwords

    @javascript
    Example: User sets an unused password
      Given I have an account with the password "strong123"
      And I requested to reset my password
      And I received the reset password email
      And I followed the reset password link in the email
      When I reset my password to "verystrong123"
      Then I should see a success message indicating that my password has been changed successfully

    @javascript
    Example: User sets an already used password
      Given I have an account with the password "strong123"
      And I requested to reset my password
      And I received the reset password email
      And I followed the reset password link in the email
      When I reset my password to "strong123"
      Then I should see an error message indicating that the password was previously used
