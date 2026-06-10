require "application_system_test_case"
require "test_helpers/builders/approachment_builder"

class ApproachUsTest < ApplicationSystemTestCase
  include ApproachmentBuilder

  test "user gives feedback with name, email, subject and message" do
    feedback = build_approachment

    give_feedback(feedback)

    assert_text approachment_received_message
  end

  test "user gives feedback without a name" do
    feedback = build_approachment(name: nil)

    give_feedback(feedback)

    assert_text name_cant_be_blank_message
  end

  test "user gives feedback without an email" do
    feedback = build_approachment(email: nil)

    give_feedback(feedback)

    assert_text email_cant_be_blank_message
  end

  test "user gives feedback without a subject" do
    feedback = build_approachment(subject: nil)

    give_feedback(feedback)

    assert_text subject_cant_be_blank_message
  end

  test "user gives feedback without a message" do
    feedback = build_approachment(message: nil)

    give_feedback(feedback)

    assert_text message_cant_be_blank_message
  end

  private

  def give_feedback(approachment)
    visit approach_us_path
    assert_selector "h1.title", text: "Approach Us"

    fill_in "approachment[name]", with: approachment.name
    fill_in "approachment[email]", with: approachment.email
    fill_in "approachment[subject]", with: approachment.subject
    fill_in "approachment[message]", with: approachment.message

    click_button "Send"
  end
end
