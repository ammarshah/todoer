require "test_helpers/builders/user_builder"

module SessionHelper
  include UserBuilder

  # Use this method when you want a successful
  # registration in your test without asserting it
  def register(**attrs)
    attempt_register(**attrs)

    assert_text email_confirmation_required_message
  end

  # Use this method when you want to assert a
  # successful or failed registration in your test yourself
  def attempt_register(**attrs)
    user = build_user(**attrs)

    visit register_path
    assert_selector "h1.title", text: "Register"

    fill_in "Full name", with: user.full_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Continue"
  end

  # Use this method when you want a successful
  # login in your test without asserting it
  def login(email:, password: UserBuilder::DEFAULT_PASSWORD)
    attempt_login(email: email, password: password)

    assert_selector "a[title='Logout']" # Wait for the login until the page is fully loaded
  end

  # Use this method when you want to assert a
  # successful or failed login in your test yourself
  def attempt_login(email:, password: UserBuilder::DEFAULT_PASSWORD)
    visit login_path
    assert_selector "h1.title", text: "Login"

    fill_in "Email", with: email
    fill_in "Password", with: password

    click_button "Continue"
  end

  def logout
    find("a[title='Logout']").click
    assert_selector "a[title='Login']"
  end
end
