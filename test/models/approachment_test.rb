require "test_helper"
require "test_helpers/builders/approachment_builder"

class ApproachmentTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper
  include ActiveJob::TestHelper
  include ApproachmentBuilder

  #
  # VALID RECORD
  #
  test "is valid with valid attributes" do
    assert_predicate build_approachment, :valid?
  end

  #
  # NAME
  #
  test "requires name" do
    approachment = build_approachment(name: "")

    assert_not approachment.valid?
    assert approachment.errors.added?(:name, :blank)
  end

  test "enforces max name length 80" do
    valid = build_approachment(name: "A" * 80)
    invalid = build_approachment(name: "A" * 81)

    assert valid.valid?
    assert_not invalid.valid?
    assert_equal :too_long, invalid.errors.details[:name].first[:error]
  end

  test "squishes name on validation" do
    approachment = build_approachment(name: "   John    Doe   ")

    assert approachment.valid?
    assert_equal "John Doe", approachment.name
  end

  #
  # EMAIL
  #
  test "requires email" do
    approachment = build_approachment(email: "")

    assert_not approachment.valid?
    assert approachment.errors.added?(:email, :blank)
  end

  test "enforces max email length 150" do
    valid = build_approachment(email: "a" * 144 + "@x.com")
    invalid = build_approachment(email: "a" * 145 + "@x.com")

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
      approachment = build_approachment(email: email)
      assert approachment.valid?, "#{email} should be valid"
    end
  end

  test "rejects invalid email formats" do
    invalid_emails = [
      "invalid_email",
      "invalid_email@",
      "invalid_email@domain",
      "invalid_email@domain.",
      "invalid_email.com",
      "@domain.com",
      "invalid_email@domain@another.com"
    ]

    invalid_emails.each do |email|
      approachment = build_approachment(email: email)

      assert_not approachment.valid?, "#{email} should be invalid"
      assert_equal :invalid, approachment.errors.details[:email].first[:error]
    end
  end

  test "squishes email on validation" do
    approachment = build_approachment(email: "   user@example.com   ")

    assert approachment.valid?
    assert_equal "user@example.com", approachment.email
  end

  #
  # SUBJECT
  #
  test "requires subject" do
    approachment = build_approachment(subject: "")

    assert_not approachment.valid?
    assert approachment.errors.added?(:subject, :blank)
  end

  test "enforces max subject length 150" do
    valid = build_approachment(subject: "A" * 150)
    invalid = build_approachment(subject: "A" * 151)

    assert valid.valid?
    assert_not invalid.valid?
    assert_equal :too_long, invalid.errors.details[:subject].first[:error]
  end

  test "squishes subject on validation" do
    approachment = build_approachment(subject: "   This   is   a   subject   ")

    assert approachment.valid?
    assert_equal "This is a subject", approachment.subject
  end

  #
  # MESSAGE
  #
  test "requires message" do
    approachment = build_approachment(message: "")

    assert_not approachment.valid?
    assert approachment.errors.added?(:message, :blank)
  end

  test "enforces max message length 3000" do
    valid = build_approachment(message: "A" * 3000)
    invalid = build_approachment(message: "A" * 3001)

    assert valid.valid?
    assert_not invalid.valid?
    assert_equal :too_long, invalid.errors.details[:message].first[:error]
  end

  #
  # EMAIL DELIVERY
  #
  test "sends an email after create" do
    approachment = build_approachment

    assert_emails 1 do
      perform_enqueued_jobs do
        approachment.save!
      end
    end
  end
end
