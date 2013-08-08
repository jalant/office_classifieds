class AppointmentsController < ApplicationController

  def index 
    appointments = Appointment.find_all_by_renter_id(params[:renter_id])
    @viewings = []
    appointments.each do |appointment|
      @viewings << appointment.viewing
    end

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end  
  end 

  def create
    @viewing = Viewing.find(params[:viewing_id])
    current_renter.add_appointment(@viewing)
    current_renter.save
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @viewing = Viewing.find(params[:viewing_id])
    current_renter.remove_appointment(@viewing)
    current_renter.save
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
