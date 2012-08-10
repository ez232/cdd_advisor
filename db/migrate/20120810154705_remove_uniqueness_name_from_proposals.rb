class RemoveUniquenessNameFromProposals < ActiveRecord::Migration
  def up
    remove_index :proposals, :name
  end

  def down
    add_index :proposals, :name, unique: true
  end
end
