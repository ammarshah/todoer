# WHEN
When('I give feedback with name, email, subject and message') do
  feedback = build(:approachment)

  give_feedback(feedback)
end

When('I give feedback without a name') do
  feedback = build(:approachment, name: nil)

  give_feedback(feedback)
end

When('I give feedback without an email') do
  feedback = build(:approachment, email: nil)

  give_feedback(feedback)
end

When('I give feedback without a subject') do
  feedback = build(:approachment, subject: nil)

  give_feedback(feedback)
end

When('I give feedback without a message') do
  feedback = build(:approachment, message: nil)

  give_feedback(feedback)
end
