require "application_system_test_case"
require "test_helpers/system_test_helpers/email_helper"

class ResetPasswordTest < ApplicationSystemTestCase
  include ActionMailer::TestHelper
  include EmailHelper

  setup do
    ActionMailer::Base.deliveries.clear
  end

  test "user requests reset password for a registered email" do
    attempt_to_request_reset_password_for(users(:default).email)

    assert_text I18n.t("devise.passwords.send_instructions")
  end

  test "user requests reset password for an unregistered email" do
    attempt_to_request_reset_password_for("unregistered_email@example.com")

    assert_text "Email not found"
  end

  test "user uses an unused reset password link" do
    request_reset_password_for(users(:default).email)
    reset_password_link = extract_link_from_email(link_text: "Reset password")

    visit reset_password_link

    reset_password_to("newPassword")

    assert_text I18n.t("devise.passwords.updated")
  end

  test "user uses a reset password link with an invalid reset password token" do
    request_reset_password_for(users(:default).email)
    reset_password_link = extract_link_from_email(link_text: "Reset password")

    visit "#{reset_password_link}_invalid"

    reset_password_to("newPassword")

    assert_text "Reset password token is invalid"
  end

  test "user uses an already used reset password link" do
    request_reset_password_for(users(:default).email)
    reset_password_link = extract_link_from_email(link_text: "Reset password")

    visit reset_password_link
    reset_password_to("newPassword")
    assert_text I18n.t("devise.passwords.updated")

    logout

    visit reset_password_link
    reset_password_to("newPassword")
    assert_text "Reset password token is invalid"
  end

  test "user sets an already used password" do
    request_reset_password_for(users(:default).email)
    reset_password_link = extract_link_from_email(link_text: "Reset password")

    visit reset_password_link

    reset_password_to(UserBuilder::DEFAULT_PASSWORD)

    assert_text I18n.t("errors.messages.taken_in_past")
  end

  private

  # Use this method when you want a successful reset
  # password request in your test without asserting it
  def request_reset_password_for(email)
    attempt_to_request_reset_password_for(email)

    assert_text I18n.t("devise.passwords.send_instructions")
  end

  # Use this method when you want to assert a successful
  # or failed reset password request in your test yourself
  def attempt_to_request_reset_password_for(email)
    visit forgot_path
    assert_selector "h1.title", text: "Forgot Password?"

    fill_in "Email", with: email
    click_button "Continue"
  end

  def reset_password_to(new_password)
    fill_in "New password", with: new_password
    fill_in "Retype new password", with: new_password
    click_button "Continue"
  end
end
