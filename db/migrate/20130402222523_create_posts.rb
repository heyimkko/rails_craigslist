class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :price
      t.integer :category_id
      t.string :key
      t.string :email

      t.timestamps
    end
  end
end
