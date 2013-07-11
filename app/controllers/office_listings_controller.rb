class OfficeListingsController < ApplicationController
  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @office_listings = OfficeListing.where("neighborhood_id = #{@neighborhood.id}")
    address_list = []
    @office_listings.select do |office_listing|
      select_boolean = address_list.include? office_listing.images[0]
      images_list << office_listing.images[0]
      select_boolean
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
