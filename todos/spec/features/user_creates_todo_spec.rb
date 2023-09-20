require "rails_helper"

feature "User creates todo" do
  scenario "successfully" do
    visit root_path

    fill_in "todo[title]", with: "Buy bread"
    click_button "Add"

    expect(page).to have_css(".todos li", text: "Buy bread")
  end
end