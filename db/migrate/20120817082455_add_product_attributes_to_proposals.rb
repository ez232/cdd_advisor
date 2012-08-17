class AddProductAttributesToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :product_weight, :float
    add_column :proposals, :product_colour, :string
  end
end
