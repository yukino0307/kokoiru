class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title,              null: false, index: true
      t.text :explanarion,          null: false, index: true
      t.references :user,           null: false, foreign_key: true
      t.datetime :created_at,
      t.timestamps
    end
  end
end
