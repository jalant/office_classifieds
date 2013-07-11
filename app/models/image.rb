class Image < ActiveRecord::Base
  attr_accessible :office_listing_id, :image, :remote_image_url

  belongs_to :office_listing

  # mount_uploader :image, OfficeImages
end
