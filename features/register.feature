Feature: Register
  As an anonymous user
  I want to register my account
  So that I can use the services

  Rule: Full name, email and password are required

    @javascript
    Example: User registers with full name, email and password
      Given I am on the register page
      When I register with full name, email and password
      Then I should see a success message indicating that I have to confirm my email to activate the account

    Example: User registers without a full name
      Given I am on the register page
      When I register without a full name
      Then I should see an error message indicating that a full name is required

    Example: User registers without an email
      Given I am on the register page
      When I register without an email
      Then I should see an error message indicating that an email is required

    Example: User registers without a password
      Given I am on the register page
      When I register without a password
      Then I should see an error message indicating that a password is required

  Rule: Full name length must be maximum 80 characters

    # @javascript
    Example: User registers with an 80-character full name
      Given I am on the register page
      When I register with an 80-character full name
      Then I should see a success message indicating that I have to confirm my email to activate the account

    Example: User registers with an 81-character full name
      Given I am on the register page
      When I register with an 81-character full name
      Then I should see an error message indicating that the full name must be maximum 81 characters long

  Rule: Email must have a valid format

    @javascript
    Example: User registers with a valid email
      Given I am on the register page
      When I register with a valid email "valid@email.com"
      Then I should see a success message indicating that I have to confirm my email to activate the account

    Example: User registers with an invalid email
      Given I am on the register page
      When I register with an invalid email "invalid_email.com"
      Then I should see an error message indicating that the email format is invalid

  Rule: Password length must be within 8 to 128 characters

    Example: User registers with a 7-character password
      Given I am on the register page
      When I register with a 7-character password
      Then I should see an error message indicating that the password must be minimun 8 characters long

    @javascript
    Example: User registers with an 8-character password
      Given I am on the register page
      When I register with an 8-character password
      Then I should see a success message indicating that I have to confirm my email to activate the account

    @javascript
    Example: User registers with a 128-character password
      Given I am on the register page
      When I register with a 128-character password
      Then I should see a success message indicating that I have to confirm my email to activate the account

    Example: User registers with a 129-character password
      Given I am on the register page
      When I register with a 129-character password
      Then I should see an error message indicating that the password must be maximum 128 characters long

  Rule: Email must be unique

    Example: User registers using an existing email
      Given a user exists with the email "existing@email.com"
      When I register with the same email "existing@email.com"
      Then I should see an error message indicating that the email already exists
