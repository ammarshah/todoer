require "application_system_test_case"

class VisitHomePageTest < ApplicationSystemTestCase
  test "anonymous user visits the home page" do
    visit root_path

    assert_selector "h1.tagline", text: Tagline::DEFAULT_TAGLINE
  end

  test "logged in user visits the home page" do
    login(email: users(:default).email)

    visit root_path

    assert_no_selector "h1.tagline", text: Tagline::DEFAULT_TAGLINE
  end
end
