class PreferenceListsController < ApplicationController
  def edit
    @all_neighborhoods = Neighborhood.all
    @renter_neighborhoods = current_renter.preference_list.neighborhoods
    @brokers = Broker.all
  end


  def add_neighborhood
    @neighborhood = Neighborhood.find_by_name(params[:neighborhood])
    preference_list = PreferenceList.find(params[:id])
    @neighborhood = "" if preference_list.neighborhoods.include? @neighborhood
    respond_to do |format|
      format.js
    end
  end

  def add_broker
    @broker = Neighborhood.find_by_name(params[:broker])
    preference_list = PreferenceList.find(params[:id])
    @broker = "" if preference_list.brokers.include? @broker
    respond_to do |format|
      format.js
    end
  end

  def add_amenity
  end
end
