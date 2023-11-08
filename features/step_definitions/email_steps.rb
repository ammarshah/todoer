# SHARED BLOCKS
receive_email = lambda do
  deliver_enqueued_emails
end

# GIVEN
Given('I received the confirmation email', receive_email)

Given('I received the reset password email', receive_email)

Given('I altered the confirmation token') do
  @confirmation_link = confirmation_link + "_altered"
end

Given('I altered the reset password token') do
  @reset_password_link = reset_password_link + "_altered"
end
