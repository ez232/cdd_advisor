class CreateManufacturingValuesProposalsJoinTable < ActiveRecord::Migration
  def change
    create_table :manufacturing_values_proposals, id: false do |t|
      t.integer :manufacturing_value_id
      t.integer :proposal_id
    end

    add_index :manufacturing_values_proposals, :manufacturing_value_id
    add_index :manufacturing_values_proposals, :proposal_id
  end
end
