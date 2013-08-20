class ViewingsController < ApplicationController 

  def index
    @viewings = OfficeListing.find(params[:office_listing_id]).viewings
    respond_to do |format|
      format.js
      format.html { redirect_to root_path  }
    end
  end

  def new
    @viewing = Viewing.new
    @viewing.office_listing_id = params[:office_listing_id]
    respond_to do |format|
      format.js
      format.html { redirect_to root_path } # temporary for non-JS tests to pass
    end
  end

  def create
    p params
    start_time = params[:start_time].to_time
    end_time = params[:end_time].to_time 
    date = params[:date].to_date
    @viewing = Viewing.new(office_listing_id: params[:office_listing_id], start_time: start_time, end_time: end_time, date: date)
    current_broker.office_listings.find(params[:office_listing_id]).viewings << @viewing

    OfficeListing.find(params[:office_listing_id]).add_viewing(@viewing)
    
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

  def destroy
    viewing = Viewing.find(params[:id])
    current_broker.remove_viewing(viewing)
    viewing.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
