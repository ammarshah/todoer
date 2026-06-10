require "test_helpers/system_test_helpers/session_helper"
require "test_helpers/system_test_helpers/message_helper"

module CommonHelper
  include SessionHelper
  include MessageHelper

  def attempt_register(**attrs)
    user = build_user(**attrs)

    visit register_path
    assert_selector "h1.title", text: "Register"

    fill_in "Full name", with: user.full_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Continue"
  end
end
