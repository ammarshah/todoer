require "application_system_test_case"
require "test_helpers/builders/approachment_builder"

class ApproachUsTest < ApplicationSystemTestCase
  include ApproachmentBuilder

  test "user gives feedback with name, email, subject and message" do
    feedback = build_approachment

    give_feedback(feedback)

    assert_text "Thank you! We've received your message and will respond ASAP!"
  end

  test "user gives feedback without a name" do
    feedback = build_approachment(name: nil)

    give_feedback(feedback)

    assert_text "Name can't be blank"
  end

  test "user gives feedback without an email" do
    feedback = build_approachment(email: nil)

    give_feedback(feedback)

    assert_text "Email can't be blank"
  end

  test "user gives feedback without a subject" do
    feedback = build_approachment(subject: nil)

    give_feedback(feedback)

    assert_text "Subject can't be blank"
  end

  test "user gives feedback without a message" do
    feedback = build_approachment(message: nil)

    give_feedback(feedback)

    assert_text "Message can't be blank"
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
