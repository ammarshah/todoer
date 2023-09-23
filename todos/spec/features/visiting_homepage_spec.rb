require "rails_helper"
require "./spec/support/helpers/features/anonymous_user_helper"

RSpec.configure do |c|
  c.include Helpers::Features::AnonymousUserHelper
end

feature "Visiting homepage" do
  scenario "Anonymous user visits the homepage" do
    anonymous_user_visits_homepage

    expect(page).to have_selector("a#login")
    expect(page).to have_css("h1.tagline", text: "Whaddya want TODO?")
  end

  xscenario "Logged in user visits the homepage" do
    sign_in
    visit root_path

    expect(page).to have_current_path(app_path)
    expect(page).to have_selector("a#logout")
    expect(page).to have_css("#todos")
  end
end
