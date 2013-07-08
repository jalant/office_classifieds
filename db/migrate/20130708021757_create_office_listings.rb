class CreateOfficeListings < ActiveRecord::Migration
  def change
    create_table :office_listings do |t|
      t.string :address
      t.string :office_type
      t.integer :size
      t.integer :rent
      t.text :details
      t.boolean :kitchen
      t.boolean :reception
      t.boolean :light
      t.boolean :shower
      t.boolean :move_in
      t.boolean :high_ceiling
      t.boolean :patio
      t.boolean :furniture
      t.string :term_length
      t.string :availability
      t.integer :no_of_offices
      t.integer :no_of_conference_rooms
      t.integer :neighborhood_id
      t.integer :broker_id

      t.timestamps
    end
  end
end
