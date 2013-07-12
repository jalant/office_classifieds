class AddLatitudeAndLongitudeToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :latitude, :float
    add_column :neighborhoods, :longitude, :float
    add_column :neighborhoods, :address,	 :text
  end
end
