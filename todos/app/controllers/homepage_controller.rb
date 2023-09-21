class HomepageController < ApplicationController
  def index
    @tagline = Tagline.find(1)
  end
end
