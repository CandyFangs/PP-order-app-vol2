class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :category_id
      t.string :user
      t.integer :product_id

      t.timestamps
    end
  end
end
