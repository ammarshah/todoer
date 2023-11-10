# THEN
Then('I should be able to see the home page content') do
  expect(page).to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Then('I should not be able to see the home page content') do
  expect(page).not_to have_css("h1.tagline", text: Tagline::DEFAULT_TAGLINE)
end

Then('I should see a/an success/error {message}') do |message|
  expect(page).to have_content(message)
end

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
