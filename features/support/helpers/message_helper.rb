module MessageHelper
  TEXT_TO_MESSAGE_MAPPINGS = {
    "I have to confirm my email to activate the account"        => I18n.t("devise.registrations.signed_up_but_unconfirmed"),
    "a full name is required"                                   => "Full name can't be blank",
    "the full name must be maximum 80 characters long"          => "Full name is too long (maximum is 80 characters)",
    "an email is required"                                      => "Email can't be blank",
    "the email format is invalid"                               => "Email is invalid",
    "the email already exists"                                  => "Email has already been taken",
    "a password is required"                                    => "Password can't be blank",
    "the password must be minimun 8 characters long"            => "Password is too short (minimum is 8 characters)",
    "the password must be maximum 70 characters long"          => "Password is too long (maximum is 70 characters)",
    "the email has been confirmed"                              => I18n.t("devise.confirmations.confirmed"),
    "the confirmation token is invalid"                         => "Confirmation token is invalid",
    "the email is already confirmed"                            => I18n.t("errors.messages.already_confirmed"),
    "I am logged in"                                            => I18n.t("devise.sessions.signed_in"),
    "the email is not confirmed"                                => "You have to confirm your email address before continuing. Resend me confirmation instructions.",
    "the email or password is invalid"                          => "Invalid Email or Password",
    "the confirmation instructions has been sent to my email"   => I18n.t("devise.confirmations.send_instructions"),
    "the reset password instructions has been sent to my email" => I18n.t("devise.passwords.send_instructions"),
    "the email is not found"                                    => "Email not found",
    "my password has been changed successfully"                 => I18n.t("devise.passwords.updated_not_active"),
    "the reset password link is invalid"                        => "Reset password token is invalid",
    "the password was previously used"                          => I18n.t("errors.messages.taken_in_past"),
    "the reset password token is invalid"                       => "Reset password token is invalid",
    "my account is updated successfully"                        => "Your account has been updated successfully",
    "the current password is required"                          => "Current password can't be blank",
    "the new passwords do not match"                            => "Password confirmation doesn't match Password",
    "I am no longer considered a Todoer"                        => "Your account has been successfully deleted. Please don't call yourself a Todoer anymore until you Register again!",
    "a title is required"                                       => "Title can't be blank"
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
