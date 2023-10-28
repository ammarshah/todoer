module EmailHelper
  def confirmation_link
    @confirmation_link ||= extract_link_from_email_with(text: 'Confirm my account')
  end

  private

  def extract_link_from_email_with(text:)
    email_html = last_delivered_email.body.raw_source
    email_page = Capybara.string(email_html)
    link = email_page.find_link(text)[:href]
    link_without_host(link)
  end

  # Example:
  #
  # link = "http://localhost:3000/confirmation?confirmation_token=abcdef"
  #
  # link_without_host(link) => "/confirmation?confirmation_token=abcdef"
  def link_without_host(link)
    uri = URI.parse(link)
    uri.request_uri
  end
end

World(EmailHelper)
