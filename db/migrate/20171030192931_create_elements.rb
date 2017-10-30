class CreateElements < ActiveRecord::Migration[5.1]
  def change
    create_table :elements do |t|
      t.integer :material_id
      t.integer :product_id
      t.string :name

      t.timestamps
    end
  end
end
