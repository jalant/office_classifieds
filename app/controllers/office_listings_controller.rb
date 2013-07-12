class OfficeListingsController < ApplicationController
  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @office_listings = OfficeListing.where("neighborhood_id = #{@neighborhood.id}")
    # images_list = []
    # @office_listings.select do |office_listing|
    #   select_boolean = images_list.include? office_listing.images[0].image
    #   images_list << office_listing.images[0].image
    #   select_boolean
    # end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @office_listing = OfficeListing.new
  end

  def show
    @office_listing = OfficeListing.find(params[:id])
  end

  def create
    office_listing = OfficeListing.create(params[:office_listing])
    if office_listing && office_listing.save
      redirect_to new_city_neighborhood_office_listing_path
    else
      redirect_to new_city_neighborhood_office_listing_path
    end
  end
end
