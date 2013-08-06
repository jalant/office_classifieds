class AddBrokersPreferenceListsTable < ActiveRecord::Migration
  def change
   create_table :brokers_preference_lists, id: false do |t|
     t.integer :broker_id
     t.integer :preference_list_id
    end
  end
end
