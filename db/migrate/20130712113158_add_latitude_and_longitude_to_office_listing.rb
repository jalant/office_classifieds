class AddLatitudeAndLongitudeToOfficeListing < ActiveRecord::Migration
  def change
    add_column :office_listings, :latitude, :float
    add_column :office_listings, :longitude, :float
  end
end
