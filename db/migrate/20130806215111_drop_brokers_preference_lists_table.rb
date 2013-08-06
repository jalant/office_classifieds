class DropBrokersPreferenceListsTable < ActiveRecord::Migration
  def change
    drop_table :brokers_preference_lists
  end
end
