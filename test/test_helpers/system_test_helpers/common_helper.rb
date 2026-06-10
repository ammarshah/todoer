require "test_helpers/system_test_helpers/session_helper"

module CommonHelper
  include SessionHelper

  def email_confirmation_required_message
    I18n.t("devise.registrations.signed_up_but_unconfirmed")
  end

  def email_already_confirmed_message
    I18n.t("errors.messages.already_confirmed")
  end

  def create_unconfirmed_user
    users(:default).tap do |user|
      user.update!(confirmed_at: nil)
    end
  end
end
