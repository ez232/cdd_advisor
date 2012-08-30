class AddNewGripsToHandles < ActiveRecord::Migration
  def change
    add_column :handles, :pinch_grip_2, :boolean
    add_column :handles, :disc_grip_2, :boolean
  end
end
