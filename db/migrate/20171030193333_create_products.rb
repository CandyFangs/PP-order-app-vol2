class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :kind
      t.string :model
      t.string :description
      t.integer :price
      t.attachment :picture
      t.integer :category_id

      t.timestamps
    end
  end
end
