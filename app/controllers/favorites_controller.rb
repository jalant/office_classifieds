class FavoritesController < ApplicationController

  def index
  	renter = Renter.find(params[:renter_id])
  	@favorites = Favorite.where("renter_id = #{renter.id}")
    @appointments = Appointment.where("renter_id = #{renter.id}")
  end

  def new
    @favorite = Favorite.new
    respond_to do |format|
      format.js
      format.html { redirect_to root_path } # temporary for non-JS tests to pass
    end
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.renter = current_renter

    if @favorite && @favorite.save == true
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    else
      respond_to do |format|
        @failure_message = "Unable to create viewing."
        format.js
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    current_renter.remove_favorite(favorite)
    favorite.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
