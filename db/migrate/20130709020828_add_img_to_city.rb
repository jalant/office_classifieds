class AddImgToCity < ActiveRecord::Migration
  def change
    add_column :cities, :img, :string
  end
end
