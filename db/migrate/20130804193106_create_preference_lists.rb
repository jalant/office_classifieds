class CreatePreferenceLists < ActiveRecord::Migration
  def change
    create_table :preference_lists do |t|
      t.integer :renter_id
      t.integer :min_price
      t.integer :max_price
      t.integer :min_sq_feet
      t.integer :max_sq_feet
      t.boolean :kitchen
      t.boolean :reception
      t.boolean :light
      t.boolean :shower
      t.boolean :high_ceiling
      t.boolean :move_in
      t.boolean :patio
      t.boolean :furniture

      t.timestamps
    end
  end
end
