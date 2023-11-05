Feature: Update account
  As a logged in user
  I want to update my account information
  So I can have the latest account information

  Rule: Email address cannot be updated

    Example: Logged in user visits the account page
      Given I am logged in
      When I go to the account page
      Then I should see my email address
      But I cannot update my email address

  Rule: Full name cannot be removed

    Example: User updates the full name
      Given I exist with the full name "John Doe"
      And I am logged in
      And I am on the account page
      When I update the full name to "James Joe"
      Then I should see a success message indicating that my account is updated successfully

    Example: User removes the full name
      Given I exist with the full name "John Doe"
      And I am logged in
      And I am on the account page
      When I update the full name to ""
      Then I should see an error message indicating that a full name is required

  Rule: Full name length must be of maximum 80 characters

    Example: User updates the account with an 80-character full name
      Given I am on the account page
      When I update the account with an 80-character full name
      Then I should see a success message indicating that my account is updated successfully

    Example: User updates the account with an 81-character full name
      Given I am on the account page
      When I update the account with an 81-character full name
      Then I should see an error message indicating that the full name must be maximum 80 characters long
