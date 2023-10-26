module EmailHelper
  def confirmation_link
    @confirmation_link ||= extract_link_from_email_with(text: 'Confirm my account')
  end

  private

  def extract_link_from_email_with(text:)
    email_html = last_delivered_email.body.raw_source
    email_page = Capybara.string(email_html)
    email_page.find_link(text)[:href]
  end
end

World(EmailHelper)
