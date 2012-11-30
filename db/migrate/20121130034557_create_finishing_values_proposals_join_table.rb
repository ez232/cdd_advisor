class CreateFinishingValuesProposalsJoinTable < ActiveRecord::Migration
  def change
    create_table :finishing_values_proposals, id: false do |t|
      t.integer :finishing_value_id
      t.integer :proposal_id
    end

    add_index :finishing_values_proposals, :finishing_value_id
    add_index :finishing_values_proposals, :proposal_id
  end
end
