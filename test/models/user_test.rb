require "test_helper"
require "test_helpers/builders/user_builder"
require "test_helpers/builders/todo_builder"

class UserTest < ActiveSupport::TestCase
  include UserBuilder
  include TodoBuilder

  #
  # VALID RECORD
  #
  test "is valid with valid attributes" do
    assert_predicate build_user, :valid?
  end

  #
  # FULL NAME
  #
  test "requires full name" do
    user = build_user(full_name: nil)

    assert_not user.valid?
    assert user.errors.added?(:full_name, :blank)
  end

  test "enforces max full name length 80" do
    valid = build_user(full_name: "A" * 80)
    invalid = build_user(full_name: "A" * 81)

    assert valid.valid?
    assert_not invalid.valid?
    assert_equal :too_long, invalid.errors.details[:full_name].first[:error]
  end

  #
  # EMAIL
  #
  test "requires email" do
    user = build_user(email: nil)

    assert_not user.valid?
    assert user.errors.added?(:email, :blank)
  end

  test "requires unique email" do
    duplicate = build_user(email: users(:default).email)

    assert_not duplicate.valid?
    assert_equal :taken, duplicate.errors.details[:email].first[:error]
  end

  test "requires unique email regardless of case" do
    duplicate = build_user(email: users(:default).email.upcase)

    assert_not duplicate.valid?
    assert_equal :taken, duplicate.errors.details[:email].first[:error]
  end

  test "enforces max email length 150" do
    valid = build_user(email: "#{'a' * 144}@x.com")
    invalid = build_user(email: "#{'a' * 145}@x.com")

    assert valid.valid?
    assert_not invalid.valid?
    assert_equal :too_long, invalid.errors.details[:email].first[:error]
  end

  test "accepts valid email formats" do
    valid_emails = [
      "valid@email.com",
      "valid_email@domain.com",
      "valid-email@domain.com",
      "valid+email@domain.com",
      "valid.email@domain.com",
      "valid_email123@domain.com",
      "123valid_email@domain.com",
      "_valid_email@domain.com",
      "valid_email@domain.com.pk"
    ]

    valid_emails.each do |email|
      user = build_user(email: email)
      assert user.valid?, "#{email} should be valid"
    end
  end

  test "rejects invalid email formats" do
    invalid_emails = [
      "invalid_email",
      "invalid_email@",
      "invalid_email@domain",
      "invalid_email@domain.",
      "invalid_email.",
      "invalid_email.com",
      "invalid_email@.",
      "invalid_email@.com",
      "@domain",
      "@domain.",
      "@domain.com",
      "@.com",
      ".com",
      "invalid_email@domain@anotherdomain.com"
    ]

    invalid_emails.each do |email|
      user = build_user(email: email)

      assert_not user.valid?, "#{email} should be invalid"
      assert_equal :invalid, user.errors.details[:email].first[:error]
    end
  end

  test "does not allow changing email after persistence" do
    user = users(:default)

    user.email = "new_email@example.com"

    assert_not user.valid?
    assert_equal "can't be changed", user.errors.details[:email].first[:error]
  end

  #
  # PASSWORD
  #
  test "requires password" do
    user = build_user(password: nil)

    assert_not user.valid?
    assert user.errors.added?(:password, :blank)
  end

  test "requires matching password confirmation" do
    user = build_user(
      password: "password",
      password_confirmation: "PASSWORD"
    )

    assert_not user.valid?
    assert_equal :confirmation, user.errors.details[:password_confirmation].first[:error]
  end

  test "accepts 8 character password" do
    user = build_user(password: "12345678", password_confirmation: "12345678")

    assert_predicate user, :valid?
  end

  test "rejects password shorter than 8 characters" do
    user = build_user(password: "1234567")

    assert_not user.valid?
    assert_equal :too_short, user.errors.details[:password].first[:error]
  end

  test "accepts 70 character password" do
    password = "a" * 70
    user = build_user(password: password, password_confirmation: password)

    assert_predicate user, :valid?
  end

  test "rejects password longer than 70 characters" do
    password = "a" * 71
    user = build_user(password: password, password_confirmation: password)

    assert_not user.valid?
    assert_equal :too_long, user.errors.details[:password].first[:error]
  end

  test "allows setting a password not previously used" do
    user = create_user(password: "password", password_confirmation: "password")

    user.update!(password: "strong123", password_confirmation: "strong123")

    user.password = "verystrong123"
    user.password_confirmation = "verystrong123"

    assert_predicate user, :valid?
  end

  test "rejects previously used passwords" do
    user = create_user(password: "password", password_confirmation: "password")

    user.update!(password: "strong123", password_confirmation: "strong123")

    user.password = "password"
    user.password_confirmation = "password"

    assert_not user.valid?
    assert_equal :taken_in_past, user.errors.details[:password].first[:error]
  end

  #
  # ASSOCIATIONS
  #
  test "destroys associated todos when destroyed" do
    user = create_user

    3.times do
      create_todo(user: user)
    end

    assert_difference("Todo.count", -3) do
      user.destroy
    end
  end
end
