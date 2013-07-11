class ChangeUrlColumnInImagesToText < ActiveRecord::Migration
  def change
    remove_column(:images, :url)
    add_column(:images, :image, :text)
  end

  def down
  end
end
