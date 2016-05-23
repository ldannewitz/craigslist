class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :location, null: false
      t.decimal :price
      t.string :image
      t.string :email, null: false
      t.integer :category_id, null: false

      t.timestamps null: false
    end
  end
end
