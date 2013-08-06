class AddPreferenceListIdToRenters < ActiveRecord::Migration
  def change
    add_column :renters, :preference_list_id, :integer
  end
end
