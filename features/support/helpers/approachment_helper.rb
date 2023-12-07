module ApproachmentHelper
  def give_feedback(feedback)
    give_feedback_with(name: feedback.name,
      email: feedback.email,
      subject: feedback.subject,
      message: feedback.message
    )
  end

  private

  def give_feedback_with(name:, email:, subject:, message:)
    visit path_for('approach us')
    fill_in "approachment[name]", with: name
    fill_in "approachment[email]", with: email
    fill_in "approachment[subject]", with: subject
    fill_in "approachment[message]", with: message
    click_button "Send"
  end
end

World(ApproachmentHelper)
