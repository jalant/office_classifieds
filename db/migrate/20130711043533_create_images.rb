class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image
      t.integer :office_listing_id

      t.timestamps
    end
  end
end
