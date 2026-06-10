require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  test "user logs in with both valid email and password" do
    attempt_login(email: users(:default).email, password: UserBuilder::DEFAULT_PASSWORD)

    assert_text I18n.t("devise.sessions.signed_in")
  end

  test "user logs in with both invalid email and password" do
    attempt_login(email: "invalid@example.com", password: "invalidpassword")

    assert_text "Invalid email or password"
  end

  test "user logs in with valid email and invalid password" do
    attempt_login(email: users(:default).email, password: "invalidpassword")

    assert_text "Invalid email or password"
  end

  test "user logs in with invalid email and valid password" do
    attempt_login(email: "invalid@example.com", password: UserBuilder::DEFAULT_PASSWORD)

    assert_text "Invalid email or password"
  end

  test "user logs in with an unconfirmed email" do
    user = create_unconfirmed_user

    attempt_login(email: user.email)

    assert_text "You have to confirm your email address before continuing."
    assert_link "Resend me confirmation instructions", href: confirm_path
  end
end
