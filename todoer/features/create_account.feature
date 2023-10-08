Feature: Create account
  As an anonymous user
  I want to create an account
  So that I can use the services

  Rule: Email and password are required

    Example: User enters both email and password
      Given the user is on the registration page
      When the user enters a valid email and a valid password
      And submits the registration form
      Then the user should successfully create an account

    Example: User enters only email
      Given the user is on the registration page
      When the user enters a valid email
      And submits the registration form
      Then the registration should fail with an error message indicating that a password is required

    Example: User enters only password
      Given the user is on the registration page
      When the user enters a valid password
      And submits the registration form
      Then the registration should fail with an error message indicating that an email is required

  Rule: Email must have a valid format

    Example: User enters an invalid email
      Given the user is on the registration page
      When the user enters an invalid email address like "invalid_email"
      And enters a valid password
      And submits the registration form
      Then the registration should fail with an error message indicating that the email format is invalid

  Rule: Password length must be at least 6 characters

    Example: User enters a 6-character password
      Given the user is on the registration page
      When the user enters a valid email
      And enters a 6-character password like "123456"
      And submits the registration form
      Then the user should successfully create an account

    Example: User enters a 5-character password
      Given the user is on the registration page
      When the user enters a valid email
      And enters a 5-character password like "12345"
      And submits the registration form
      Then the registration should fail with an error message indicating that the password must be at least 6 characters long

  Rule: Email must be unique

    Example: User tries to create an account using an existing email
      Given an existing user with the email address "existing@example.com" already exists
      And the user is on the registration page
      When the user enters "existing@example.com" as the email
      And enters a valid password
      And submits the registration form
      Then the registration should fail with an error message indicating that the email is already in use
