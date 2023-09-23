require "rails_helper"
require "./spec/support/helpers/features/anonymous_user_helper"

RSpec.configure do |c|
  c.include Helpers::Features::AnonymousUserHelper
end

feature "Adding todo" do
  xscenario "Anonymous user adds a todo", js: true do
    anonymous_user_visits_homepage

    click_on "h1.tagline"
    fill_in "todo[title]", with: "Buy bread"
    click_button "#add"

    expect(page).to have_current_path(signup_path)
    expect(page).to have_content("Sign up")
  end

  xscenario "Logged in user adds a todo" do
    visit app_path

    fill_in "todo[title]", with: "Buy bread"
    click_button "#add"

    expect(page).to have_css("#todos li", text: "Buy bread")
  end
end
