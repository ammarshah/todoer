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

Given('I exist with the email {string}') do |email|
  user = build(:user, email: email)

  register(user)
end

# WHEN
When('I go to the {page} page') do |path|
  visit path
end

When('I register with both email and password') do
  user = build(:user)

  register(user)
end

When('I register without a password') do
  user = build(:user, password: nil)

  register(user)
end

When('I register without an email') do
  user = build(:user, email: nil)

  register(user)
end

When('I register with the email {string}') do |email|
  user = build(:user, email: email)

  register(user)
end

When('I register with a valid email like {string}') do |valid_email|
  user = build(:user, email: valid_email)

  register(user)
end

When('I register with an invalid email like {string}') do |invalid_email|
  user = build(:user, email: invalid_email)

  register(user)
end

When('I register with a 7-character password') do
  user = build(:user, password: '1234567')

  register(user)
end

When('I register with an 8-character password') do
  user = build(:user, password: '12345678')

  register(user)
end

When('I register with a 128-character password') do
  user = build(:user, password: 'a' * 128)

  register(user)
end

When('I register with a 129-character password') do
  user = build(:user, password: 'a' * 129)

  register(user)
end

# THEN
Then('I should be able to see the home page content') do
  expect(page).to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Then('I should not be able to see the home page content') do
  expect(page).not_to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Then('I should see a success message indicating that {text}') do |message|
  expect(page).to have_content(message)
end

Then('I should see an error message indicating that {text}') do |message|
  expect(page).to have_content(message)
end
