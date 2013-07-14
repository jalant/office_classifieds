class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all
    @city = City.find(params[:city_id])
  end

  def show
  end

  def add_listing
  	@neighborhoods = Neighborhood.all
    @city = City.find(params[:city_id])
  end
end
