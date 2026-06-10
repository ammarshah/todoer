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

    assert_selector "a[title='Logout']"
    assert_text I18n.t("devise.confirmations.confirmed")
  end

  test "user confirms an already confirmed email" do
    register
    confirmation_link = extract_link_from_email(link_text: "Confirm email")
    visit confirmation_link

    logout

    visit confirmation_link

    assert_no_selector "a[title='Logout']"
    assert_text email_already_confirmed_message
  end

  test "user uses a confirmation link with an invalid confirmation token" do
    register
    confirmation_link = extract_link_from_email(link_text: "Confirm email")

    visit "#{confirmation_link}_invalid"

    assert_text "Confirmation token is invalid"
  end
end
