class CreateMaterialValuesProposalsJoinTable < ActiveRecord::Migration
  def change
    create_table :material_values_proposals, id: false do |t|
      t.integer :material_value_id
      t.integer :proposal_id
    end

    add_index :material_values_proposals, :material_value_id
    add_index :material_values_proposals, :proposal_id
  end
end
