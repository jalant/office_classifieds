class Image < ActiveRecord::Base
  attr_accessible :office_listing_id, :url

  belongs_to :office_listing
end
