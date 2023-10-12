# GIVEN
Given('I am not logged in') do
  logout
  expect(page).to have_content('Signed out successfully.')
end

Given('I am logged in') do
  pending # Write code here that turns the phrase above into concrete actions
end

# WHEN
When('I go to the {page} page') do |path|
  visit path
end

# THEN
Then('I should be able to see the home page content') do
  expect(page).to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Then('I should not be able to see the home page content') do
  pending # Write code here that turns the phrase above into concrete actions
end
