class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all
    @city = City.find(params[:city_id])
  end

  def show
  end
end
