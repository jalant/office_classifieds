class ImagesController < ApplicationController
  def create
    @image = Image.new(params[:image])
    @image.office_listing = OfficeListing.find(params[:office_listing_id])
    if @image && @image.save!
      respond_to do |format|
        format.js { render :create }
      end
    else
      @failure = "Unable to upload image. :-("
      format.js
    end
  end
end
