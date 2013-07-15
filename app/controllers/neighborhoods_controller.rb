class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.find_all_by_city_id(params[:city_id])
    @city = City.find(params[:city_id])
  end

  def show
  end

  def add_listing
  	@neighborhoods = Neighborhood.all
    @city = City.find(params[:city_id])
  end
end
