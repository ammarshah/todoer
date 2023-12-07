class ApproachmentMailer < ApplicationMailer
  def notify_us(approachment)
    @approachment = approachment
    mail(to: ENV["TODOER_SUPPORT_EMAIL"], subject: "New approachment on Todoer")
  end
end
