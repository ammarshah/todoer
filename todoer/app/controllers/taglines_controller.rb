class TaglinesController < ApplicationController
  def random
    tagline = Tagline.random(exclude_id: params[:exclude_id])

    respond_to do |format|
      format.json do
        render json: tagline.to_json
      end
    end
  end
end
