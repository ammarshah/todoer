class ApproachmentsController < ApplicationController
  def new
    @approachment = Approachment.new
  end

  def create
    @approachment = Approachment.new(approachment_params)

    respond_to do |format|
      if @approachment.save
        format.html { redirect_to root_url, notice: "Thank you! We've received your message and will respond ASAP!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def approachment_params
    params.require(:approachment).permit(:name, :email, :subject, :message)
  end
end
