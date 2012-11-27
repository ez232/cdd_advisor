class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.integer :project_id
      t.float :product_weight

      # Other attributes
      t.string :manufacturing
      t.string :key_components_mechanics
      t.string :key_components_electronics
      t.string :key_components_fixing
      t.string :material
      t.string :finishing
      t.string :maintenance

      t.timestamps
    end
  end
end
