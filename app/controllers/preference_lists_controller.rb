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
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    preference_list = current_renter.preference_list
    if preference_list.neighborhoods.include? @neighborhood
      @neighborhood = ""
    else
      preference_list.neighborhoods << @neighborhood
      preference_list.activated = true if !preference_list.activated
      preference_list.save
      current_renter.save
    end
    respond_to do |format|
      format.js
    end
  end

  def remove_neighborhood
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    preference_list = current_renter.preference_list
    preference_list.neighborhoods.delete(@neighborhood)
    preference_list.save
    respond_to do |format|
      format.js
    end
  end

  def add_broker
    @broker = Broker.find(params[:broker_id])
    preference_list = current_renter.preference_list 
    if preference_list.brokers.include? @broker
      @broker = ""
    else
      preference_list.brokers << @broker
      preference_list.activated = true if !preference_list.activated
      preference_list.save
    end
    respond_to do |format|
      format.js
    end
  end

  def remove_broker
    @broker = Broker.find(params[:broker_id])
    preference_list = current_renter.preference_list
    preference_list.brokers.delete(@broker)
    preference_list.save
    respond_to do |format|
      format.js
    end
  end

  def add_amenity
    @amenity = params[:amenity]
    preference_list = current_renter.preference_list
    if !preference_list[@amenity.downcase]
      preference_list[@amenity.downcase] =  true
    else
      @amenity = ""
    end
    preference_list.save
    respond_to do |format|
      format.js
    end
  end

  def remove_amenity
    @amenity = params[:amenity]
    preference_list = current_renter.preference_list
    preference_list[@amenity.downcase] = false
    preference_list.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
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
