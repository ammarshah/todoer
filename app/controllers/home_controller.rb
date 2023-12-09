class HomeController < ApplicationController
  before_action :redirect_to_app, if: :user_signed_in?

  def index
    @tagline = Tagline::DEFAULT_TAGLINE
  end

  private

  def redirect_to_app
    redirect_to app_url
  end
end
