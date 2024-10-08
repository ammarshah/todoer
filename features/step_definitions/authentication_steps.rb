# SHARED BLOCKS
register = lambda do
  @user = build(:user)

  register(@user)
end

register_with_email = lambda do |email|
  @user = build(:user, email: email)

  register(@user)
end

# GIVEN
Given('I am not logged in') do
  logout
end

Given('I am logged in') do
  @user ||= create(:user, :confirmed)

  login(@user)
end

Given('a user exists with the email {string}', register_with_email)

Given('I registered my account', register)

Given('I have an account with the full name {string}') do |full_name|
  @user = create(:user, :confirmed, full_name: full_name)
end

Given('I have an account with the email {string}', register_with_email)

Given('I have an account with the password {string}') do |password|
  @user = create(:user, :confirmed, password: password)
end

Given('I have an account with the email {string} and the password {string}') do |email, password|
  @user = create(:user, :confirmed, email: email, password: password)
end

Given('I have an account with a confirmed email') do
  @user = create(:user, :confirmed)
end

Given('I have an account with an unconfirmed email', register)

Given('I requested to reset my password') do
  @user ||= create(:user)

  request_reset_password_for(email: @user.email)

  # We need this expectation here to make sure that the web request from the
  # above `request_reset_password_for` method is finished completely which
  # means we will have an ActiveJob enqueued for the reset password email
  expect(page).to have_content(I18n.t("devise.passwords.send_instructions"))
end

# WHEN
When('I register with full name, email and password', register)

When('I register with the email {string} and the password {string}') do |email, password|
  @user = build(:user, email: email, password: password)

  register(@user)
end

When('I register without a full name') do
  @user = build(:user, full_name: nil)

  register(@user)
end

When('I register without an email') do
  @user = build(:user, email: nil)

  register(@user)
end

When('I register without a password') do
  @user = build(:user, password: nil)

  register(@user)
end

When('I register with an {int}-character full name') do |full_name_length|
  @user = build(:user, full_name: 'a' * full_name_length)

  register(@user)
end

When('I register with a/an/the (same)(valid)(invalid)( )email {string}', register_with_email)

When('I register with a/an {int}-character password') do |password_length|
  @user = build(:user, password: 'a' * password_length)

  register(@user)
end

When('I confirm(ed) my email( again)') do
  deliver_enqueued_emails

  visit confirmation_link
end

When('I log in') do
  login(@user)
end

When('I login with (in)valid email {string} and (in)valid password {string}') do |email, password|
  login_with(email: email, password: password)
end

When('I login with with the email {string} and the password {string}') do |email, password|
  login_with(email: email, password: password)
end

When('another user logs in') do
  logout

  @user = create(:user, :confirmed)

  login(@user)
end

When('I resend confirmation instructions') do
  resend_confirmation_instructions_for(email: @user.email)
end

When('I request to reset the password of a/an (un)registered email {string}') do |email|
  request_reset_password_for(email: email)
end

When('I reset my password') do
  reset_password_to(new_password: "NewPassword")
end

When('I reset my password to {string}') do |password|
  reset_password_to(new_password: password)
end

When('I update the full name to {string}') do |full_name|
  update_account_with(full_name: full_name)
end

When('I update my account with an {int}-character full name') do |full_name_length|
  full_name = 'A' * full_name_length

  update_account_with(full_name: full_name)
end

When('I change my password by providing current password {string}, new password {string} and retype new password {string}') do |current_password, new_password, retype_new_password|
  change_password_with(
    current_password:    current_password,
    new_password:        new_password,
    retype_new_password: retype_new_password
  )
end

When('I change my password to {string}') do |new_password|
  change_password_with(
    current_password:    @user.password,
    new_password:        new_password,
    retype_new_password: new_password
  )
end

When('I delete my account') do
  click_button 'Delete my account'
  accept_alert
end

# THEN
Then('I should be automatically logged in') do
  expect(page).to have_link(href: path_for('logout'))
end

Then('I should not be automatically logged in') do
  expect(page).not_to have_link(href: path_for('logout'))
end

Then('I should see an option to resend confirmation instructions') do
  expect(page).to have_link(text: 'Resend me confirmation instructions', href: path_for('resend confirmation instructions'))
end

Then('I should see my email address in a disabled input field') do
  expect(page).to have_field("user[email]", with: @user.email, disabled: true)
end

Then('I should be logged out') do
  expect(page).to have_link(href: path_for('login'))
end
