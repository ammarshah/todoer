require "test_helpers/builders/user_builder"

module SessionHelper
  include UserBuilder

  # Use this method when you want a successful
  # login in your test without asserting it
  def login(email:, password: UserBuilder::DEFAULT_PASSWORD)
    attempt_login(email: email, password: password)

    assert_link "Logout", href: logout_path
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
    click_link(href: logout_path)

    assert_link "Login", href: login_path
  end
end
