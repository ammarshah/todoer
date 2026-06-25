module EmailHelper
  def extract_link_from_email(link_text:)
    deliver_enqueued_emails
    last_delivered_email = ActionMailer::Base.deliveries.last
    email_html = last_delivered_email.body.to_s
    email_page = Capybara.string(email_html)
    link = email_page.find_link(link_text)[:href]

    URI.parse(link).request_uri
  end
end
