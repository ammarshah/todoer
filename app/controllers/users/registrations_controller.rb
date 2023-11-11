class Users::RegistrationsController < Devise::RegistrationsController

  protected

  # We want to require a password checks only when updating resource's password
  def update_resource(resource, params)
    if (params.keys & ["current_password", "password", "password_confirmation"]).any?
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end
end
