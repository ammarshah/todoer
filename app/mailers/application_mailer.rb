class ApplicationMailer < ActionMailer::Base
  self.deliver_later_queue_name = 'mailers'

  default from:     ENV["DEFAULT_FROM_EMAIL"],
          reply_to: ENV["DEFAULT_REPLY_TO_EMAIL"]

  layout "mailer"
end
