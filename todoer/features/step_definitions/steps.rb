Given('I am not logged in') do
  # logout_user
end

When('I go to the {page} page') do |path|
  visit path
end

Then('I should be able to see the home page content') do
  expect(page).to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Given('I am logged in') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should not be able to see the home page content') do
  pending # Write code here that turns the phrase above into concrete actions
end
