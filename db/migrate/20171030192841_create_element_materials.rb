class CreateElementMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :element_materials do |t|
      t.integer :element_id
      t.integer :material_id

      t.timestamps
    end
  end
end
