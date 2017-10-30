class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :brand

      t.timestamps
    end
  end
end
