class OfficeListingsController < ApplicationController
  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @office_listings = OfficeListing.where("neighborhood_id = #{@neighborhood.id}")
  end
  
  def new
    @office_listing = OfficeListing.new
    @image = Image.new
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @city = City.find(params[:city_id])
    @office_types = ['Lease', 'Purchase', 'Workspace']
    @term_lengths = ['Less than one year', '1-5 years', '5-10 years', '10+ years']
    @availabilities = ['Immediate', 'Delayed'] 
    @amenities = ['Reception', 'Light', 'Shower', 'Move_in', 'High_ceiling', 'Patio', 'Furniture']
  end

  def show
    @office_listing = OfficeListing.find(params[:id])
  end

  def create
    selected_amenities = params[:amenities] || [] # empty list if no amenities checked
    @office_listing = OfficeListing.new(params[:office_listing])
    puts "CURRENT BROKER: #{current_broker}"
    @office_listing.broker = current_broker
    @office_listing.neighborhood = Neighborhood.find(params[:neighborhood_id])
    if @office_listing && @office_listing.save!
      @path = city_neighborhood_office_listing_path(@office_listing, :city_id => @office_listing.neighborhood.city.id, :neighborhood_id => @office_listing.neighborhood.id)
      create_amenities(@office_listing, selected_amenities)
      respond_to do |format|
        format.js
      end
    else
      @failure = "Unable to create office :-("
      format.js
    end
  end

  private

  def create_amenities(office_listing, selected_amenities)
    office_listing.reception = true if selected_amenities.include? 'Reception'
    office_listing.light = true if selected_amenities.include? 'Light'
    office_listing.shower = true if selected_amenities.include? 'Shower'
    office_listing.move_in = true if selected_amenities.include? 'Move_in'
    office_listing.high_ceiling = true if selected_amenities.include? 'High_ceiling'
    office_listing.patio = true if selected_amenities.include? 'Patio'
    office_listing.furniture = true if selected_amenities.include? 'Furniture'
    office_listing.save
  end

end
