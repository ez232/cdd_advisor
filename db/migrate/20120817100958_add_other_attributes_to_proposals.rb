class AddOtherAttributesToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :manufacturing, :string
    add_column :proposals, :key_components_mechanics, :string
    add_column :proposals, :key_components_electronics, :string
    add_column :proposals, :key_components_fixing, :string
    add_column :proposals, :material, :string
    add_column :proposals, :finishing, :string
    add_column :proposals, :maintenance, :string
  end
end
