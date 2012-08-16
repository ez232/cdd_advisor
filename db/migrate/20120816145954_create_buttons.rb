class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.integer :proposal_id
      t.boolean :pressing
      t.boolean :pushing
      t.boolean :pulling
      t.boolean :turning
      t.boolean :sliding
      t.string :shape
      t.float :length_or_radius
      t.float :width
      t.float :height
      t.float :force_required
      t.string :colour
      t.string :background_colour
      t.boolean :one_finger_press
      t.boolean :two_fingers_press
      t.boolean :thumb_press

      t.timestamps
    end
  end
end
