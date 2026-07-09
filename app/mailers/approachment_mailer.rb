class ApproachmentMailer < ApplicationMailer
  SUPPORT_EMAIL = "support@todoer.simplelogin.com"

  def notify_us(approachment)
    @approachment = approachment
    mail(to: SUPPORT_EMAIL, subject: "New approachment on Todoer")
  end
end
