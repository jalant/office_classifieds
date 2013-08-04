# == Schema Information
#
# Table name: favorites
#
#  id                :integer          not null, primary key
#  renter_id         :integer
#  office_listing_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Favorite < ActiveRecord::Base
  attr_accessible :office_listing_id, :renter_id

  belongs_to :office_listing
  belongs_to :renter
end
