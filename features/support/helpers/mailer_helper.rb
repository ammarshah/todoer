module MailerHelper
  def deliver_enqueued_emails
    perform_enqueued_jobs(queue: ApplicationMailer.deliver_later_queue_name)
  end

  def last_delivered_email
    ActionMailer::Base.deliveries.last
  end
end

World(MailerHelper)
