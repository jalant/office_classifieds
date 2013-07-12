class RemoveRemoteImageUrlFromImages < ActiveRecord::Migration
  def change
    remove_column(:images, :remote_image_url)
  end
end
