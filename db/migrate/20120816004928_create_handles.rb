class CreateHandles < ActiveRecord::Migration
  def change
    create_table :handles do |t|
      t.integer :proposal_id
      t.boolean :holding
      t.boolean :moving
      t.boolean :carrying
      t.string :shape
      t.float :length_or_radius
      t.float :width
      t.float :height
      t.boolean :pinch_grip
      t.boolean :power_grip
      t.boolean :span_grip
      t.boolean :spherical_grip
      t.boolean :cylindrical_grip
      t.boolean :disc_grip
      t.boolean :hook_grip
      t.boolean :flat_hand_push

      t.timestamps
    end
  end
end
