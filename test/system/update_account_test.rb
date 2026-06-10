require "application_system_test_case"

class UpdateAccountTest < ApplicationSystemTestCase
  setup do
    @user = users(:default)
    login(email: @user.email)
    visit account_path
    assert_selector "h1.title", text: "Update Account"
  end

  test "email address is shown disabled on the account page" do
    assert_field "user[email]", with: @user.email, disabled: true
  end

  test "user updates the full name successfully" do
    update_full_name("James Joe")

    assert_text account_updated_message
  end

  test "user cannot remove the full name" do
    update_full_name("")

    assert_text full_name_cant_be_blank_message
  end

  test "full name of 80 characters is accepted" do
    update_full_name("A" * 80)

    assert_text account_updated_message
  end

  test "full name of 81 characters is rejected" do
    update_full_name("A" * 81)

    assert_text full_name_is_too_long_message
  end

  private

  def update_full_name(full_name)
    within("#update_account") do
      fill_in "Full name", with: full_name
      click_button "Save"
    end
  end
end
