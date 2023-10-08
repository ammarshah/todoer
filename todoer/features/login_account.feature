Feature: Login account
  As a registered user
  I want to log in to my account
  So that I can use the services

  Rule: User with unconfirmed email cannot login

    Example: User tries to log in with a confirmed email
      Given a registered user with a confirmed email
      And the user is on the login page
      When the user tries to log in
      Then the user should be logged in

    Example: User tries to log in with an unconfirmed email
      Given a registered user with an unconfirmed email
      And the user is on the login page
      When the user tries to log in
      Then the login should fail with an error message indicating that the email is not confirmed
