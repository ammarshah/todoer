Feature: Visit homepage
  As an anonymous user
  I want to see the homepage
  So that I gain an understanding of the services that the product offers

  Rule: Only anonymous user can see the homepage

    Example: Anonymous user visits the homepage
      Given the user is not logged in
      When the user visits the homepage
      Then the user should be able to see the homepage content

    Example: Logged in user visits the homepage
      Given the user is logged in
      When the user visits the homepage
      Then the user should not be able to see the homepage content
