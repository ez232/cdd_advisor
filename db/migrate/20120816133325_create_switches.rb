class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.integer :proposal_id
      t.string :name
      t.boolean :pressing
      t.boolean :pushing
      t.boolean :pulling
      t.boolean :turning
      t.boolean :sliding
      t.string :shape
      t.float :length_or_external_diameter
      t.float :width
      t.float :height
      t.float :force_required
      t.string :colour
      t.string :background_colour
      t.boolean :pinch_grip
      t.boolean :span_grip
      t.boolean :spherical_grip
      t.boolean :disc_grip
      t.boolean :flat_hand_push
      t.boolean :one_finger_press
      t.boolean :two_fingers_press
      t.boolean :thumb_press
      t.boolean :pinch_grip_2
      t.boolean :disc_grip_2

      t.timestamps
    end
  end
end
