require "application_system_test_case"

class DeleteAccountTest < ApplicationSystemTestCase
  setup do
    @email = users(:default).email
  end

  test "user is logged out immediately after deleting their account" do
    delete_account(@email)

    assert_selector "a[title='Login']"
  end

  test "user cannot login with deleted account credentials" do
    delete_account(@email)

    attempt_login(email: @email)

    assert_text "Invalid email or password"
  end

  test "user can register again with the same email address after deleting their account" do
    delete_account(@email)

    attempt_register(email: @email)

    assert_text email_confirmation_required_message
  end

  private

  def delete_account(email)
    login(email: email)

    visit account_path
    assert_selector "h1.title", text: "Update Account"

    accept_confirm "This action cannot be undone. Are you sure?" do
      click_button "Delete my account"
    end

    assert_text "Your account has been successfully deleted. Please don't call yourself a Todoer anymore until you Register again!"
  end
end
