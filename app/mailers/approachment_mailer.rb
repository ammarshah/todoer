class ApproachmentMailer < ApplicationMailer
  SUPPORT_EMAIL = "support.glitch555@simplelogin.com"

  def notify_us(approachment)
    @approachment = approachment
    mail(to: SUPPORT_EMAIL, subject: "New approachment on Todoer")
  end
end
