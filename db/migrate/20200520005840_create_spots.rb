class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :address,            null: false
      t.float :latitude
      t.float :longitude
      t.references :post,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
