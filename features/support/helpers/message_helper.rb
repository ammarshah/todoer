module MessageHelper
  TEXT_TO_MESSAGE_MAPPINGS = {
    "I have to confirm my email to activate the account" => I18n.t("devise.registrations.signed_up_but_unconfirmed"),
    "an email is required"                               => "Email can't be blank",
    "the email format is invalid"                        => "Email is invalid",
    "the email already exists"                           => "Email has already been taken",
    "a password is required"                             => "Password can't be blank",
    "the password must be minimun 8 characters long"     => "Password is too short (minimum is 8 characters)",
    "the password must be maximum 128 characters long"   => "Password is too long (maximum is 128 characters)",
    "the email has been confirmed"                       => I18n.t("devise.confirmations.confirmed"),
    "the confirmation token is invalid"                  => "Confirmation token is invalid",
    "the email has already been confirmed"               => I18n.t("errors.messages.already_confirmed")
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
