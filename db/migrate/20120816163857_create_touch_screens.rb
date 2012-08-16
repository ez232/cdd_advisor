class CreateTouchScreens < ActiveRecord::Migration
  def change
    create_table :touch_screens do |t|
      t.integer :proposal_id
      t.string :button_shape
      t.float :button_length_or_radius
      t.float :button_width
      t.float :button_height
      t.string :scroll_bar_shape
      t.float :scroll_bar_length_or_radius
      t.float :scroll_bar_width
      t.float :scroll_bar_height

      t.timestamps
    end
  end
end
