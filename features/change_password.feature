Feature: Change password
  As a logged in user
  I want to change my password
  So I can secure my account

  Rule: User must provide current password, new password and retype new password

    @javascript
    Example: User provides current password, new password and retype new password
      Given I have an account with the password "password"
      And I am logged in
      And I am on the account page
      When I change my password by providing current password "password", new password "newPassword" and retype new password "newPassword"
      Then I should see a success message indicating that my account is updated successfully

    Example: User provides new password and retype new password but not current password
      Given I have an account with the password "password"
      And I am logged in
      And I am on the account page
      When I change my password by providing current password "", new password "newPassword" and retype new password "newPassword"
      Then I should see an error message indicating that the current password is required

  Rule: New password and retype new password must exactly match

    Example: User enters different new password and retype new password
      Given I have an account with the password "password"
      Given I am logged in
      And I am on the account page
      When I change my password by providing current password "password", new password "newPassword" and retype new password "NEWPASSWORD"
      Then I should see an error message indicating that the new passwords do not match

  Rule: New password must not match any of the old passwords

    @javascript
    Example: User sets an unused password
      Given I have an account with the password "strong123"
      And I requested to reset my password
      And I received the reset password email
      And I followed the reset password link in the email
      When I change my password to "verystrong123"
      Then I should see a success message indicating that my password has been changed successfully

    @javascript
    Example: User sets an already used password
      Given I have an account with the password "strong123"
      And I requested to reset my password
      And I received the reset password email
      And I followed the reset password link in the email
      When I change my password to "strong123"
      Then I should see an error message indicating that the password was previously used
