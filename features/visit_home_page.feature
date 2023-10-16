Feature: Visit home page
  As an anonymous user
  I want to see the home page
  So that I gain an understanding of the services that the product offers

  Rule: Only anonymous user can see the home page

    Example: Anonymous user visits the home page
      Given I am not logged in
      When I go to the home page
      Then I should be able to see the home page content

    Example: Logged in user visits the home page
      Given I am logged in
      When I go to the home page
      Then I should not be able to see the home page content
