require "application_system_test_case"

class ChangePasswordTest < ApplicationSystemTestCase
  setup do
    @current_password = UserBuilder::DEFAULT_PASSWORD
    @new_password = "NewPassword"
  end

  test "user changes password with valid current password" do
    change_password(current_password: @current_password, new_password: @new_password, retype_new_password: @new_password)

    assert_text account_updated_message
  end

  test "user cannot change password without providing current password" do
    change_password(current_password: "", new_password: @new_password, retype_new_password: @new_password)

    assert_text current_password_cant_be_blank_message
  end

  test "user cannot change password if new passwords do not match" do
    change_password(current_password: @current_password, new_password: @new_password, retype_new_password: @new_password.upcase)

    assert_text passwords_dont_match_message
  end

  test "user can set a new unused password" do
    change_password(current_password: @current_password, new_password: @new_password, retype_new_password: @new_password)

    assert_text account_updated_message
  end

  test "user cannot reuse an old password" do
    change_password(current_password: @current_password, new_password: @current_password, retype_new_password: @current_password)

    assert_text password_used_previously_message
  end

  private

  def change_password(current_password:, new_password:, retype_new_password:)
    login(email: users(:default).email)

    visit account_path
    assert_selector "h1.title", text: "Update Account"

    within("#change_password") do
      fill_in "Current password", with: current_password
      fill_in "New password", with: new_password
      fill_in "Retype new password", with: retype_new_password
      click_button "Save"
    end
  end
end
