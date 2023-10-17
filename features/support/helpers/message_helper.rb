module MessageHelper
  TEXT_TO_MESSAGE_MAPPINGS = {
    "I have to confirm my email to activate the account" => I18n.t("devise.registrations.signed_up_but_unconfirmed"),
    "a password is required"                             => "Password can't be blank",
    "an email is required"                               => "Email can't be blank"
  }

  def message_for(text)
    begin
      TEXT_TO_MESSAGE_MAPPINGS.fetch(text)
    rescue
      raise "Can't find mapping from \"#{text}\" text to a message.\n" +
        "Add this mapping at #{__FILE__}:in `TEXT_TO_MESSAGE_MAPPINGS`"
    end
  end
end

World(MessageHelper)
