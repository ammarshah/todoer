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
