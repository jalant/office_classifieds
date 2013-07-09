class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :renter_id
      t.integer :office_listing_id

      t.timestamps
    end
  end
end
