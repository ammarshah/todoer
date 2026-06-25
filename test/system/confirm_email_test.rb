require "application_system_test_case"
require "test_helpers/system_test_helpers/email_helper"

class ConfirmEmailTest < ApplicationSystemTestCase
  include ActionMailer::TestHelper
  include EmailHelper

  setup do
    ActionMailer::Base.deliveries.clear
  end

  test "user confirms an unconfirmed email" do
    register
    confirmation_link = extract_link_from_email(link_text: "Confirm email")

    visit confirmation_link

    assert_no_link "Login", href: login_path
    assert_text email_confirmed_message
  end

  test "user confirms an already confirmed email" do
    register
    confirmation_link = extract_link_from_email(link_text: "Confirm email")
    visit confirmation_link

    logout

    visit confirmation_link

    assert_link "Login", href: login_path
    assert_text email_already_confirmed_message
  end

  test "user uses a confirmation link with an invalid confirmation token" do
    register
    confirmation_link = extract_link_from_email(link_text: "Confirm email")

    visit "#{confirmation_link}_invalid"

    assert_text confirmation_token_invalid_message
  end

  private

  def register(**attrs)
    attempt_register(**attrs)

    assert_text email_confirmation_required_message
  end
end
