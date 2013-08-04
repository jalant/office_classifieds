# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  viewing_id :integer
#  renter_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Appointment < ActiveRecord::Base
  belongs_to :renter
  belongs_to :viewing
end
