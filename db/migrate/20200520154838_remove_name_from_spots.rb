class RemoveNameFromSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :create_at, :datetime
    remove_column :spots, :update_at, :datetime
  end
end
