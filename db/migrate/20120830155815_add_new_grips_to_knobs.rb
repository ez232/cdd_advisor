class AddNewGripsToKnobs < ActiveRecord::Migration
  def change
    add_column :knobs, :pinch_grip_2, :boolean
    add_column :knobs, :disc_grip_2, :boolean
  end
end
