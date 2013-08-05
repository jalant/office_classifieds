class AddNeighborhoodsPreferenceLists < ActiveRecord::Migration
  def change
    create_table :neighborhoods_preference_lists, id: false do |t|
      t.integer :neighborhood_id
      t.integer :preference_list_id
    end
  end
end
