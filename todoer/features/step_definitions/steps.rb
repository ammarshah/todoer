Given('the user is not logged in') do
  # No action needed, this step serves as a documentation only
end

When('the user visits the homepage') do
  visit root_path
end

Then('the user should be able to see the homepage content') do
  expect(page).to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Given('the user is logged in') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the user should not be able to see the homepage content') do
  pending # Write code here that turns the phrase above into concrete actions
end
