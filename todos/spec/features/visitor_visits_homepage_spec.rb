require "rails_helper"

feature "Visitor visits homepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_css("header", text: "Sign in")
    expect(page).to have_css("h1", text: "Whaddya want TODO?")
  end
end
