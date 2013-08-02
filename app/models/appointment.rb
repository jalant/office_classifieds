class Appointment < ActiveRecord::Base
  belongs_to :renter
  belongs_to :viewing
end
