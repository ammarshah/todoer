require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  test "user logs in with both valid email and password" do
    attempt_login(email: users(:default).email, password: UserBuilder::DEFAULT_PASSWORD)

    assert_text logged_in_message
  end

  test "user logs in with both invalid email and password" do
    attempt_login(email: "invalid@example.com", password: "invalidpassword")

    assert_text invalid_email_or_password_message
  end

  test "user logs in with valid email and invalid password" do
    attempt_login(email: users(:default).email, password: "invalidpassword")

    assert_text invalid_email_or_password_message
  end

  test "user logs in with invalid email and valid password" do
    attempt_login(email: "invalid@example.com", password: UserBuilder::DEFAULT_PASSWORD)

    assert_text invalid_email_or_password_message
  end

  test "user logs in with an unconfirmed email" do
    unconfirmed_user = create_user(confirmed_at: nil)

    attempt_login(email: unconfirmed_user.email)

    assert_text confirm_your_email_message
    assert_link resend_me_confirmation_instructions_message, href: confirm_path
  end
end
