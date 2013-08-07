class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.find_all_by_city_id(params[:city_id])
    @city = City.find(params[:city_id])
    @city_name = @city.name
  end

  def show
  end

  def add_listing
  	@neighborhoods = Neighborhood.all
    @city = City.find_by_name('New York') # get rid of this diabolical hardcoded bullshit ASAP
  end
end
