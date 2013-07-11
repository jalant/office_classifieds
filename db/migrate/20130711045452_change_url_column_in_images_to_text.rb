class ChangeUrlColumnInImagesToText < ActiveRecord::Migration
  def change
    remove_column(:images, :url)
    add_column(:images, :url, :text)
  end

  def down
  end
end
