class DropRemoteImageUrlFieldAndAddLinkImageToImages < ActiveRecord::Migration
  def change
    add_column :images, :link_image, :text
  end
end
