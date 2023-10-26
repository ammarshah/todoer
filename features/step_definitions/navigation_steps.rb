# SHARED BLOCKS
visit_page = lambda do |path|
  visit path
end

# GIVEN
Given('I am on {page}', visit_page)

# WHEN
When('I go to {page}', visit_page)

When('I follow the confirmation link in the email') do
  visit confirmation_link
end
