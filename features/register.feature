Feature: Register
  As an anonymous user
  I want to register my account
  So that I can use the services

  Rule: Email and password are required

    Example: User registers with both email and password
      Given I am on the register page
      When I register with both email and password
      Then I should see a success message indicating that the account is successfully created

    Example: User registers without password
      Given I am on the register page
      When I register without a password
      Then I should see an error message indicating that a password is required

    Example: User registers without email
      Given I am on the register page
      When I register without an email
      Then I should see an error message indicating that an email is required

  Rule: Email must have a valid format

    Example: User registers with a valid email
      Given I am on the register page
      When I register with a valid email like "valid@email.com"
      Then I should see a success message indicating that the account is successfully created

    Example: User registers with an invalid email
      Given I am on the register page
      When I register with an invalid email like "invalid_email.com"
      Then I should see an error message indicating that the email format is invalid

  Rule: Password length must be within 8 to 128 characters

    Example: User registers with a 7-character password
      Given I am on the register page
      When I register with a 7-character password
      Then I should see an error message indicating that the password must be 8 to 128 characters long

    Example: User registers with a 8-character password
      Given I am on the register page
      When I register with a 8-character password
      Then I should see a success message indicating that the account is successfully created

    Example: User registers with a 128-character password
      Given I am on the register page
      When I register with a 128-character password
      Then I should see a success message indicating that the account is successfully created

    Example: User registers with a 129-character password
      Given I am on the register page
      When I register with a 129-character password
      Then I should see an error message indicating that the password must be 8 to 128 characters long


  Rule: Email must be unique

    Example: User registers using an existing email
      Given a user exists with the email "existing@email.com"
      When I register with the email "existing@email.com"
      Then I should see an error message indicating that the email already exists
