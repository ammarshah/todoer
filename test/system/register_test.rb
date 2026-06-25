require "application_system_test_case"

class RegisterTest < ApplicationSystemTestCase
  test "user registers with full name, email and password" do
    attempt_register

    assert_text email_confirmation_required_message
  end

  test "user registers without a full name" do
    attempt_register(full_name: nil)

    assert_text full_name_cant_be_blank_message
  end

  test "user registers without an email" do
    attempt_register(email: nil)

    assert_text email_cant_be_blank_message
  end

  test "user registers without a password" do
    attempt_register(password: nil)

    assert_text password_cant_be_blank_message
  end

  test "user registers with an 80-character full name" do
    attempt_register(full_name: "a" * 80)

    assert_text email_confirmation_required_message
  end

  test "user registers with an 81-character full name" do
    attempt_register(full_name: "a" * 81)

    assert_text full_name_is_too_long_message
  end

  test "user registers with a valid email" do
    attempt_register(email: "valid@email.com")

    assert_text email_confirmation_required_message
  end

  test "user registers with an invalid email" do
    attempt_register(email: "invalid_email.com")

    assert_text email_is_invalid_message
  end

  test "user registers with a 7-character password" do
    attempt_register(password: "a" * 7)

    assert_text password_is_too_short_message
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

    assert_text password_is_too_long_message
  end

  test "user registers using an existing email" do
    attempt_register(email: users(:default).email)

    assert_text email_already_taken_message
  end
end
