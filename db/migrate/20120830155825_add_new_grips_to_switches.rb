class AddNewGripsToSwitches < ActiveRecord::Migration
  def change
    add_column :switches, :pinch_grip_2, :boolean
    add_column :switches, :disc_grip_2, :boolean
  end
end
