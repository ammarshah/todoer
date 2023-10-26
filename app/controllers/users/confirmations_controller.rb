class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /confirmation?confirmation_token=abcdef
  def show
    super do |resource|
      # Auto login after confirmation
      sign_in(resource) if resource.errors.empty?
    end
  end
end
