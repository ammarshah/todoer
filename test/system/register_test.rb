require "application_system_test_case"

class RegisterTest < ApplicationSystemTestCase
  test "user registers with full name, email and password" do
    attempt_register

    assert_text email_confirmation_required_message
  end

  test "user registers without a full name" do
    attempt_register(full_name: nil)

    assert_text "Full name can't be blank"
  end

  test "user registers without an email" do
    attempt_register(email: nil)

    assert_text "Email can't be blank"
  end

  test "user registers without a password" do
    attempt_register(password: nil)

    assert_text "Password can't be blank"
  end

  test "user registers with an 80-character full name" do
    attempt_register(full_name: "a" * 80)

    assert_text email_confirmation_required_message
  end

  test "user registers with an 81-character full name" do
    attempt_register(full_name: "a" * 81)

    assert_text "Full name is too long (maximum is 80 characters)"
  end

  test "user registers with a valid email" do
    attempt_register(email: "valid@email.com")

    assert_text email_confirmation_required_message
  end

  test "user registers with an invalid email" do
    attempt_register(email: "invalid_email.com")

    assert_text "Email is invalid"
  end

  test "user registers with a 7-character password" do
    attempt_register(password: "a" * 7)

    assert_text "Password is too short (minimum is 8 characters)"
  end

  test "user registers with an 8-character password" do
    attempt_register(password: "a" * 8)

    assert_text email_confirmation_required_message
  end

  test "user registers with a 70-character password" do
    attempt_register(password: "a" * 70)

    assert_text email_confirmation_required_message
  end

  test "user registers with a 129-character password" do
    attempt_register(password: "a" * 129)

    assert_text "Password is too long (maximum is 70 characters)"
  end

  test "user registers using an existing email" do
    attempt_register(email: users(:default).email)

    assert_text "Email has already been taken"
  end
end
