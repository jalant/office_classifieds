class AddRemoteImageUrlToImages < ActiveRecord::Migration
  def change
    add_column(:images, :remote_image_url, :text)
  end
end
