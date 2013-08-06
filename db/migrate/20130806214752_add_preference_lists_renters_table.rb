class AddPreferenceListsRentersTable < ActiveRecord::Migration
  aef change
    create_table :renters_preference_lists, id: false do |t|
      t.integer :renter_id
      t.integer :preference_list_id
    end
  end
end
