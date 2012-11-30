class CreateMaterialValues < ActiveRecord::Migration
  def change
    create_table :material_values do |t|
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
