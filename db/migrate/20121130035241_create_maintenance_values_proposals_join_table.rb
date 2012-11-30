class CreateMaintenanceValuesProposalsJoinTable < ActiveRecord::Migration
  def change
    create_table :maintenance_values_proposals, id: false do |t|
      t.integer :maintenance_value_id
      t.integer :proposal_id
    end

    add_index :maintenance_values_proposals, :maintenance_value_id
    add_index :maintenance_values_proposals, :proposal_id
  end
end
