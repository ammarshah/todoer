# SHARED BLOCKS
register = lambda do
  user = build(:user)

  register(user)
end

register_with_email = lambda do |email|
  user = build(:user, email: email)

  register(user)
end

# GIVEN
Given('I am not logged in') do
  logout
end

Given('I am logged in') do
  user = create(:user, :confirmed)

  login(user)
end

Given('a user exists with the email {string}', register_with_email)

Given('I registered my account', register)

# WHEN
When('I register with full name, email and password', register)

When('I register without a full name') do
  user = build(:user, full_name: nil)

  register(user)
end

When('I register without an email') do
  user = build(:user, email: nil)

  register(user)
end

When('I register without a password') do
  user = build(:user, password: nil)

  register(user)
end

When('I register with an {int}-character full name') do |full_name_length|
  user = build(:user, full_name: 'a' * full_name_length)

  register(user)
end

When('I register with a/an/the (same)(valid)(invalid)( )email {string}', register_with_email)

When('I register with a/an {int}-character password') do |password_length|
  user = build(:user, password: 'a' * password_length)

  register(user)
end

When('I confirm(ed) my email( again)') do
  confirm_email
end
