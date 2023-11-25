# SHARED BLOCKS
visit_page = lambda do |path|
  visit path
end

# GIVEN
Given('I am on {page}', visit_page)

# WHEN
When('I/he go(es) to {page}', visit_page)

When('I follow the confirmation link in the email') do
  visit confirmation_link
end

When('I follow(ed) the reset password link in the email( again)') do
  visit reset_password_link
end
