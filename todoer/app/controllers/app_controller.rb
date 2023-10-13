class AppController < ApplicationController
  before_action :redirect_to_home, unless: :user_signed_in?

  def index
  end

  private

  def redirect_to_home
    redirect_to root_path
  end
end
