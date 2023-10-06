Feature: Confirming email
  As a registered user
  I want to confirm my email
  So that I can log in to my account

  Rule: Email will only be confirmed using a confirmation link with a valid confirmation token
  
    Example: User uses a confirmation link with a valid confirmation token
      Given a registered user with an unconfirmed email
      When the user opens the confirmation link with a valid confirmation token
      Then the user email should be confirmed
      And the user should see a confirmation message that their email has been confirmed

    Example: User uses a confirmation link with an invalid confirmation token
      Given a registered user with an unconfirmed email
      When the user opens the confirmation link with an invalid confirmation token
      Then the confirmation should fail with an error message indicating that the confirmation token is invalid

  Rule: Auto-login only happens after confirming an unconfirmed email

    Example: User is auto logged in
      Given a registered user with an unconfirmed email
      When the user successfully confirms their email
      Then the user should be automatically logged in

    Example: User is not auto logged in
      Given a registered user with a confirmed email
      And the user is not logged in
      When the user tries to confirm their email again
      Then the user should not be automatically logged in
      And the user should see a message indicating that their email has already been confirmed
