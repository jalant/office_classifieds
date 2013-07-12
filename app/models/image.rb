class Image < ActiveRecord::Base
  attr_accessible :office_listing_id, :image, :link_image

  belongs_to :office_listing

  mount_uploader :image, OfficeImagesUploader
end
