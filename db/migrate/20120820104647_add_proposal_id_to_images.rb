class AddProposalIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :proposal_id, :integer
  end
end
