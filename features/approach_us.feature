Feature: Approach us
  As a concerned user
  I want to use the Approach Us form
  So I can give feedback, report an issue or just say hello

  Rule: Name, email, subject and message are required

    @javascript
    Example: User gives feedback with name, email, subject and message
      Given I am on the approach us page
      When I give feedback with name, email, subject and message
      Then I should see a success message indicating that my message has been received

    Example: User gives feedback without a name
      Given I am on the approach us page
      When I give feedback without a name
      Then I should see an error message indicating that a name is required

    Example: User gives feedback without an email
      Given I am on the approach us page
      When I give feedback without an email
      Then I should see an error message indicating that an email is required

    Example: User gives feedback without a subject
      Given I am on the approach us page
      When I give feedback without a subject
      Then I should see an error message indicating that a subject is required

    Example: User gives feedback without a message
      Given I am on the approach us page
      When I give feedback without a message
      Then I should see an error message indicating that a message is required
