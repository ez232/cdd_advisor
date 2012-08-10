class AddShapeIdsToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :handle_shape_id, :integer
    add_column :proposals, :switch_shape_id, :integer
    add_column :proposals, :knob_shape_id, :integer
    add_column :proposals, :button_shape_id, :integer
    add_column :proposals, :scrollbar_shape_id, :integer
  end
end
