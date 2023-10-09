class HomepageController < ApplicationController
  def index
    @tagline = Tagline::DEFAULT_TAGLINE
  end
end
