# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  image             :text
#  office_listing_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  link_image        :text
#

class Image < ActiveRecord::Base
  attr_accessible :office_listing_id, :image, :link_image

  belongs_to :office_listing

  mount_uploader :image, OfficeImagesUploader
end
