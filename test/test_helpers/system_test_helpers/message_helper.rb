module MessageHelper
  def logged_in_message
    I18n.t("devise.sessions.signed_in")
  end

  def email_confirmation_required_message
    I18n.t("devise.registrations.signed_up_but_unconfirmed")
  end

  def email_confirmed_message
    I18n.t("devise.confirmations.confirmed")
  end

  def email_already_confirmed_message
    I18n.t("errors.messages.already_confirmed")
  end

  def email_confirmation_instructions_sent_message
    I18n.t("devise.confirmations.send_instructions")
  end

  def reset_password_instructions_sent_message
    I18n.t("devise.passwords.send_instructions")
  end

  def password_used_previously_message
    I18n.t("errors.messages.taken_in_past")
  end

  def password_updated_message
    I18n.t("devise.passwords.updated")
  end

  def title_cant_be_blank_message
    "Title can't be blank"
  end

  def title_is_too_long_message
    "Title is too long (maximum is 1000 characters)"
  end

  def approachment_received_message
    "Thank you! We've received your message and will respond ASAP!"
  end

  def name_cant_be_blank_message
    "Name can't be blank"
  end

  def email_cant_be_blank_message
    "Email can't be blank"
  end

  def subject_cant_be_blank_message
    "Subject can't be blank"
  end

  def message_cant_be_blank_message
    "Message can't be blank"
  end

  def account_updated_message
    "Your account has been updated successfully"
  end

  def current_password_cant_be_blank_message
    "Current password can't be blank"
  end

  def passwords_dont_match_message
    "Password confirmation doesn't match Password"
  end

  def confirmation_token_invalid_message
    "Confirmation token is invalid"
  end

  def invalid_email_or_password_message
    "Invalid email or password"
  end

  def account_deleted_message
    "Your account has been successfully deleted. Please don't call yourself a Todoer anymore until you Register again!"
  end

  def confirm_your_email_message
    "You have to confirm your email address before continuing."
  end

  def resend_me_confirmation_instructions_message
    "Resend me confirmation instructions"
  end

  def full_name_cant_be_blank_message
    "Full name can't be blank"
  end

  def password_cant_be_blank_message
    "Password can't be blank"
  end

  def full_name_is_too_long_message
    "Full name is too long (maximum is 80 characters)"
  end

  def email_is_invalid_message
    "Email is invalid"
  end

  def password_is_too_short_message
    "Password is too short (minimum is 8 characters)"
  end

  def password_is_too_long_message
    "Password is too long (maximum is 70 characters)"
  end

  def email_already_taken_message
    "Email has already been taken"
  end

  def email_not_found_message
    "Email not found"
  end

  def reset_password_token_invalid_message
    "Reset password token is invalid"
  end
end
