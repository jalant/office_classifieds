class AddActivatedToPreferenceList < ActiveRecord::Migration
  def change
    add_column :preference_lists, :activated, :boolean
  end
end
