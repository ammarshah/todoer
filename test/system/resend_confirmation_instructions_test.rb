require "application_system_test_case"

class ResendConfirmationInstructionsTest < ApplicationSystemTestCase
  test "user with unconfirmed email gets an option to resend confirmation instructions when login" do
    unconfirmed_user = create_user(confirmed_at: nil)

    attempt_login(email: unconfirmed_user.email)

    assert_link resend_me_confirmation_instructions_message, href: confirm_path
  end

  test "user with an unconfirmed email resends confirmation instructions" do
    unconfirmed_user = create_user(confirmed_at: nil)

    resend_confirmation_instructions_to(unconfirmed_user.email)

    assert_text email_confirmation_instructions_sent_message
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
