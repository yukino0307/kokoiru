class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :image,              null: false
      t.string :address,            null: false, index: true
      t.float :latitude,            null: false
      t.float :longitude,           null: false
      t.references :post,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
