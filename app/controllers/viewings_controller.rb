class ViewingsController < ApplicationController
  def new
    @viewing = Viewing.new
    respond_to do |format|
      format.js
      format.html { redirect_to root_path } # temporary for non-JS tests to pass
    end
  end

  def create
    @viewing = Viewing.new(params[:viewing])
    @viewing.broker = current_broker
    @viewing.office_listing = params[:office_listing_id]

    p @viewing.save

    if @viewing && @viewing.save == true
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    else
      respond_to do |format|
        @failure_message = "Unable to create viewing."
        format.js
        format.html { redirect_to root_path }
      end
    end
  end
end
