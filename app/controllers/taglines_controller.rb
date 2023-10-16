class TaglinesController < ApplicationController
  def index
    taglines = Tagline.pluck(:text)

    render json: taglines
  end
end
