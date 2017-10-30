class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.integer :material_id
      t.string :color
      t.attachment :picture

      t.timestamps
    end
  end
end
