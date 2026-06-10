require "application_system_test_case"

class ResendConfirmationInstructionsTest < ApplicationSystemTestCase
  test "user with unconfirmed email gets an option to resend confirmation instructions when login" do
    user = create_unconfirmed_user

    attempt_login(email: user.email)

    assert_link "Resend me confirmation instructions", href: confirm_path
  end

  test "user with an unconfirmed email resends confirmation instructions" do
    user = create_unconfirmed_user

    resend_confirmation_instructions_to(user.email)

    assert_text I18n.t("devise.confirmations.send_instructions")
  end

  test "user with a confirmed email resends confirmation instructions" do
    resend_confirmation_instructions_to(users(:default).email)

    assert_text email_already_confirmed_message
  end

  private

  def resend_confirmation_instructions_to(email)
    visit confirm_path
    assert_selector "h1.title", text: "Resend Confirmation Instructions"

    fill_in "Email", with: email

    click_button "Continue"
  end
end
