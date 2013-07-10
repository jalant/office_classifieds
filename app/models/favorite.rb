class Favorite < ActiveRecord::Base
  attr_accessible :office_listing_id, :renter_id

  belongs_to :office_listing
  belongs_to :renter



end
