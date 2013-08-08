class PreferenceListsController < ApplicationController
  before_filter :create_preference_list

  def configure_preference_list
    @all_neighborhoods = Neighborhood.all
    @all_brokers = Broker.all
    @renter_neighborhoods = current_renter.preference_list.neighborhoods || []
    @renter_brokers = current_renter.preference_list.brokers || []
    @renter_amenities = get_selected_amenities(current_renter.preference_list)
    @all_amenities = ['Reception', 'Light', 'Shower', 'Move_in', 'High_ceiling', 'Patio', 'Furniture']
    render :edit
  end


  def add_neighborhood
    p 'ADD NEIGHBORHOOD'
    p params
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    preference_list = current_renter.preference_list
    if preference_list.neighborhoods.include? @neighborhood
      @neighborhood = ""
    else
      preference_list.neighborhoods << @neighborhood
      preference_list.save
    end
    respond_to do |format|
      format.js
    end
  end

  def add_broker
    p 'ADD BROKER'
    p params
    @broker = Broker.find(params[:broker_id])
    preference_list = current_renter.preference_list 
    if preference_list.brokers.include? @broker
      @broker = ""
    else
      preference_list.brokers << @broker
    end
    respond_to do |format|
      format.js
    end
  end

  def add_amenity
    p 'ADD AMENITY'
    p params
    @amenity = params[:amenity]
    preference_list = current_renter.preference_list
    preference_list.reception = true if @amenity == 'Reception'
    preference_list.light = true if @amenity == 'Light'
    preference_list.shower = true if @amenity == 'Shower'
    preference_list.move_in = true if @amenity == 'Move_in'
    preference_list.high_ceiling = true if @amenity == 'High_ceiling'
    preference_list.patio = true if @amenity == 'Patio'
    preference_list.furniture = true if @amenity == 'Furniture'
    preference_list.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    p 'DELETE PREFERENCE LIST'
    PreferenceList.find(params[:id]).delete
    respond_to do |format|
      format.js
    end
  end

  private
  def create_preference_list
    if !current_renter.preference_list
      preference_list = PreferenceList.new()
      preference_list.renter = current_renter
      current_renter.preference_list = preference_list
      preference_list.save
      current_renter.save
    end
  end

  def get_selected_amenities(preference_list)    
    amenities_list = []
    amenities_list << 'Reception' if preference_list.reception == true
    amenities_list << 'Light' if preference_list.light == true
    amenities_list << 'Shower' if preference_list.shower == true
    amenities_list << 'Move_in' if preference_list.move_in == true
    amenities_list << 'High_ceiling' if preference_list.high_ceiling == true
    amenities_list << 'Patio' if preference_list.patio == true
    amenities_list << 'Furniture' if preference_list.furniture == true
    amenities_list
  end
end
