# GIVEN
Given('I received the confirmation email') do
  deliver_enqueued_emails
end

Given('I altered the confirmation token') do
  @confirmation_link = confirmation_link + "_altered"
end
