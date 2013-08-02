class FavoritesController < ApplicationController

  def index
  	renter = Renter.find(params[:renter_id])
  	@favorites = Favorite.where("renter_id = #{renter.id}")
    @appointments = Appointment.where("renter_id = #{renter.id}")
  end

end
