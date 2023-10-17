# GIVEN
Given('I am not logged in') do
  logout
end

Given('I am logged in') do
  user = create(:user, :confirmed)

  login(user)
end

Given('I am on the {page} page') do |path|
  visit path
end

# WHEN
When('I go to the {page} page') do |path|
  visit path
end

When('I register with both email and password') do
  register_with(email: 'user@example.com', password: '12345678')
end

# THEN
Then('I should be able to see the home page content') do
  expect(page).to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Then('I should not be able to see the home page content') do
  expect(page).not_to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Then('I should see a success message indicating that the account is successfully created') do
  expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
end
